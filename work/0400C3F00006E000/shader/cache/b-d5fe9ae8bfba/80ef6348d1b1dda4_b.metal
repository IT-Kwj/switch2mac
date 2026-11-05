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
    texture2d<float> fp_t_tcb_8 [[id(1)]];
    sampler fp_t_tcb_8Smplr [[id(2)]];
    texture2d<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    sampler fp_t_tcb_8Smplr_w [[id(5)]];
    sampler fp_t_tcb_ASmplr_w [[id(6)]];
    constant dm_border_t* dm_border [[id(7)]];
};

struct main0_out
{
    float4 m_36 [[color(0)]];
};

struct main0_in
{
    float4 m_31 [[user(locn0)]];
    float4 m_33 [[user(locn1)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _43 = gl_FragCoord.w;
    float _45 = in.m_31.x;
    float _47 = gl_FragCoord.w;
    float _49 = _45 * _47;
    float _51 = in.m_31.y;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = 1.0 / _43;
    float _59 = _57 * _49;
    float _61 = _57 * _55;
    float2 _295 = float2(_59, _61);
    float _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_295, float2(0.0), isnan(_295))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_295, float2(0.0), isnan(_295))).x;
    float _65 = in.m_33.y;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = in.m_33.x;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = in.m_33.z;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = _57 * _69;
    float _85 = _57 * _75;
    float _87 = _57 * _81;
    float _89 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _91 = precise::clamp(_89, 0.0, 1.0);
    float _93 = precise::max(_91, _87);
    bool _97 = _93 != 0.0;
    bool _99 = isnan(_93);
    bool _101 = _97 || _99;
    bool _103 = isnan(0.0);
    bool _105 = _101 || _103;
    float _107 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _109 = precise::clamp(_107, 0.0, 1.0);
    float _111 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _113 = precise::clamp(_111, 0.0, 1.0);
    float _115 = precise::min(_109, _113);
    bool _117 = !_105;
    if (!_117)
    {
        float _119 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _121 = fma(_93, _119, 1.0);
        float _123 = log2(_121);
        float _125 = _123 + (-1.0);
        float _127 = exp2(_125);
        float _129 = _127 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
        float _131 = fma(_129, (*spvDescriptorSet0.fp_c3)._m0[8].x, _59);
        float _133 = fma(_129, (*spvDescriptorSet0.fp_c3)._m0[8].y, _61);
        float _135 = -_129;
        float _137 = fma(_135, (*spvDescriptorSet0.fp_c3)._m0[8].x, _59);
        float _139 = -_129;
        float _141 = fma(_139, (*spvDescriptorSet0.fp_c3)._m0[8].y, _61);
        float _143 = fma(_129, (*spvDescriptorSet0.fp_c3)._m0[8].z, _59);
        float _145 = fma(_129, (*spvDescriptorSet0.fp_c3)._m0[8].w, _61);
        float _147 = -_129;
        float _149 = fma(_147, (*spvDescriptorSet0.fp_c3)._m0[8].z, _59);
        float _151 = -_129;
        float _153 = fma(_151, (*spvDescriptorSet0.fp_c3)._m0[8].w, _61);
        float2 _453 = float2(_131, _133);
        float3 _157 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_453, float2(0.0), isnan(_453)), level(_125)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_453, float2(0.0), isnan(_453)), level(_125)).xyz;
        float _159 = _157.x;
        float _161 = _157.y;
        float _163 = _157.z;
        float2 _468 = float2(_137, _141);
        float3 _165 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_468, float2(0.0), isnan(_468)), level(_125)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_468, float2(0.0), isnan(_468)), level(_125)).xyz;
        float _167 = _165.x;
        float _169 = _165.y;
        float _171 = _165.z;
        float2 _483 = float2(_143, _145);
        float3 _173 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_483, float2(0.0), isnan(_483)), level(_125)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_483, float2(0.0), isnan(_483)), level(_125)).xyz;
        float _175 = _173.x;
        float _177 = _173.y;
        float _179 = _173.z;
        float2 _498 = float2(_149, _153);
        float3 _181 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_498, float2(0.0), isnan(_498)), level(_125)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_498, float2(0.0), isnan(_498)), level(_125)).xyz;
        float _183 = _181.x;
        float _185 = _181.y;
        float _187 = _181.z;
        float _189 = 0.0 + _123;
        float _191 = precise::clamp(_189, 0.0, 1.0);
        float _193 = fma(_83, _191, _85);
        float _195 = _115 * (*spvDescriptorSet0.fp_c3)._m0[0].w;
        float _197 = _161 + _169;
        float _199 = _159 + _167;
        float _201 = _163 + _171;
        float _203 = _197 + _177;
        float _205 = _199 + _175;
        float _207 = _201 + _179;
        float _209 = _203 + _185;
        float _211 = _205 + _183;
        float _213 = _207 + _187;
        float _215 = _209 * 0.14665000140666961669921875;
        float _217 = _209 * 0.25;
        float _219 = _213 * 0.25;
        float _221 = fma(_211, 0.0747250020503997802734375, _215);
        float _223 = _211 * 0.25;
        float _225 = fma(_213, 0.028599999845027923583984375, _221);
        float _227 = -_223;
        float _229 = _227 + _225;
        float _231 = -_217;
        float _233 = _231 + _225;
        float _235 = -_219;
        float _237 = _235 + _225;
        float _239 = fma(_195, _229, _223);
        float _241 = fma(_195, _233, _217);
        float _243 = fma(_195, _237, _219);
        float _245 = -_239;
        float _247 = fma(_239, (*spvDescriptorSet0.fp_c3)._m0[13].x, _245);
        float _249 = -_241;
        float _251 = fma(_241, (*spvDescriptorSet0.fp_c3)._m0[13].y, _249);
        float _253 = -_243;
        float _255 = fma(_243, (*spvDescriptorSet0.fp_c3)._m0[13].z, _253);
        float _257 = fma(_115, _247, _239);
        float _259 = fma(_115, _251, _241);
        float _261 = fma(_115, _255, _243);
        out.m_36.x = _257;
        out.m_36.y = _259;
        out.m_36.z = _261;
        out.m_36.w = _193;
        return out;
    }
    discard_fragment();
    return out;
}

