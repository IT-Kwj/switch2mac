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
    bool _217 = false;
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
    float2 _330 = float2(_68, _70);
    float _72 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_330, float2(0.0), isnan(_330))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_330, float2(0.0), isnan(_330))).x;
    float2 _341 = float2(_68, _70);
    float4 _75 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_341, float2(0.0), isnan(_341))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_341, float2(0.0), isnan(_341))).xyzw;
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
    float _97 = -(*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _99 = (*spvDescriptorSet0.fp_c3)._m0[0].w + _97;
    float _101 = (*spvDescriptorSet0.fp_c3)._m0[0].w + (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _103 = (*spvDescriptorSet0.fp_c3)._m0[0].w * (-2.0);
    float _105 = -_101;
    float _107 = fma(_72, _99, _105);
    float _109 = _79 * 0.715200006961822509765625;
    float _111 = _103 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _113 = fma(_77, 0.2125999927520751953125, _109);
    float _115 = 1.0 / _107;
    float _117 = fma(_81, 0.072200000286102294921875, _113);
    float _119 = 1.0 / _117;
    float _121 = -(*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _123 = fma(_111, _115, _121);
    float _125 = precise::max(0.0, _123);
    float _127 = _125 * (*spvDescriptorSet0.fp_c3)._m0[9].x;
    float _129 = _119 * (*spvDescriptorSet0.fp_c5)._m0[0].z;
    float _131 = precise::clamp(_129, 0.0, 1.0);
    float _133 = _127 * (-1.44269502162933349609375);
    float _135 = fma(_131, (*spvDescriptorSet0.fp_c5)._m0[0].y, (*spvDescriptorSet0.fp_c5)._m0[0].x);
    float _137 = _77 * _135;
    float _139 = _137 * 4.0;
    float _141 = exp2(_133);
    float _143 = _79 * _135;
    float _145 = _143 * 4.0;
    float _147 = _81 * _135;
    float _149 = _147 * 4.0;
    uint _152 = as_type<uint>(half2(float2(_139, _145)));
    uint _154 = as_type<uint>(half2(float2(_149, 0.0)));
    uint _156 = extract_bits(_152, 16u, 16u);
    float _158 = float(_156);
    int _161 = int(_152) & 32767;
    uint _163 = extract_bits(_154, 0u, 8u);
    int _165 = int(_163) & 255;
    uint _167 = extract_bits(_154, 8u, 8u);
    int _169 = int(_167) & 255;
    int _171 = _169 << 8;
    int _173 = _165 | _171;
    float _175 = float(uint(_161));
    float _177 = _141 + (-0.5);
    float _179 = float(uint(_173));
    float _181 = fma(_177, (*spvDescriptorSet0.fp_c3)._m0[9].z, 0.5);
    float _183 = fma(_175, 6.103515625e-05, -0.3125);
    float _185 = fma(_179, 6.103515625e-05, -0.3125);
    float _187 = precise::max(_181, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _189 = fma(_158, 6.103515625e-05, -0.3125);
    float _191 = fma(_185, (*spvDescriptorSet0.fp_c4)._m0[0].z, (*spvDescriptorSet0.fp_c4)._m0[0].w);
    float _193 = fma(_183, (*spvDescriptorSet0.fp_c4)._m0[0].z, (*spvDescriptorSet0.fp_c4)._m0[0].w);
    bool _195 = _187 > 0.999000012874603271484375;
    float _197 = fma(_189, (*spvDescriptorSet0.fp_c4)._m0[0].z, (*spvDescriptorSet0.fp_c4)._m0[0].w);
    bool _199 = !_195;
    float _211;
    float _213;
    float _215;
    if (!_199)
    {
        float3 _560 = float3(_193, _197, _191);
        float3 _203 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_560, float3(0.0), isnan(_560))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_560, float3(0.0), isnan(_560))).xyz;
        float _205 = _203.x;
        float _207 = _203.y;
        float _209 = _203.z;
        _211 = _207;
        _213 = _205;
        _215 = _209;
        _217 = true;
    }
    else
    {
        bool _219 = _187 >= 0.001000000047497451305389404296875;
        bool _221 = isnan(_187);
        bool _223 = _219 || _221;
        bool _225 = isnan(0.001000000047497451305389404296875);
        bool _227 = _223 || _225;
        if (!_227)
        {
            float3 _597 = float3(_193, _197, _191);
            float3 _229 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_597, float3(0.0), isnan(_597))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_597, float3(0.0), isnan(_597))).xyz;
            float _231 = _229.x;
            float _233 = _229.y;
            float _235 = _229.z;
            _211 = _233;
            _213 = _231;
            _215 = _235;
            _217 = true;
        }
        else
        {
            float3 _616 = float3(_193, _197, _191);
            float3 _237 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_616, float3(0.0), isnan(_616))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_616, float3(0.0), isnan(_616))).xyz;
            float _239 = _237.x;
            float _241 = _237.y;
            float _243 = _237.z;
            float3 _631 = float3(_193, _197, _191);
            float3 _245 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_631, float3(0.0), isnan(_631))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_631, float3(0.0), isnan(_631))).xyz;
            float _247 = _245.x;
            float _249 = _245.y;
            float _251 = _245.z;
            float _253 = -_241;
            float _255 = _249 + _253;
            float _257 = -_239;
            float _259 = _247 + _257;
            float _261 = -_243;
            float _263 = _251 + _261;
            float _265 = fma(_187, _255, _241);
            float _267 = fma(_187, _259, _239);
            float _269 = fma(_187, _263, _243);
            _211 = _265;
            _213 = _267;
            _215 = _269;
        }
    }
    _217 = false;
    float _271 = _211;
    float _273 = _213;
    float _275 = _215;
    float _277 = _271 * 0.715200006961822509765625;
    float _279 = fma(_273, 0.2125999927520751953125, _277);
    float _281 = fma(_275, 0.072200000286102294921875, _279);
    float _283 = 1.0 / _281;
    float _285 = _283 * (*spvDescriptorSet0.fp_c5)._m0[1].z;
    float _287 = precise::clamp(_285, 0.0, 1.0);
    float _289 = fma(_287, (*spvDescriptorSet0.fp_c5)._m0[1].y, (*spvDescriptorSet0.fp_c5)._m0[1].x);
    float _291 = _289 * _273;
    float _293 = _289 * _271;
    float _295 = _289 * _275;
    out.m_45.x = _291;
    out.m_45.y = _293;
    out.m_45.z = _295;
    out.m_45.w = _83;
    return out;
}

