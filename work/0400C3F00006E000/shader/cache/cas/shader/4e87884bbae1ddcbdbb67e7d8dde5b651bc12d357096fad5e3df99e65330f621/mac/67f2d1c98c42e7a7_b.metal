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
    uint _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _16* cp_c3 [[id(0)]];
    texture2d<float> cp_t_tcb_8 [[id(1)]];
    sampler cp_t_tcb_8Smplr [[id(2)]];
    texture2d<float, access::write> cp_i_tcb_48_ [[id(3)]];
    sampler cp_t_tcb_8Smplr_w [[id(4)]];
    constant dm_border_t* dm_border [[id(5)]];
};

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]])
{
    float _41 = as_type<float>(gl_LocalInvocationID.x);
    float _43 = as_type<float>(gl_WorkGroupID.x);
    float _45 = as_type<float>(gl_WorkGroupID.y);
    uint _48 = uint(int(uint(as_type<int>(_41)) >> uint(3)));
    uint _50 = uint(int(uint(as_type<int>(_41)) >> uint(1)));
    uint _52 = extract_bits(_48, 0u, 3u);
    uint _54 = extract_bits(_50, 0u, 3u);
    int _57 = 1 & as_type<int>(_41);
    int _59 = (-2) & int(_52);
    int _61 = _57 | _59;
    int _63 = as_type<int>(_43) * 16;
    int _65 = _63 + int(_54);
    int _67 = as_type<int>(_45) * 16;
    int _69 = _67 + _61;
    bool _73 = uint(_65) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[4].z);
    int _75 = _65 + 8;
    bool _77 = uint(_69) < as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[4].w);
    bool _79 = !_73;
    bool _81 = _77 && _79;
    bool _83 = uint(_75) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[4].z);
    int _85 = _69 + 8;
    bool _87 = uint(_69) < as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[4].w);
    bool _89 = !_83;
    bool _91 = _87 && _89;
    bool _93 = uint(_85) < as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[4].w);
    bool _95 = !_83;
    bool _97 = _93 && _95;
    float _99 = _45;
    float _101 = _43;
    if (_81)
    {
        float _103 = float(uint(_69));
        _99 = _103;
    }
    float _105 = _99;
    float _107 = 0.0;
    float _109 = _105;
    if (_81)
    {
        _107 = (*spvDescriptorSet0.cp_c3)._m0[0].y;
    }
    float _111 = _107;
    float _113 = 0.0;
    float _115 = _111;
    if (_81)
    {
        _113 = (*spvDescriptorSet0.cp_c3)._m0[1].w;
    }
    float _117 = _113;
    float _119 = 0.0;
    float _121 = _117;
    if (_81)
    {
        _119 = (*spvDescriptorSet0.cp_c3)._m0[1].z;
    }
    float _123 = _119;
    float _125 = _123;
    if (_81)
    {
        float _127 = float(uint(_65));
        _101 = _127;
    }
    float _129 = _101;
    float _131 = _129;
    if (_81)
    {
        float _133 = fma(_105, _111, (*spvDescriptorSet0.cp_c3)._m0[0].w);
        _109 = _133;
    }
    float _135 = _109;
    float _137 = 0.0;
    float _139 = _135;
    if (_81)
    {
        _137 = (*spvDescriptorSet0.cp_c3)._m0[0].x;
    }
    float _141 = _137;
    float _143 = _141;
    if (_81)
    {
        float _145 = _117 * (-0.5);
        _115 = _145;
    }
    float _147 = _115;
    float _149 = _147;
    if (_91)
    {
        float _151 = float(uint(_69));
        _121 = _151;
    }
    float _153 = _121;
    float _155 = 0.0;
    float _157 = _153;
    if (_97)
    {
        _155 = (*spvDescriptorSet0.cp_c3)._m0[0].x;
    }
    float _159 = _155;
    float _161 = 0.0;
    float _163 = _159;
    if (_91)
    {
        _161 = (*spvDescriptorSet0.cp_c3)._m0[0].y;
    }
    float _165 = _161;
    float _167 = _165;
    if (_81)
    {
        float _169 = fma(_129, _141, (*spvDescriptorSet0.cp_c3)._m0[0].z);
        _131 = _169;
    }
    float _171 = _131;
    float _173 = _171;
    if (_81)
    {
        float _175 = _123 * 0.5;
        _143 = _175;
    }
    float _177 = _143;
    float _179 = 0.0;
    float _181 = _177;
    if (_97)
    {
        float _183 = float(uint(_75));
        _179 = _183;
    }
    float _185 = _179;
    float _187 = 0.0;
    float _189 = _185;
    if (_91)
    {
        _187 = (*spvDescriptorSet0.cp_c3)._m0[0].x;
    }
    float _191 = _187;
    float _193 = _191;
    if (_91)
    {
        float _195 = float(uint(_75));
        _125 = _195;
    }
    float _197 = _125;
    float _199 = _197;
    if (_91)
    {
        float _201 = fma(_153, _165, (*spvDescriptorSet0.cp_c3)._m0[0].w);
        _157 = _201;
    }
    float _203 = _157;
    if (_91)
    {
        _167 = (*spvDescriptorSet0.cp_c3)._m0[1].w;
    }
    float _205 = _167;
    float _207 = _205;
    if (_81)
    {
        float _209 = fma(_171, (*spvDescriptorSet0.cp_c3)._m0[1].x, _177);
        _173 = _209;
    }
    float _211 = _173;
    if (_97)
    {
        float _213 = fma(_185, _159, (*spvDescriptorSet0.cp_c3)._m0[0].z);
        _189 = _213;
    }
    float _215 = _189;
    float _217 = _215;
    if (_81)
    {
        float _219 = fma(_135, (*spvDescriptorSet0.cp_c3)._m0[1].y, _147);
        _181 = _219;
    }
    float _221 = _181;
    if (_91)
    {
        float _223 = fma(_197, _191, (*spvDescriptorSet0.cp_c3)._m0[0].z);
        _199 = _223;
    }
    float _225 = _199;
    if (_97)
    {
        _163 = (*spvDescriptorSet0.cp_c3)._m0[1].z;
    }
    float _227 = _163;
    float _229 = _227;
    if (_97)
    {
        float _231 = float(uint(_85));
        _139 = _231;
    }
    float _233 = _139;
    float _235 = _233;
    if (_91)
    {
        _149 = (*spvDescriptorSet0.cp_c3)._m0[1].z;
    }
    float _237 = _149;
    float _239 = _237;
    if (_97)
    {
        _193 = (*spvDescriptorSet0.cp_c3)._m0[0].y;
    }
    float _241 = _193;
    if (_91)
    {
        float _243 = _205 * (-0.5);
        _207 = _243;
    }
    float _245 = _207;
    float _247 = 0.0;
    if (_97)
    {
        _247 = (*spvDescriptorSet0.cp_c3)._m0[1].w;
    }
    float _249 = _247;
    float _251 = _249;
    if (_97)
    {
        float _253 = _227 * 0.5;
        _229 = _253;
    }
    float _255 = _229;
    float _257 = _255;
    if (_91)
    {
        float _259 = _237 * 0.5;
        _239 = _259;
    }
    float _261 = _239;
    float _263 = _261;
    if (_97)
    {
        float _265 = fma(_233, _241, (*spvDescriptorSet0.cp_c3)._m0[0].w);
        _235 = _265;
    }
    float _267 = _235;
    float _269 = 0.0;
    float _271 = _267;
    if (_91)
    {
        float _273 = fma(_203, (*spvDescriptorSet0.cp_c3)._m0[1].y, _245);
        _269 = _273;
    }
    float _275 = _269;
    float _277 = 0.0;
    if (_97)
    {
        float _279 = _249 * (-0.5);
        _277 = _279;
    }
    float _281 = _277;
    float _283 = 0.0;
    float _285 = _281;
    if (_97)
    {
        float _287 = fma(_215, (*spvDescriptorSet0.cp_c3)._m0[1].x, _255);
        _283 = _287;
    }
    float _289 = _283;
    if (_91)
    {
        float _291 = fma(_225, (*spvDescriptorSet0.cp_c3)._m0[1].x, _261);
        _251 = _291;
    }
    float _293 = _251;
    if (_97)
    {
        float _295 = fma(_267, (*spvDescriptorSet0.cp_c3)._m0[1].y, _281);
        _285 = _295;
    }
    float _297 = _285;
    float _299 = _225;
    float _301 = _203;
    float _303 = _245;
    float _305 = _241;
    if (_81)
    {
        float2 _869 = float2(_211, _221);
        float4 _308 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_869, float2(0.0), isnan(_869)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_869, float2(0.0), isnan(_869)), level(0.0)).xyzw;
        float _310 = _308.x;
        float _312 = _308.y;
        float _314 = _308.z;
        float _316 = _308.w;
        _299 = _310;
        _301 = _312;
        _303 = _314;
        _305 = _316;
    }
    float _318 = _299;
    float _320 = _301;
    float _322 = _303;
    float _324 = _305;
    float _326 = 0.0;
    float _328 = _275;
    float _330 = 0.0;
    float _332 = 0.0;
    if (_91)
    {
        float2 _899 = float2(_293, _275);
        float4 _334 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_899, float2(0.0), isnan(_899)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_899, float2(0.0), isnan(_899)), level(0.0)).xyzw;
        float _336 = _334.x;
        float _338 = _334.y;
        float _340 = _334.z;
        float _342 = _334.w;
        _326 = _336;
        _328 = _338;
        _330 = _340;
        _332 = _342;
    }
    float _344 = _326;
    float _346 = _328;
    float _348 = _330;
    float _350 = _332;
    float _352 = _289;
    float _354 = 0.0;
    float _356 = 0.0;
    float _358 = 0.0;
    if (_97)
    {
        float2 _927 = float2(_289, _297);
        float4 _360 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_927, float2(0.0), isnan(_927)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_927, float2(0.0), isnan(_927)), level(0.0)).xyzw;
        float _362 = _360.x;
        float _364 = _360.y;
        float _366 = _360.z;
        float _368 = _360.w;
        _352 = _362;
        _354 = _364;
        _356 = _366;
        _358 = _368;
    }
    float _370 = _352;
    float _372 = _354;
    float _374 = _356;
    float _376 = _358;
    bool _378 = uint(_85) < as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[4].w);
    bool _380 = !_73;
    bool _382 = _378 && _380;
    if (_81)
    {
        int _384 = _65 + as_type<int>((*spvDescriptorSet0.cp_c3)._m0[4].x);
        _271 = as_type<float>(_384);
    }
    float _386 = _271;
    if (_81)
    {
        int _388 = _69 + as_type<int>((*spvDescriptorSet0.cp_c3)._m0[4].y);
        _263 = as_type<float>(_388);
    }
    float _390 = _263;
    if (_91)
    {
        int _392 = _69 + as_type<int>((*spvDescriptorSet0.cp_c3)._m0[4].y);
        _257 = as_type<float>(_392);
    }
    float _394 = _257;
    if (_91)
    {
        int _396 = _75 + as_type<int>((*spvDescriptorSet0.cp_c3)._m0[4].x);
        _217 = as_type<float>(_396);
    }
    float _398 = _217;
    float _400 = 0.0;
    if (_97)
    {
        int _402 = _75 + as_type<int>((*spvDescriptorSet0.cp_c3)._m0[4].x);
        _400 = as_type<float>(_402);
    }
    float _404 = _400;
    float _406 = 0.0;
    if (_97)
    {
        int _408 = _85 + as_type<int>((*spvDescriptorSet0.cp_c3)._m0[4].y);
        _406 = as_type<float>(_408);
    }
    float _410 = _406;
    if (_81)
    {
        spvDescriptorSet0.cp_i_tcb_48_.write(float4(_318, _320, _322, _324), uint2(int2(as_type<int>(_386), as_type<int>(_390))));
    }
    if (_91)
    {
        spvDescriptorSet0.cp_i_tcb_48_.write(float4(_344, _346, _348, _350), uint2(int2(as_type<int>(_398), as_type<int>(_394))));
    }
    if (_97)
    {
        spvDescriptorSet0.cp_i_tcb_48_.write(float4(_370, _372, _374, _376), uint2(int2(as_type<int>(_404), as_type<int>(_410))));
    }
    if (!_382)
    {
        return;
    }
    float _412 = float(uint(_65));
    float _414 = float(uint(_85));
    float _416 = fma(_412, (*spvDescriptorSet0.cp_c3)._m0[0].x, (*spvDescriptorSet0.cp_c3)._m0[0].z);
    float _418 = (*spvDescriptorSet0.cp_c3)._m0[1].z * 0.5;
    float _420 = fma(_414, (*spvDescriptorSet0.cp_c3)._m0[0].y, (*spvDescriptorSet0.cp_c3)._m0[0].w);
    float _422 = (*spvDescriptorSet0.cp_c3)._m0[1].w * (-0.5);
    float _424 = fma(_416, (*spvDescriptorSet0.cp_c3)._m0[1].x, _418);
    float _426 = fma(_420, (*spvDescriptorSet0.cp_c3)._m0[1].y, _422);
    float2 _1110 = float2(_424, _426);
    float4 _428 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_1110, float2(0.0), isnan(_1110)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_1110, float2(0.0), isnan(_1110)), level(0.0)).xyzw;
    float _430 = _428.x;
    float _432 = _428.y;
    float _434 = _428.z;
    float _436 = _428.w;
    int _438 = _65 + as_type<int>((*spvDescriptorSet0.cp_c3)._m0[4].x);
    int _440 = _85 + as_type<int>((*spvDescriptorSet0.cp_c3)._m0[4].y);
    spvDescriptorSet0.cp_i_tcb_48_.write(float4(_430, _432, _434, _436), uint2(int2(_438, _440)));
}

