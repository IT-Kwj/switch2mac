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
    constant _16* fp_c4 [[id(0)]];
    constant _16* fp_c3 [[id(1)]];
    constant _16* fp_c5 [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    texture3d<float> fp_t_tcb_C [[id(5)]];
    sampler fp_t_tcb_CSmplr [[id(6)]];
    texture3d<float> fp_t_tcb_E [[id(7)]];
    sampler fp_t_tcb_ESmplr [[id(8)]];
    sampler fp_t_tcb_8Smplr_w [[id(9)]];
    sampler fp_t_tcb_CSmplr_w [[id(10)]];
    sampler fp_t_tcb_ESmplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_43 [[color(0)]];
};

struct main0_in
{
    float4 m_40 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _285 = false;
    float _50 = gl_FragCoord.w;
    float _52 = in.m_40.x;
    float _54 = gl_FragCoord.w;
    float _56 = _52 * _54;
    float _58 = in.m_40.y;
    float _60 = gl_FragCoord.w;
    float _62 = _58 * _60;
    float _64 = 1.0 / _50;
    float _66 = _64 * _56;
    float _68 = _64 * _62;
    float2 _450 = float2(_66, _68);
    float4 _71 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_450, float2(0.0), isnan(_450))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_450, float2(0.0), isnan(_450))).xyzw;
    float _73 = _71.x;
    float _75 = _71.y;
    float _77 = _71.z;
    float _79 = _71.w;
    float _81 = _68 + (-0.5);
    float _83 = _66 + (-0.5);
    float _85 = fma(_81, (*spvDescriptorSet0.fp_c4)._m0[7].x, (*spvDescriptorSet0.fp_c4)._m0[6].y);
    float _87 = _83 + (*spvDescriptorSet0.fp_c4)._m0[6].x;
    float _89 = _85 * _85;
    bool _93 = 0.0 != (*spvDescriptorSet0.fp_c3)._m0[0].w;
    bool _95 = isnan(0.0);
    bool _97 = _93 || _95;
    bool _99 = isnan((*spvDescriptorSet0.fp_c3)._m0[0].w);
    bool _101 = _97 || _99;
    float _103 = precise::max(0.0, (*spvDescriptorSet0.fp_c4)._m0[6].z);
    float _105 = fma(_87, _87, _89);
    float _107 = abs((*spvDescriptorSet0.fp_c4)._m0[6].w);
    float _109 = -_107;
    float _111 = fma(_109, 2.0, (*spvDescriptorSet0.fp_c4)._m0[6].z);
    bool _113 = (*spvDescriptorSet0.fp_c4)._m0[6].w > (-1.0999999631167156621813774108887e-06);
    bool _115 = (*spvDescriptorSet0.fp_c4)._m0[6].w >= (-1.0999999631167156621813774108887e-06);
    bool _117 = isnan((*spvDescriptorSet0.fp_c4)._m0[6].w);
    bool _119 = _115 || _117;
    bool _121 = isnan(-1.0999999631167156621813774108887e-06);
    bool _123 = _119 || _121;
    float _125 = sqrt(_105);
    float _127 = precise::max(0.0, _111);
    float _129 = -_127;
    float _131 = _103 + _129;
    float _133 = 1.0 / _131;
    float _135 = -_127;
    float _137 = _125 + _135;
    int _140 = _123 ? 0 : 1;
    float _142 = _137 * _133;
    float _144 = precise::clamp(_142, 0.0, 1.0);
    float _146 = _127;
    float _148 = _103;
    if (_101)
    {
        float _150 = _75 * 0.715200006961822509765625;
        _146 = _150;
    }
    float _152 = _146;
    float _154 = _152;
    if (_101)
    {
        float _156 = fma(_73, 0.2125999927520751953125, _152);
        _154 = _156;
    }
    float _158 = _154;
    if (_101)
    {
        float _160 = fma(_77, 0.072200000286102294921875, _158);
        _148 = _160;
    }
    float _162 = _148;
    float _164 = fma(_144, -2.0, 3.0);
    float _166 = _144 * _144;
    float _168 = _162;
    float _170 = _164;
    float _172 = _166;
    if (_101)
    {
        float _174 = 1.0 / _162;
        _168 = _174;
    }
    float _176 = _168;
    float _178 = fma(_166, _164, -0.5);
    if (!_101)
    {
        _170 = (*spvDescriptorSet0.fp_c3)._m0[0].x;
    }
    float _180 = _170;
    float _182 = _180;
    if (_101)
    {
        float _184 = _176 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _186 = precise::clamp(_184, 0.0, 1.0);
        _172 = _186;
    }
    float _188 = _172;
    int _190 = ~_140;
    int _192 = _190 + 1;
    int _194 = _192 + 1;
    int _196 = _194;
    if (!_113)
    {
        int _198 = ~_140;
        int _200 = _198 + 1;
        _196 = _200;
    }
    int _202 = _196;
    if (_101)
    {
        float _204 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[0].y, (*spvDescriptorSet0.fp_c3)._m0[0].x);
        _182 = _204;
    }
    float _206 = _182;
    float _208 = float(_202);
    float _210 = _73 * _206;
    float _212 = _210 * 4.0;
    float _214 = _75 * _206;
    float _216 = _214 * 4.0;
    float _218 = _77 * _206;
    float _220 = _218 * 4.0;
    float _222 = fma(_178, _208, 0.5);
    uint _225 = as_type<uint>(half2(float2(_212, _216)));
    float _227 = precise::max(_222, (*spvDescriptorSet0.fp_c4)._m0[5].w);
    uint _229 = extract_bits(_225, 16u, 16u);
    float _231 = float(_229);
    uint _233 = as_type<uint>(half2(float2(_220, 0.0)));
    bool _235 = _227 > 0.999000012874603271484375;
    int _237 = int(_225) & 32767;
    uint _239 = extract_bits(_233, 0u, 8u);
    int _241 = int(_239) & 255;
    uint _243 = extract_bits(_233, 8u, 8u);
    int _245 = int(_243) & 255;
    int _247 = _245 << 8;
    int _249 = _241 | _247;
    float _251 = float(uint(_237));
    float _253 = float(uint(_249));
    float _255 = fma(_251, 6.103515625e-05, -0.3125);
    float _257 = fma(_231, 6.103515625e-05, -0.3125);
    float _259 = fma(_253, 6.103515625e-05, -0.3125);
    float _261 = fma(_255, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
    float _263 = fma(_257, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
    float _265 = fma(_259, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
    bool _267 = !_235;
    float _279;
    float _281;
    float _283;
    if (!_267)
    {
        float3 _761 = float3(_261, _263, _265);
        float3 _271 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_761, float3(0.0), isnan(_761))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_761, float3(0.0), isnan(_761))).xyz;
        float _273 = _271.x;
        float _275 = _271.y;
        float _277 = _271.z;
        _279 = _275;
        _281 = _273;
        _283 = _277;
        _285 = true;
    }
    else
    {
        bool _287 = _227 >= 0.001000000047497451305389404296875;
        bool _289 = isnan(_227);
        bool _291 = _287 || _289;
        bool _293 = isnan(0.001000000047497451305389404296875);
        bool _295 = _291 || _293;
        if (!_295)
        {
            float3 _798 = float3(_261, _263, _265);
            float3 _297 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_798, float3(0.0), isnan(_798))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_798, float3(0.0), isnan(_798))).xyz;
            float _299 = _297.x;
            float _301 = _297.y;
            float _303 = _297.z;
            _279 = _301;
            _281 = _299;
            _283 = _303;
            _285 = true;
        }
        else
        {
            float3 _817 = float3(_261, _263, _265);
            float3 _305 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_817, float3(0.0), isnan(_817))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_817, float3(0.0), isnan(_817))).xyz;
            float _307 = _305.x;
            float _309 = _305.y;
            float _311 = _305.z;
            float3 _832 = float3(_261, _263, _265);
            float3 _313 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_832, float3(0.0), isnan(_832))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_832, float3(0.0), isnan(_832))).xyz;
            float _315 = _313.x;
            float _317 = _313.y;
            float _319 = _313.z;
            float _321 = -_307;
            float _323 = _315 + _321;
            float _325 = -_309;
            float _327 = _317 + _325;
            float _329 = -_311;
            float _331 = _319 + _329;
            float _333 = fma(_227, _323, _307);
            float _335 = fma(_227, _327, _309);
            float _337 = fma(_227, _331, _311);
            _279 = _335;
            _281 = _333;
            _283 = _337;
        }
    }
    _285 = false;
    float _339 = _279;
    float _341 = _281;
    float _343 = _283;
    bool _345 = _341 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
    bool _347 = isnan(_341);
    bool _349 = _345 || _347;
    bool _351 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
    bool _353 = _349 || _351;
    float _355 = fma(_341, (*spvDescriptorSet0.fp_c3)._m0[1].y, (*spvDescriptorSet0.fp_c3)._m0[1].z);
    float _357 = fma(_343, (*spvDescriptorSet0.fp_c3)._m0[1].y, (*spvDescriptorSet0.fp_c3)._m0[1].z);
    float _359 = fma(_339, (*spvDescriptorSet0.fp_c3)._m0[1].y, (*spvDescriptorSet0.fp_c3)._m0[1].z);
    bool _361 = _339 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
    bool _363 = isnan(_339);
    bool _365 = _361 || _363;
    bool _367 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
    bool _369 = _365 || _367;
    bool _371 = _343 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
    bool _373 = isnan(_343);
    bool _375 = _371 || _373;
    bool _377 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
    bool _379 = _375 || _377;
    float _381 = exp2(_355);
    float _383 = exp2(_359);
    float _385 = exp2(_357);
    float _387 = _341;
    float _389 = _339;
    float _391 = _343;
    if (_353)
    {
        float _393 = -_381;
        float _395 = _393 + 1.0;
        _387 = _395;
    }
    float _397 = _387;
    float _399 = _397 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    if (_369)
    {
        float _401 = -_383;
        float _403 = _401 + 1.0;
        _389 = _403;
    }
    float _405 = _389;
    float _407 = _405 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    if (_379)
    {
        float _409 = -_385;
        float _411 = _409 + 1.0;
        _391 = _411;
    }
    float _413 = _391;
    float _415 = _413 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    out.m_43.x = _399;
    out.m_43.y = _407;
    out.m_43.z = _415;
    out.m_43.w = _79;
    return out;
}

