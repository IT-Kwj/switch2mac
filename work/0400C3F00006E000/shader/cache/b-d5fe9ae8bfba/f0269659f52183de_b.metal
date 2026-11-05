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
    constant _16* cp_c5 [[id(2)]];
    constant _16* cp_c4 [[id(3)]];
    constant _16* cp_c6 [[id(4)]];
    const device _27* cp_s0 [[id(5)]];
    texture2d_array<float> cp_t_tcb_A [[id(6)]];
    sampler cp_t_tcb_ASmplr [[id(7)]];
    texture2d<float> cp_t_tcb_8 [[id(8)]];
    sampler cp_t_tcb_8Smplr [[id(9)]];
    texture2d_array<float, access::write> cp_i_tcb_4A_ [[id(10)]];
    texture2d_array<float> cp_i_tcb_48_ [[id(11)]];
    sampler cp_t_tcb_ASmplr_w [[id(12)]];
    sampler cp_t_tcb_8Smplr_w [[id(13)]];
    constant dm_border_t* dm_border [[id(14)]];
};

static inline __attribute__((always_inline))
int _58(thread const int& _893, thread const int& _894, constant _10& support_buffer)
{
    int _897 = 1 + _894;
    float _899 = support_buffer._m5[_897].x;
    bool _901 = _899 == 1.0;
    if (_901)
    {
        return _893;
    }
    float _903 = float(_893);
    float _905 = _903 * _899;
    int _907 = int(_905);
    return _907;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]])
{
    float _62 = as_type<float>(gl_WorkGroupID.y);
    float _64 = as_type<float>(gl_WorkGroupID.z);
    float _66 = as_type<float>(gl_WorkGroupID.x);
    int _68 = as_type<int>(_64) << 5;
    int _70 = _68 + as_type<int>(_62);
    int _72 = _70 << 4;
    int _74 = _72 + as_type<int>(_66);
    int _76 = _74 << 2;
    uint _79 = uint(int(uint(_76) >> uint(2)));
    float _81 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_79)]);
    float _83 = as_type<float>(gl_LocalInvocationID.x);
    float _85 = as_type<float>(gl_LocalInvocationID.y);
    int _87 = as_type<int>(_66) << 3;
    int _89 = _87 + as_type<int>(_83);
    int _91 = as_type<int>(_62) << 2;
    int _93 = _91 + as_type<int>(_85);
    bool _97 = as_type<int>(_81) != 0;
    if (!_97)
    {
        int3 _453 = int3(_89, _93, as_type<int>(_64));
        spvDescriptorSet0.cp_i_tcb_4A_.write(float4(0.0), uint2(_453.xy), uint(_453.z));
    }
    if (!_97)
    {
        return;
    }
    int _99 = as_type<int>(_64) + as_type<int>((*spvDescriptorSet0.cp_c3)._m0[16].z);
    float _101 = float(as_type<int>(_64));
    int _103 = _99 << 4;
    float _105 = rint(_101);
    float _107 = precise::max(_105, 0.0);
    uint _109 = uint(_107);
    uint _111 = clamp(_109, 0u, 65535u);
    float _113 = float(_93);
    int _115 = _103 + 4;
    uint _117 = uint(int(uint(_115) >> uint(2)));
    uint _119 = uint(int(uint(int(_117)) >> uint(2)));
    int _121 = int(_117) & 3;
    float _123 = (*spvDescriptorSet0.cp_c3)._m0[int(_119)][_121];
    float _125 = float(_89);
    float _127 = _113 + 0.5;
    float _129 = _125 + 0.5;
    float _131 = 1.0 / _123;
    float _133 = _127 * _131;
    float _135 = _129 * _131;
    float3 _527 = float3(_135, _133, float(int(_111)));
    float3 _531 = select(_527, float3(0.0), isnan(_527));
    float2 _139 = dm_bs(spvDescriptorSet0.cp_t_tcb_A.sample(spvDescriptorSet0.cp_t_tcb_ASmplr, _531.xy, uint(rint(_531.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_A, spvDescriptorSet0.cp_t_tcb_ASmplr_w, _531.xy, uint(rint(_531.z)), level(0.0)).xw;
    float _141 = _139.x;
    float _143 = _139.y;
    int _145 = _89;
    int _147 = 3;
    int _149 = _58(_145, _147, (*spvDescriptorSet0.support_buffer));
    int _151 = _93;
    int _153 = 3;
    int _155 = _58(_151, _153, (*spvDescriptorSet0.support_buffer));
    int3 _547 = int3(_149, _155, as_type<int>(_64));
    float4 _158 = (spvDescriptorSet0.cp_i_tcb_48_.read(uint2(_547.xy), uint(_547.z)).xyzw);
    float _160 = _158.x;
    float _162 = _158.y;
    float _164 = _158.z;
    float _166 = _158.w;
    int _168 = _103 + 12;
    uint _170 = uint(int(uint(_168) >> uint(2)));
    uint _172 = uint(int(uint(int(_170)) >> uint(2)));
    int _174 = int(_170) & 3;
    float _176 = (*spvDescriptorSet0.cp_c3)._m0[int(_172)][_174];
    float _178 = _135 + (-0.5);
    float _180 = _123 * _176;
    float _182 = _133 + (-0.5);
    float _184 = fma(_180, _178, (*spvDescriptorSet0.cp_c3)._m0[16].x);
    float _186 = fma(_180, _182, (*spvDescriptorSet0.cp_c3)._m0[16].y);
    float _188 = -(*spvDescriptorSet0.cp_c4)._m0[0].x;
    float _190 = _184 + _188;
    float _192 = -(*spvDescriptorSet0.cp_c4)._m0[0].y;
    float _194 = _186 + _192;
    float _196 = fma(_190, (*spvDescriptorSet0.cp_c4)._m0[1].w, 0.5);
    float _198 = fma(_194, (*spvDescriptorSet0.cp_c4)._m0[1].w, 0.5);
    bool _200 = _196 >= 1.0;
    bool _202 = isnan(_196);
    bool _204 = _200 || _202;
    bool _206 = isnan(1.0);
    bool _208 = _204 || _206;
    bool _210 = _198 < 1.0;
    bool _212 = !_208;
    bool _214 = _210 && _212;
    bool _216 = _196 > 0.0;
    bool _218 = _216 && _214;
    bool _220 = _198 > 0.0;
    bool _222 = _220 && _218;
    float _224 = _194;
    float _226 = _180;
    float _228 = _190;
    float _230 = as_type<float>(_103);
    if (!_222)
    {
        _224 = 0.0;
    }
    float _232 = _224;
    float _234 = _232;
    if (!_222)
    {
        _226 = 0.0;
        _228 = 0.0;
    }
    float _236 = _226;
    float _238 = _228;
    float _240 = _236;
    float _242 = _238;
    if (!_222)
    {
        _230 = 0.0;
    }
    float _244 = _230;
    bool _246 = !_222;
    float _248 = _244;
    if (!_246)
    {
        float _250 = _196 + (*spvDescriptorSet0.cp_c4)._m0[1].z;
        float _252 = _198 + (*spvDescriptorSet0.cp_c4)._m0[1].z;
        float _254 = -(*spvDescriptorSet0.cp_c4)._m0[1].z;
        float _256 = _196 + _254;
        float _258 = -(*spvDescriptorSet0.cp_c4)._m0[1].z;
        float _260 = _198 + _258;
        float2 _696 = float2(_196, _198);
        float _262 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_696, float2(0.0), isnan(_696)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_696, float2(0.0), isnan(_696)), level(0.0)).x;
        float2 _706 = float2(_250, _198);
        float _264 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_706, float2(0.0), isnan(_706)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_706, float2(0.0), isnan(_706)), level(0.0)).x;
        float2 _714 = float2(_256, _198);
        float _266 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_714, float2(0.0), isnan(_714)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_714, float2(0.0), isnan(_714)), level(0.0)).x;
        float2 _722 = float2(_196, _252);
        float _268 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_722, float2(0.0), isnan(_722)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_722, float2(0.0), isnan(_722)), level(0.0)).x;
        float2 _730 = float2(_196, _260);
        float _270 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_730, float2(0.0), isnan(_730)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_730, float2(0.0), isnan(_730)), level(0.0)).x;
        float _272 = _141 * 200.0;
        float _274 = (*spvDescriptorSet0.cp_c4)._m0[1].y * 2.0;
        float _276 = 1.0 / _274;
        float _278 = _272 * _276;
        float _280 = precise::clamp(_278, 0.0, 1.0);
        float _282 = fma(_280, 0.949999988079071044921875, 0.050000011920928955078125);
        float _284 = precise::max(0.0, _262);
        float _286 = _282 * _262;
        float _288 = -_266;
        float _290 = _264 + _288;
        float _292 = -_270;
        float _294 = _268 + _292;
        float _296 = _284 * (*spvDescriptorSet0.cp_c6)._m0[0].x;
        float _298 = _290 * 1.57079637050628662109375;
        float _300 = _294 * 1.57079637050628662109375;
        _234 = _298;
        _240 = _286;
        _248 = _300;
        _242 = _296;
    }
    float _302 = _234;
    float _304 = _240;
    float _306 = _248;
    float _308 = _242;
    float _310 = -_143;
    float _312 = _310 + 1.0;
    int _314 = as_type<int>((*spvDescriptorSet0.cp_c5)._m0[0].w) + (-1);
    float _316 = _312 * _302;
    float _318 = _312 * _304;
    float _320 = _312 * _306;
    bool _322 = as_type<int>(_64) != _314;
    float _324 = _304;
    float _326 = _302;
    float _328 = _320;
    float _330 = _308;
    if (_322)
    {
        _324 = _316;
    }
    float _332 = _324;
    float _334 = _332;
    if (_322)
    {
        _326 = _318;
    }
    float _336 = _326;
    float _338 = _336;
    if (!_322)
    {
        float _340 = -_135;
        float _342 = _340 + 1.0;
        float _344 = -_133;
        float _346 = _344 + 1.0;
        float _348 = precise::min(_135, _342);
        float _350 = precise::min(_133, _346);
        float _352 = precise::min(_348, _350);
        float _354 = _352 * 10.0;
        float _356 = precise::clamp(_354, 0.0, 1.0);
        float _358 = _316 * _356;
        float _360 = _318 * _356;
        float _362 = _320 * _356;
        float _364 = _356 * _308;
        _334 = _358;
        _338 = _360;
        _328 = _362;
        _330 = _364;
    }
    float _366 = _334;
    float _368 = _338;
    float _370 = _328;
    float _372 = _330;
    float _374 = _160 + _366;
    float _376 = _162 + _368;
    float _378 = _164 + _370;
    float _380 = _166 + _372;
    int3 _887 = int3(_89, _93, as_type<int>(_64));
    spvDescriptorSet0.cp_i_tcb_4A_.write(float4(_374, _376, _378, _380), uint2(_887.xy), uint(_887.z));
}

