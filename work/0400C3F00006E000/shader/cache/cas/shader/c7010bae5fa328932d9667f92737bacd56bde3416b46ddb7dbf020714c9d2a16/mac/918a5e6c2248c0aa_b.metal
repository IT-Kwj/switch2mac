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
    constant _16* fp_c3 [[id(0)]];
    constant _16* fp_c4 [[id(1)]];
    constant _16* fp_c5 [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_C [[id(5)]];
    sampler fp_t_tcb_CSmplr [[id(6)]];
    texture3d<float> fp_t_tcb_E [[id(7)]];
    sampler fp_t_tcb_ESmplr [[id(8)]];
    texture3d<float> fp_t_tcb_10 [[id(9)]];
    sampler fp_t_tcb_10Smplr [[id(10)]];
    sampler fp_t_tcb_8Smplr_w [[id(11)]];
    sampler fp_t_tcb_CSmplr_w [[id(12)]];
    sampler fp_t_tcb_ESmplr_w [[id(13)]];
    sampler fp_t_tcb_10Smplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_45 [[color(0)]];
};

struct main0_in
{
    float4 m_42 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _299 = false;
    float _52 = gl_FragCoord.w;
    float _54 = in.m_42.x;
    float _56 = gl_FragCoord.w;
    float _58 = _54 * _56;
    float _60 = in.m_42.y;
    float _62 = gl_FragCoord.w;
    float _64 = _60 * _62;
    float _66 = 1.0 / _52;
    float _68 = _66 * _58;
    float _70 = _66 * _64;
    float _72 = _68 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float2 _470 = float2(_68, _70);
    float4 _75 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_470, float2(0.0), isnan(_470))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_470, float2(0.0), isnan(_470))).xyzw;
    float _77 = _75.x;
    float _79 = _75.y;
    float _81 = _75.z;
    float _83 = _75.w;
    float _85 = _70 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float2 _493 = float2(_72, _85);
    float3 _89 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_493, float2(0.0), isnan(_493))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_493, float2(0.0), isnan(_493))).xyz;
    float _91 = _89.x;
    float _93 = _89.y;
    float _95 = _89.z;
    float _97 = _70 + (-0.5);
    float _99 = _68 + (-0.5);
    bool _103 = 0.0 != (*spvDescriptorSet0.fp_c3)._m0[0].w;
    bool _105 = isnan(0.0);
    bool _107 = _103 || _105;
    bool _109 = isnan((*spvDescriptorSet0.fp_c3)._m0[0].w);
    bool _111 = _107 || _109;
    float _113 = fma(_97, (*spvDescriptorSet0.fp_c4)._m0[7].x, (*spvDescriptorSet0.fp_c4)._m0[6].y);
    float _115 = _99 + (*spvDescriptorSet0.fp_c4)._m0[6].x;
    float _117 = _113 * _113;
    float _119 = precise::max(0.0, (*spvDescriptorSet0.fp_c4)._m0[6].z);
    float _121 = fma(_115, _115, _117);
    bool _123 = (*spvDescriptorSet0.fp_c4)._m0[6].w > (-1.0999999631167156621813774108887e-06);
    float _125 = abs((*spvDescriptorSet0.fp_c4)._m0[6].w);
    float _127 = -_125;
    float _129 = fma(_127, 2.0, (*spvDescriptorSet0.fp_c4)._m0[6].z);
    bool _131 = (*spvDescriptorSet0.fp_c4)._m0[6].w >= (-1.0999999631167156621813774108887e-06);
    bool _133 = isnan((*spvDescriptorSet0.fp_c4)._m0[6].w);
    bool _135 = _131 || _133;
    bool _137 = isnan(-1.0999999631167156621813774108887e-06);
    bool _139 = _135 || _137;
    float _141 = sqrt(_121);
    float _143 = precise::max(0.0, _129);
    float _145 = -_143;
    float _147 = _119 + _145;
    float _149 = _119;
    float _151 = _70;
    if (!_111)
    {
        _149 = (*spvDescriptorSet0.fp_c3)._m0[0].x;
    }
    float _153 = _149;
    float _155 = 1.0 / _147;
    float _157 = -_143;
    float _159 = _141 + _157;
    int _162 = _139 ? 0 : 1;
    float _164 = _159 * _155;
    float _166 = precise::clamp(_164, 0.0, 1.0);
    float _168 = fma(_166, -2.0, 3.0);
    float _170 = _166 * _166;
    float _172 = fma(_170, _168, -0.5);
    float _174 = _166;
    float _176 = _153;
    if (_111)
    {
        float _178 = _79 * 0.715200006961822509765625;
        _151 = _178;
    }
    float _180 = _151;
    float _182 = _180;
    if (_111)
    {
        float _184 = fma(_77, 0.2125999927520751953125, _180);
        _182 = _184;
    }
    float _186 = _182;
    float _188 = _186;
    if (_111)
    {
        float _190 = fma(_81, 0.072200000286102294921875, _186);
        _188 = _190;
    }
    float _192 = _188;
    float _194 = _192;
    if (_111)
    {
        float _196 = 1.0 / _192;
        _194 = _196;
    }
    float _198 = _194;
    if (_111)
    {
        float _200 = _198 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _202 = precise::clamp(_200, 0.0, 1.0);
        _174 = _202;
    }
    float _204 = _174;
    if (_111)
    {
        float _206 = fma(_204, (*spvDescriptorSet0.fp_c3)._m0[0].y, (*spvDescriptorSet0.fp_c3)._m0[0].x);
        _176 = _206;
    }
    float _208 = _176;
    int _210 = ~_162;
    int _212 = _210 + 1;
    int _214 = _212 + 1;
    int _216 = _214;
    if (!_123)
    {
        int _218 = ~_162;
        int _220 = _218 + 1;
        _216 = _220;
    }
    int _222 = _216;
    float _224 = fma(_77, _208, _91);
    float _226 = fma(_79, _208, _93);
    float _228 = fma(_81, _208, _95);
    float _230 = float(_222);
    float _232 = _224 * 4.0;
    float _234 = _226 * 4.0;
    float _236 = _228 * 4.0;
    float _238 = fma(_172, _230, 0.5);
    uint _241 = as_type<uint>(half2(float2(_232, _234)));
    float _243 = precise::max(_238, (*spvDescriptorSet0.fp_c4)._m0[5].w);
    uint _245 = extract_bits(_241, 16u, 16u);
    float _247 = float(_245);
    uint _249 = as_type<uint>(half2(float2(_236, 0.0)));
    bool _251 = _243 > 0.999000012874603271484375;
    int _253 = int(_241) & 32767;
    uint _255 = extract_bits(_249, 0u, 8u);
    int _257 = int(_255) & 255;
    uint _259 = extract_bits(_249, 8u, 8u);
    int _261 = int(_259) & 255;
    int _263 = _261 << 8;
    int _265 = _257 | _263;
    float _267 = float(uint(_253));
    float _269 = float(uint(_265));
    float _271 = fma(_267, 6.103515625e-05, -0.3125);
    float _273 = fma(_247, 6.103515625e-05, -0.3125);
    float _275 = fma(_269, 6.103515625e-05, -0.3125);
    float _277 = fma(_271, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
    float _279 = fma(_273, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
    float _281 = fma(_275, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
    bool _283 = !_251;
    float _293;
    float _295;
    float _297;
    if (!_283)
    {
        float3 _800 = float3(_277, _279, _281);
        float3 _285 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_800, float3(0.0), isnan(_800))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_800, float3(0.0), isnan(_800))).xyz;
        float _287 = _285.x;
        float _289 = _285.y;
        float _291 = _285.z;
        _293 = _289;
        _295 = _287;
        _297 = _291;
        _299 = true;
    }
    else
    {
        bool _301 = _243 >= 0.001000000047497451305389404296875;
        bool _303 = isnan(_243);
        bool _305 = _301 || _303;
        bool _307 = isnan(0.001000000047497451305389404296875);
        bool _309 = _305 || _307;
        if (!_309)
        {
            float3 _837 = float3(_277, _279, _281);
            float3 _311 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_837, float3(0.0), isnan(_837))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_837, float3(0.0), isnan(_837))).xyz;
            float _313 = _311.x;
            float _315 = _311.y;
            float _317 = _311.z;
            _293 = _315;
            _295 = _313;
            _297 = _317;
            _299 = true;
        }
        else
        {
            float3 _856 = float3(_277, _279, _281);
            float3 _319 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_856, float3(0.0), isnan(_856))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_856, float3(0.0), isnan(_856))).xyz;
            float _321 = _319.x;
            float _323 = _319.y;
            float _325 = _319.z;
            float3 _871 = float3(_277, _279, _281);
            float3 _327 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_871, float3(0.0), isnan(_871))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_871, float3(0.0), isnan(_871))).xyz;
            float _329 = _327.x;
            float _331 = _327.y;
            float _333 = _327.z;
            float _335 = -_321;
            float _337 = _329 + _335;
            float _339 = -_323;
            float _341 = _331 + _339;
            float _343 = -_325;
            float _345 = _333 + _343;
            float _347 = fma(_243, _337, _321);
            float _349 = fma(_243, _341, _323);
            float _351 = fma(_243, _345, _325);
            _293 = _349;
            _295 = _347;
            _297 = _351;
        }
    }
    _299 = false;
    float _353 = _293;
    float _355 = _295;
    float _357 = _297;
    bool _359 = _355 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
    bool _361 = isnan(_355);
    bool _363 = _359 || _361;
    bool _365 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
    bool _367 = _363 || _365;
    float _369 = fma(_355, (*spvDescriptorSet0.fp_c3)._m0[1].y, (*spvDescriptorSet0.fp_c3)._m0[1].z);
    float _371 = fma(_357, (*spvDescriptorSet0.fp_c3)._m0[1].y, (*spvDescriptorSet0.fp_c3)._m0[1].z);
    float _373 = fma(_353, (*spvDescriptorSet0.fp_c3)._m0[1].y, (*spvDescriptorSet0.fp_c3)._m0[1].z);
    bool _375 = _353 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
    bool _377 = isnan(_353);
    bool _379 = _375 || _377;
    bool _381 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
    bool _383 = _379 || _381;
    bool _385 = _357 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
    bool _387 = isnan(_357);
    bool _389 = _385 || _387;
    bool _391 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
    bool _393 = _389 || _391;
    float _395 = exp2(_369);
    float _397 = exp2(_373);
    float _399 = exp2(_371);
    float _401 = _355;
    float _403 = _353;
    float _405 = _357;
    if (_367)
    {
        float _407 = -_395;
        float _409 = _407 + 1.0;
        _401 = _409;
    }
    float _411 = _401;
    float _413 = _411 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    if (_383)
    {
        float _415 = -_397;
        float _417 = _415 + 1.0;
        _403 = _417;
    }
    float _419 = _403;
    float _421 = _419 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    if (_393)
    {
        float _423 = -_399;
        float _425 = _423 + 1.0;
        _405 = _425;
    }
    float _427 = _405;
    float _429 = _427 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    out.m_45.x = _413;
    out.m_45.y = _421;
    out.m_45.z = _429;
    out.m_45.w = _83;
    return out;
}

