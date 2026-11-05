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
    constant _16* fp_c5 [[id(0)]];
    constant _16* fp_c3 [[id(1)]];
    constant _16* fp_c4 [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_10 [[id(5)]];
    sampler fp_t_tcb_10Smplr [[id(6)]];
    texture3d<float> fp_t_tcb_C [[id(7)]];
    sampler fp_t_tcb_CSmplr [[id(8)]];
    texture3d<float> fp_t_tcb_E [[id(9)]];
    sampler fp_t_tcb_ESmplr [[id(10)]];
    sampler fp_t_tcb_8Smplr_w [[id(11)]];
    sampler fp_t_tcb_10Smplr_w [[id(12)]];
    sampler fp_t_tcb_CSmplr_w [[id(13)]];
    sampler fp_t_tcb_ESmplr_w [[id(14)]];
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
    bool _265 = false;
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
    float _72 = _68 * (*spvDescriptorSet0.fp_c5)._m0[2].x;
    float2 _404 = float2(_68, _70);
    float4 _75 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_404, float2(0.0), isnan(_404))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_404, float2(0.0), isnan(_404))).xyzw;
    float _77 = _75.x;
    float _79 = _75.y;
    float _81 = _75.z;
    float _83 = _75.w;
    float _85 = _70 * (*spvDescriptorSet0.fp_c5)._m0[2].y;
    float2 _427 = float2(_72, _85);
    float3 _89 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_427, float2(0.0), isnan(_427))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_427, float2(0.0), isnan(_427))).xyz;
    float _91 = _89.x;
    float _93 = _89.y;
    float _95 = _89.z;
    float _97 = _70 + (-0.5);
    float _99 = _68 + (-0.5);
    float _101 = fma(_97, (*spvDescriptorSet0.fp_c3)._m0[7].x, (*spvDescriptorSet0.fp_c3)._m0[6].y);
    float _103 = _99 + (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _105 = _101 * _101;
    float _107 = precise::max(0.0, (*spvDescriptorSet0.fp_c3)._m0[6].z);
    bool _111 = (*spvDescriptorSet0.fp_c3)._m0[6].w > (-1.0999999631167156621813774108887e-06);
    float _113 = fma(_103, _103, _105);
    float _115 = abs((*spvDescriptorSet0.fp_c3)._m0[6].w);
    float _117 = -_115;
    float _119 = fma(_117, 2.0, (*spvDescriptorSet0.fp_c3)._m0[6].z);
    bool _121 = (*spvDescriptorSet0.fp_c3)._m0[6].w >= (-1.0999999631167156621813774108887e-06);
    bool _123 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].w);
    bool _125 = _121 || _123;
    bool _127 = isnan(-1.0999999631167156621813774108887e-06);
    bool _129 = _125 || _127;
    float _131 = precise::max(0.0, _119);
    float _133 = sqrt(_113);
    float _135 = -_131;
    float _137 = _107 + _135;
    float _139 = 1.0 / _137;
    float _141 = -_131;
    float _143 = _133 + _141;
    int _146 = _129 ? 0 : 1;
    float _148 = _143 * _139;
    float _150 = precise::clamp(_148, 0.0, 1.0);
    float _152 = fma(_150, -2.0, 3.0);
    float _154 = _150 * _150;
    float _156 = fma(_154, _152, -0.5);
    float _158 = _79 * 0.715200006961822509765625;
    float _160 = fma(_77, 0.2125999927520751953125, _158);
    float _162 = fma(_81, 0.072200000286102294921875, _160);
    float _164 = 1.0 / _162;
    int _166 = ~_146;
    int _168 = _166 + 1;
    int _170 = _168 + 1;
    int _172 = _170;
    if (!_111)
    {
        int _174 = ~_146;
        int _176 = _174 + 1;
        _172 = _176;
    }
    int _178 = _172;
    float _180 = float(_178);
    float _182 = _164 * (*spvDescriptorSet0.fp_c5)._m0[0].z;
    float _184 = precise::clamp(_182, 0.0, 1.0);
    float _186 = fma(_184, (*spvDescriptorSet0.fp_c5)._m0[0].y, (*spvDescriptorSet0.fp_c5)._m0[0].x);
    float _188 = fma(_156, _180, 0.5);
    float _190 = fma(_77, _186, _91);
    float _192 = fma(_79, _186, _93);
    float _194 = fma(_81, _186, _95);
    float _196 = precise::max(_188, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _198 = _190 * 4.0;
    float _200 = _192 * 4.0;
    float _202 = _194 * 4.0;
    bool _204 = _196 > 0.999000012874603271484375;
    uint _207 = as_type<uint>(half2(float2(_198, _200)));
    uint _209 = as_type<uint>(half2(float2(_202, 0.0)));
    uint _211 = extract_bits(_207, 16u, 16u);
    float _213 = float(_211);
    int _215 = int(_207) & 32767;
    uint _217 = extract_bits(_209, 0u, 8u);
    int _219 = int(_217) & 255;
    uint _221 = extract_bits(_209, 8u, 8u);
    int _223 = int(_221) & 255;
    int _225 = _223 << 8;
    int _227 = _219 | _225;
    float _229 = float(uint(_215));
    float _231 = float(uint(_227));
    float _233 = fma(_229, 6.103515625e-05, -0.3125);
    float _235 = fma(_231, 6.103515625e-05, -0.3125);
    float _237 = fma(_233, (*spvDescriptorSet0.fp_c4)._m0[0].z, (*spvDescriptorSet0.fp_c4)._m0[0].w);
    float _239 = fma(_213, 6.103515625e-05, -0.3125);
    float _241 = fma(_235, (*spvDescriptorSet0.fp_c4)._m0[0].z, (*spvDescriptorSet0.fp_c4)._m0[0].w);
    float _243 = fma(_239, (*spvDescriptorSet0.fp_c4)._m0[0].z, (*spvDescriptorSet0.fp_c4)._m0[0].w);
    bool _245 = !_204;
    float _247 = (*spvDescriptorSet0.fp_c4)._m0[0].z;
    float _249 = _180;
    float _259;
    float _261;
    float _263;
    if (!_245)
    {
        float3 _680 = float3(_237, _243, _241);
        float3 _251 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_680, float3(0.0), isnan(_680))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_680, float3(0.0), isnan(_680))).xyz;
        float _253 = _251.x;
        float _255 = _251.y;
        float _257 = _251.z;
        _259 = _255;
        _261 = _253;
        _263 = _257;
        _265 = true;
    }
    else
    {
        bool _267 = _196 >= 0.001000000047497451305389404296875;
        bool _269 = isnan(_196);
        bool _271 = _267 || _269;
        bool _273 = isnan(0.001000000047497451305389404296875);
        bool _275 = _271 || _273;
        float3 _714 = float3(_237, _243, _241);
        float3 _277 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_714, float3(0.0), isnan(_714))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_714, float3(0.0), isnan(_714))).xyz;
        float _279 = _277.x;
        float _281 = _277.y;
        float _283 = _277.z;
        float _285 = as_type<float>(_146);
        float _287 = _152;
        float _289 = 2.0;
        float _291 = _281;
        float _293 = _279;
        _263 = _283;
        if (_275)
        {
            float3 _737 = float3(_237, _243, _241);
            float3 _295 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_737, float3(0.0), isnan(_737))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_737, float3(0.0), isnan(_737))).xyz;
            float _297 = _295.x;
            float _299 = _295.y;
            float _301 = _295.z;
            _285 = _297;
            _287 = _299;
            _289 = _301;
        }
        float _303 = _285;
        float _305 = _287;
        float _307 = _289;
        float _309 = _305;
        if (_275)
        {
            float _311 = -_281;
            float _313 = _311 + _305;
            _247 = _313;
        }
        float _315 = _247;
        if (_275)
        {
            float _317 = -_279;
            float _319 = _317 + _303;
            _249 = _319;
        }
        float _321 = _249;
        if (_275)
        {
            float _323 = -_283;
            float _325 = _323 + _307;
            _309 = _325;
        }
        float _327 = _309;
        if (_275)
        {
            float _329 = fma(_196, _315, _281);
            _291 = _329;
        }
        float _331 = _291;
        _259 = _331;
        if (_275)
        {
            float _333 = fma(_196, _321, _279);
            _293 = _333;
        }
        float _335 = _293;
        _261 = _335;
        if (_275)
        {
            float _337 = fma(_196, _327, _283);
            _263 = _337;
        }
    }
    _265 = false;
    float _339 = _259;
    float _341 = _261;
    float _343 = _263;
    float _345 = _339 * 0.715200006961822509765625;
    float _347 = fma(_341, 0.2125999927520751953125, _345);
    float _349 = fma(_343, 0.072200000286102294921875, _347);
    float _351 = 1.0 / _349;
    float _353 = _351 * (*spvDescriptorSet0.fp_c5)._m0[1].z;
    float _355 = precise::clamp(_353, 0.0, 1.0);
    float _357 = fma(_355, (*spvDescriptorSet0.fp_c5)._m0[1].y, (*spvDescriptorSet0.fp_c5)._m0[1].x);
    float _359 = _357 * _341;
    float _361 = _357 * _339;
    float _363 = _357 * _343;
    out.m_45.x = _359;
    out.m_45.y = _361;
    out.m_45.z = _363;
    out.m_45.w = _83;
    return out;
}

