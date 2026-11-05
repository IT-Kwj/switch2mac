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
    constant _16* fp_c5 [[id(1)]];
    constant _16* fp_c4 [[id(2)]];
    texture2d<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    texture3d<float> fp_t_tcb_C [[id(7)]];
    sampler fp_t_tcb_CSmplr [[id(8)]];
    texture3d<float> fp_t_tcb_E [[id(9)]];
    sampler fp_t_tcb_ESmplr [[id(10)]];
    sampler fp_t_tcb_ASmplr_w [[id(11)]];
    sampler fp_t_tcb_8Smplr_w [[id(12)]];
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
    bool _261 = false;
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
    float2 _374 = float2(_68, _70);
    float _72 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_374, float2(0.0), isnan(_374))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_374, float2(0.0), isnan(_374))).x;
    float2 _385 = float2(_68, _70);
    float4 _75 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_385, float2(0.0), isnan(_385))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_385, float2(0.0), isnan(_385))).xyzw;
    float _77 = _75.x;
    float _79 = _75.y;
    float _81 = _75.z;
    float _83 = _75.w;
    bool _87 = _72 >= 1.0;
    bool _89 = isnan(_72);
    bool _91 = _87 || _89;
    bool _93 = isnan(1.0);
    bool _95 = _91 || _93;
    if (_95)
    {
        out.m_45.x = _77;
        out.m_45.y = _79;
        out.m_45.z = _81;
        out.m_45.w = _83;
        return out;
    }
    float _97 = _70 + (-0.5);
    float _99 = _79 * 0.715200006961822509765625;
    float _101 = _68 + (-0.5);
    float _103 = fma(_97, (*spvDescriptorSet0.fp_c3)._m0[7].x, (*spvDescriptorSet0.fp_c3)._m0[6].y);
    float _105 = fma(_77, 0.2125999927520751953125, _99);
    float _107 = _101 + (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _109 = _103 * _103;
    bool _111 = (*spvDescriptorSet0.fp_c3)._m0[6].w > (-1.0999999631167156621813774108887e-06);
    float _113 = abs((*spvDescriptorSet0.fp_c3)._m0[6].w);
    float _115 = -_113;
    float _117 = fma(_115, 2.0, (*spvDescriptorSet0.fp_c3)._m0[6].z);
    float _119 = fma(_81, 0.072200000286102294921875, _105);
    float _121 = fma(_107, _107, _109);
    float _123 = precise::max(0.0, (*spvDescriptorSet0.fp_c3)._m0[6].z);
    float _125 = precise::max(0.0, _117);
    float _127 = 1.0 / _119;
    float _129 = -_125;
    float _131 = _123 + _129;
    bool _133 = (*spvDescriptorSet0.fp_c3)._m0[6].w >= (-1.0999999631167156621813774108887e-06);
    bool _135 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].w);
    bool _137 = _133 || _135;
    bool _139 = isnan(-1.0999999631167156621813774108887e-06);
    bool _141 = _137 || _139;
    float _143 = sqrt(_121);
    float _145 = 1.0 / _131;
    float _147 = _127 * (*spvDescriptorSet0.fp_c5)._m0[0].z;
    float _149 = precise::clamp(_147, 0.0, 1.0);
    float _151 = fma(_149, (*spvDescriptorSet0.fp_c5)._m0[0].y, (*spvDescriptorSet0.fp_c5)._m0[0].x);
    int _154 = _141 ? 0 : 1;
    float _156 = -_125;
    float _158 = _143 + _156;
    float _160 = _77 * _151;
    float _162 = _160 * 4.0;
    float _164 = _79 * _151;
    float _166 = _164 * 4.0;
    int _168 = ~_154;
    int _170 = _168 + 1;
    int _172 = _170 + 1;
    float _174 = _81 * _151;
    float _176 = _174 * 4.0;
    int _178 = _172;
    if (!_111)
    {
        int _180 = ~_154;
        int _182 = _180 + 1;
        _178 = _182;
    }
    int _184 = _178;
    uint _187 = as_type<uint>(half2(float2(_162, _166)));
    float _189 = _158 * _145;
    float _191 = precise::clamp(_189, 0.0, 1.0);
    float _193 = float(_184);
    uint _195 = extract_bits(_187, 16u, 16u);
    float _197 = float(_195);
    float _199 = fma(_191, -2.0, 3.0);
    float _201 = _191 * _191;
    uint _203 = as_type<uint>(half2(float2(_176, 0.0)));
    float _205 = fma(_201, _199, -0.5);
    uint _207 = extract_bits(_203, 0u, 8u);
    int _209 = int(_207) & 255;
    uint _211 = extract_bits(_203, 8u, 8u);
    int _213 = int(_211) & 255;
    int _215 = _213 << 8;
    int _217 = _209 | _215;
    float _219 = fma(_205, _193, 0.5);
    int _221 = int(_187) & 32767;
    float _223 = float(uint(_217));
    float _225 = precise::max(_219, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _227 = fma(_197, 6.103515625e-05, -0.3125);
    float _229 = float(uint(_221));
    float _231 = fma(_223, 6.103515625e-05, -0.3125);
    bool _233 = _225 > 0.999000012874603271484375;
    float _235 = fma(_229, 6.103515625e-05, -0.3125);
    float _237 = fma(_227, (*spvDescriptorSet0.fp_c4)._m0[0].z, (*spvDescriptorSet0.fp_c4)._m0[0].w);
    float _239 = fma(_231, (*spvDescriptorSet0.fp_c4)._m0[0].z, (*spvDescriptorSet0.fp_c4)._m0[0].w);
    float _241 = fma(_235, (*spvDescriptorSet0.fp_c4)._m0[0].z, (*spvDescriptorSet0.fp_c4)._m0[0].w);
    bool _243 = !_233;
    float _255;
    float _257;
    float _259;
    if (!_243)
    {
        float3 _659 = float3(_241, _237, _239);
        float3 _247 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_659, float3(0.0), isnan(_659))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_659, float3(0.0), isnan(_659))).xyz;
        float _249 = _247.x;
        float _251 = _247.y;
        float _253 = _247.z;
        _255 = _251;
        _257 = _249;
        _259 = _253;
        _261 = true;
    }
    else
    {
        bool _263 = _225 >= 0.001000000047497451305389404296875;
        bool _265 = isnan(_225);
        bool _267 = _263 || _265;
        bool _269 = isnan(0.001000000047497451305389404296875);
        bool _271 = _267 || _269;
        if (!_271)
        {
            float3 _696 = float3(_241, _237, _239);
            float3 _273 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_696, float3(0.0), isnan(_696))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_696, float3(0.0), isnan(_696))).xyz;
            float _275 = _273.x;
            float _277 = _273.y;
            float _279 = _273.z;
            _255 = _277;
            _257 = _275;
            _259 = _279;
            _261 = true;
        }
        else
        {
            float3 _715 = float3(_241, _237, _239);
            float3 _281 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_715, float3(0.0), isnan(_715))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_715, float3(0.0), isnan(_715))).xyz;
            float _283 = _281.x;
            float _285 = _281.y;
            float _287 = _281.z;
            float3 _730 = float3(_241, _237, _239);
            float3 _289 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_730, float3(0.0), isnan(_730))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_730, float3(0.0), isnan(_730))).xyz;
            float _291 = _289.x;
            float _293 = _289.y;
            float _295 = _289.z;
            float _297 = -_283;
            float _299 = _291 + _297;
            float _301 = -_285;
            float _303 = _293 + _301;
            float _305 = -_287;
            float _307 = _295 + _305;
            float _309 = fma(_225, _299, _283);
            float _311 = fma(_225, _303, _285);
            float _313 = fma(_225, _307, _287);
            _255 = _311;
            _257 = _309;
            _259 = _313;
        }
    }
    _261 = false;
    float _315 = _255;
    float _317 = _257;
    float _319 = _259;
    float _321 = _315 * 0.715200006961822509765625;
    float _323 = fma(_317, 0.2125999927520751953125, _321);
    float _325 = fma(_319, 0.072200000286102294921875, _323);
    float _327 = 1.0 / _325;
    float _329 = _327 * (*spvDescriptorSet0.fp_c5)._m0[1].z;
    float _331 = precise::clamp(_329, 0.0, 1.0);
    float _333 = fma(_331, (*spvDescriptorSet0.fp_c5)._m0[1].y, (*spvDescriptorSet0.fp_c5)._m0[1].x);
    float _335 = _333 * _317;
    float _337 = _333 * _315;
    float _339 = _333 * _319;
    out.m_45.x = _335;
    out.m_45.y = _337;
    out.m_45.z = _339;
    out.m_45.w = _83;
    return out;
}

