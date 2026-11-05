#pragma clang diagnostic ignored "-Wmissing-prototypes"

#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

struct dm_border_t { uint mask; float4 k[32]; };
static inline __attribute__((always_inline)) float4 dm_bmix(float4 r, float4 w, float4 k) { return r + (w - r) * k; }
static inline __attribute__((always_inline)) float dm_bmix(float r, float w, float4 k) { return r + (w - r) * k.x; }
template<typename V, typename T, typename... A> static inline __attribute__((always_inline)) V dm_bs(V r, constant dm_border_t* b, uint i, T t, sampler w, A... a)
{
    if (b->mask >> i & 1u) r = dm_bmix(r, t.sample(w, a...), b->k[i]);
    return r;
}

struct _10
{
    uint _m0;
    uint4 _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float4 _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct _27
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* cp_c3 [[id(1)]];
    constant _16* cp_c4 [[id(2)]];
    constant _16* cp_c6 [[id(3)]];
    constant _16* cp_c5 [[id(4)]];
    const device _27* cp_s0 [[id(5)]];
    texture2d<float> cp_t_tcb_C [[id(6)]];
    sampler cp_t_tcb_CSmplr [[id(7)]];
    texture2d_array<float> cp_t_tcb_8 [[id(8)]];
    sampler cp_t_tcb_8Smplr [[id(9)]];
    texture2d_array<float> cp_t_tcb_A [[id(10)]];
    sampler cp_t_tcb_ASmplr [[id(11)]];
    texture2d_array<float, access::write> cp_i_tcb_4A_ [[id(12)]];
    texture2d_array<float> cp_i_tcb_48_ [[id(13)]];
    sampler cp_t_tcb_CSmplr_w [[id(14)]];
    sampler cp_t_tcb_8Smplr_w [[id(15)]];
    sampler cp_t_tcb_ASmplr_w [[id(16)]];
    constant dm_border_t* dm_border [[id(17)]];
};

static inline __attribute__((always_inline))
int _60(thread const int& _1099, thread const int& _1100, constant _10& support_buffer)
{
    int _1103 = 1 + _1100;
    float _1105 = support_buffer._m5[_1103].x;
    bool _1107 = _1105 == 1.0;
    if (_1107)
    {
        return _1099;
    }
    float _1109 = float(_1099);
    float _1111 = _1109 * _1105;
    int _1113 = int(_1111);
    return _1113;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]])
{
    float _64 = as_type<float>(gl_WorkGroupID.y);
    float _66 = as_type<float>(gl_WorkGroupID.z);
    float _68 = as_type<float>(gl_WorkGroupID.x);
    int _70 = as_type<int>(_66) << 5;
    int _72 = _70 + as_type<int>(_64);
    int _74 = _72 << 4;
    int _76 = _74 + as_type<int>(_68);
    int _78 = _76 << 2;
    uint _81 = uint(int(uint(_78) >> uint(2)));
    float _83 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_81)]);
    float _85 = as_type<float>(gl_LocalInvocationID.x);
    float _87 = as_type<float>(gl_LocalInvocationID.y);
    int _89 = as_type<int>(_68) << 3;
    int _91 = _89 + as_type<int>(_85);
    int _93 = as_type<int>(_64) << 2;
    int _95 = _93 + as_type<int>(_87);
    bool _99 = as_type<int>(_83) != 0;
    if (!_99)
    {
        int3 _523 = int3(_91, _95, as_type<int>(_66));
        spvDescriptorSet0.cp_i_tcb_4A_.write(float4(0.0), uint2(_523.xy), uint(_523.z));
    }
    if (!_99)
    {
        return;
    }
    int _101 = as_type<int>(_66) + as_type<int>((*spvDescriptorSet0.cp_c3)._m0[16].z);
    float _103 = float(_91);
    int _105 = _101 << 4;
    float _107 = float(_95);
    float _109 = _103 + 0.5;
    int _111 = _105 + 4;
    uint _113 = uint(int(uint(_111) >> uint(2)));
    uint _115 = uint(int(uint(int(_113)) >> uint(2)));
    int _117 = int(_113) & 3;
    float _119 = (*spvDescriptorSet0.cp_c3)._m0[int(_115)][_117];
    float _121 = _107 + 0.5;
    int _123 = _105 + 12;
    uint _125 = uint(int(uint(_123) >> uint(2)));
    uint _127 = uint(int(uint(int(_125)) >> uint(2)));
    int _129 = int(_125) & 3;
    float _131 = (*spvDescriptorSet0.cp_c3)._m0[int(_127)][_129];
    float _133 = 1.0 / _119;
    float _135 = _109 * _133;
    float _137 = _121 * _133;
    float _139 = _119 * _131;
    float _141 = _135 + (-0.5);
    float _143 = _137 + (-0.5);
    float _145 = fma(_139, _141, (*spvDescriptorSet0.cp_c3)._m0[16].x);
    float _147 = fma(_139, _143, (*spvDescriptorSet0.cp_c3)._m0[16].y);
    float _149 = fma(_145, 6.2500002968590706586837768554688e-05, 0.5);
    float _151 = fma(_147, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _621 = float2(_149, _151);
    float2 _155 = dm_bs(spvDescriptorSet0.cp_t_tcb_C.sample(spvDescriptorSet0.cp_t_tcb_CSmplr, select(_621, float2(0.0), isnan(_621)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_C, spvDescriptorSet0.cp_t_tcb_CSmplr_w, select(_621, float2(0.0), isnan(_621)), level(0.0)).xy;
    float _157 = _155.x;
    float _159 = _155.y;
    int _161 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[16].z) << 4;
    uint _163 = uint(int(uint(_161) >> uint(2)));
    uint _165 = uint(int(uint(int(_163)) >> uint(2)));
    int _167 = int(_163) & 3;
    float _169 = (*spvDescriptorSet0.cp_c4)._m0[int(_165)][_167];
    float _171 = float(as_type<int>(_66));
    float _173 = rint(_171);
    float _175 = precise::max(_173, 0.0);
    uint _177 = uint(_175);
    uint _179 = clamp(_177, 0u, 65535u);
    float _181 = fma(_157, 40.0, -20.0);
    float _183 = fma(_159, 40.0, -20.0);
    float _185 = -_181;
    float _187 = fma(_185, (*spvDescriptorSet0.cp_c6)._m0[0].z, _145);
    float _189 = -_183;
    float _191 = fma(_189, (*spvDescriptorSet0.cp_c6)._m0[0].z, _147);
    float _193 = -(*spvDescriptorSet0.cp_c4)._m0[16].x;
    float _195 = _187 + _193;
    float _197 = -(*spvDescriptorSet0.cp_c4)._m0[16].y;
    float _199 = _191 + _197;
    float _201 = abs(_195);
    float _203 = abs(_199);
    float _205 = precise::max(_201, _203);
    float _207 = fma(_205, 4.0, 4.0);
    float _209 = _207 * _169;
    float _211 = precise::max(_209, 1.0);
    float _213 = log2(_211);
    float _215 = floor(_213);
    bool _217 = _215 >= 5.0;
    bool _219 = isnan(_215);
    bool _221 = _217 || _219;
    bool _223 = isnan(5.0);
    bool _225 = _221 || _223;
    int _227 = as_type<int>(_209);
    float _229 = _199;
    float _231 = _141;
    float _233 = _137;
    if (!_225)
    {
        float _235 = floor(_213);
        int _237 = int(_235);
        _227 = _237;
    }
    int _239 = _227;
    int _241 = _239;
    if (!_225)
    {
        int _243 = min(_239, 4);
        _241 = _243;
    }
    int _245 = _241;
    int _247 = _245;
    if (!_225)
    {
        int _249 = _245 + as_type<int>((*spvDescriptorSet0.cp_c4)._m0[16].z);
        _247 = _249;
    }
    int _251 = _247;
    uint _253 = 0u;
    if (!_225)
    {
        int _255 = _251 << 4;
        _253 = uint(_255);
    }
    uint _257 = _253;
    int _259 = _91;
    int _261 = 4;
    int _263 = _60(_259, _261, (*spvDescriptorSet0.support_buffer));
    int _265 = _95;
    int _267 = 4;
    int _269 = _60(_265, _267, (*spvDescriptorSet0.support_buffer));
    int3 _782 = int3(_263, _269, as_type<int>(_66));
    float4 _272 = (spvDescriptorSet0.cp_i_tcb_48_.read(uint2(_782.xy), uint(_782.z)).xyzw);
    float _274 = _272.x;
    float _276 = _272.y;
    float _278 = _272.z;
    float _280 = _272.w;
    float _282 = as_type<float>(_257);
    if (!_225)
    {
        uint _284 = uint(int(uint(int(_257)) >> uint(2)));
        uint _286 = uint(int(uint(int(_284)) >> uint(2)));
        int _288 = int(_284) & 3;
        float _290 = (*spvDescriptorSet0.cp_c4)._m0[int(_286)][_288];
        _282 = _290;
    }
    float _292 = _282;
    float _294 = 0.0;
    if (!_225)
    {
        float _296 = rint(_215);
        float _298 = precise::max(_296, 0.0);
        uint _300 = uint(_298);
        uint _302 = clamp(_300, 0u, 65535u);
        _294 = as_type<float>(_302);
    }
    float _304 = _294;
    if (!_225)
    {
        float _306 = fma(_199, _292, 0.5);
        _229 = _306;
    }
    float _308 = _229;
    float _310 = 0.0;
    if (!_225)
    {
        float _312 = fma(_195, _292, 0.5);
        _310 = _312;
    }
    float _314 = _310;
    float _316 = _308;
    if (!_225)
    {
        float3 _862 = float3(_314, _308, float(as_type<int>(_304)));
        float3 _866 = select(_862, float3(0.0), isnan(_862));
        float _318 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, _866.xy, uint(rint(_866.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, _866.xy, uint(rint(_866.z)), level(0.0)).x;
        _316 = _318;
    }
    float _320 = _316;
    float3 _878 = float3(_135, _137, float(int(_179)));
    float3 _880 = select(_878, float3(0.0), isnan(_878));
    float _322 = dm_bs(spvDescriptorSet0.cp_t_tcb_A.sample(spvDescriptorSet0.cp_t_tcb_ASmplr, _880.xy, uint(rint(_880.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_A, spvDescriptorSet0.cp_t_tcb_ASmplr_w, _880.xy, uint(rint(_880.z)), level(0.0)).w;
    float _324 = -(*spvDescriptorSet0.cp_c3)._m0[16].y;
    float _326 = _147 + _324;
    float _328 = -(*spvDescriptorSet0.cp_c3)._m0[16].x;
    float _330 = _145 + _328;
    float _332 = 0.0;
    float _334 = _326;
    float _336 = _330;
    if (!_225)
    {
        _332 = 1.0;
    }
    float _338 = _332;
    float _340 = _326 * _326;
    if (!_225)
    {
        _334 = (*spvDescriptorSet0.cp_c5)._m0[1].x;
    }
    float _342 = _334;
    float _344 = fma(_330, _330, _340);
    if (!_225)
    {
        float _346 = fma(_342, -0.01666666753590106964111328125, _338);
        _336 = _346;
    }
    float _348 = _336;
    float _350 = -(*spvDescriptorSet0.cp_c5)._m0[1].z;
    float _352 = fma(_350, (*spvDescriptorSet0.cp_c5)._m0[1].z, _344);
    float _354 = _344;
    float _356 = _348;
    if (!_225)
    {
        float _358 = abs(_348);
        float _360 = log2(_358);
        _354 = _360;
    }
    float _362 = _354;
    float _364 = precise::max(0.0, _352);
    float _366 = _364 * (-1.4426949746848549693822860717773e-05);
    bool _368 = as_type<int>(_66) != 4;
    float _370 = exp2(_366);
    if (_225)
    {
        _356 = 0.0;
    }
    float _372 = _356;
    float _374 = _372;
    if (!_368)
    {
        float _376 = abs(_141);
        float _378 = abs(_143);
        float _380 = precise::max(_376, _378);
        _231 = _380;
    }
    float _382 = _231;
    float _384 = _382;
    if (!_368)
    {
        _233 = 20.0;
    }
    float _386 = _233;
    if (!_368)
    {
        float _388 = fma(_382, _386, -9.0);
        float _390 = precise::clamp(_388, 0.0, 1.0);
        _384 = _390;
    }
    float _392 = _384;
    float _394 = _392;
    if (!_368)
    {
        float _396 = -_392;
        float _398 = _396 + 1.0;
        _394 = _398;
    }
    float _400 = _394;
    float _402 = _276 * (*spvDescriptorSet0.cp_c5)._m0[0].z;
    float _404 = _276;
    if (!_225)
    {
        float _406 = precise::max(_338, (*spvDescriptorSet0.cp_c6)._m0[0].y);
        _404 = _406;
    }
    float _408 = _404;
    float _410 = _408;
    if (!_225)
    {
        float _412 = _408 * _362;
        _410 = _412;
    }
    float _414 = _410;
    float _416 = fma(_274, (*spvDescriptorSet0.cp_c5)._m0[0].x, _402);
    float _418 = _414;
    if (!_225)
    {
        float _420 = exp2(_414);
        _418 = _420;
    }
    float _422 = _418;
    float _424 = precise::max(0.0, _416);
    float _426 = -_280;
    float _428 = fma(_424, 2.5, _426);
    float _430 = _428 + (*spvDescriptorSet0.cp_c5)._m0[0].w;
    float _432 = _370 * _430;
    float _434 = precise::clamp(_432, 0.0, 1.0);
    if (!_225)
    {
        float _436 = _320 * _422;
        _374 = _436;
    }
    float _438 = _374;
    float _440 = (*spvDescriptorSet0.cp_c6)._m0[0].y * (*spvDescriptorSet0.cp_c5)._m0[1].y;
    float _442 = precise::max(_322, _438);
    float _444 = fma(_434, _440, _442);
    float _446 = _444;
    if (!_368)
    {
        float _448 = _444 * _400;
        _446 = _448;
    }
    float _450 = _446;
    int3 _1096 = int3(_91, _95, as_type<int>(_66));
    spvDescriptorSet0.cp_i_tcb_4A_.write(float4(_450, 0.0, 0.0, 0.0), uint2(_1096.xy), uint(_1096.z));
}

