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
    constant _16* fp_c9 [[id(0)]];
    constant _16* fp_c10 [[id(1)]];
    constant _16* fp_c8 [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    texture2d<float> fp_t_tcb_C [[id(7)]];
    sampler fp_t_tcb_CSmplr [[id(8)]];
    sampler fp_t_tcb_8Smplr_w [[id(9)]];
    sampler fp_t_tcb_ASmplr_w [[id(10)]];
    sampler fp_t_tcb_CSmplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_46 [[color(0)]];
};

struct main0_in
{
    float4 m_39 [[user(locn0)]];
    float4 m_41 [[user(locn1)]];
    float4 m_37 [[user(locn2)]];
    float4 m_43 [[user(locn3)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _53 = gl_FragCoord.w;
    float _55 = in.m_37.x;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = in.m_37.y;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = 1.0 / _53;
    float _69 = _67 * _59;
    float _71 = _67 * _65;
    float2 _324 = float2(_69, _71);
    float2 _75 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_324, float2(0.0), isnan(_324))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_324, float2(0.0), isnan(_324))).xy;
    float _77 = _75.x;
    float _79 = _75.y;
    float _81 = in.m_37.z;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = in.m_37.w;
    float _89 = gl_FragCoord.w;
    float _91 = _87 * _89;
    float _93 = _67 * _85;
    float _95 = _67 * _91;
    float _97 = fma(_77, (*spvDescriptorSet0.fp_c9)._m0[191].x, _93);
    float _99 = fma(_79, (*spvDescriptorSet0.fp_c9)._m0[191].x, _95);
    float2 _373 = float2(_97, _99);
    float _101 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_373, float2(0.0), isnan(_373))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_373, float2(0.0), isnan(_373))).w;
    float _103 = in.m_39.w;
    float _105 = gl_FragCoord.w;
    float _107 = _103 * _105;
    float _109 = in.m_41.x;
    float _111 = gl_FragCoord.w;
    float _113 = _109 * _111;
    float _115 = _67 * _107;
    float _117 = _67 * _113;
    float _119 = -(*spvDescriptorSet0.fp_c10)._m0[8].w;
    float _121 = (*spvDescriptorSet0.fp_c8)._m0[29].x + _119;
    float _123 = -(*spvDescriptorSet0.fp_c10)._m0[10].w;
    float _125 = (*spvDescriptorSet0.fp_c8)._m0[29].z + _123;
    float _127 = in.m_43.y;
    float _129 = gl_FragCoord.w;
    float _131 = _127 * _129;
    float _133 = in.m_43.x;
    float _135 = gl_FragCoord.w;
    float _137 = _133 * _135;
    float _139 = in.m_43.z;
    float _141 = gl_FragCoord.w;
    float _143 = _139 * _141;
    float _145 = _67 * _131;
    float _147 = _115 * _101;
    float _149 = 0.0 + _147;
    float _151 = precise::clamp(_149, 0.0, 1.0);
    float _153 = _151 * _117;
    bool _157 = _153 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _159 = isnan(_153);
    bool _161 = _157 || _159;
    bool _163 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _165 = _161 || _163;
    float _167 = -(*spvDescriptorSet0.fp_c10)._m0[9].w;
    float _169 = (*spvDescriptorSet0.fp_c8)._m0[29].y + _167;
    if (!_165)
    {
        discard_fragment();
    }
    float _171 = _169 * _169;
    float _173 = fma(_121, _121, _171);
    float _175 = fma(_125, _125, _173);
    float _177 = (*spvDescriptorSet0.fp_c8)._m0[1].y * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _179 = rsqrt(_175);
    float _181 = fma((*spvDescriptorSet0.fp_c8)._m0[1].x, (*spvDescriptorSet0.fp_c8)._m0[1].x, _177);
    float _183 = fma((*spvDescriptorSet0.fp_c8)._m0[1].z, (*spvDescriptorSet0.fp_c8)._m0[1].z, _181);
    float _185 = rsqrt(_183);
    float _187 = _121 * _179;
    float _189 = _169 * _179;
    float _191 = _125 * _179;
    float _193 = _185 * (*spvDescriptorSet0.fp_c8)._m0[1].x;
    float _195 = _185 * (*spvDescriptorSet0.fp_c8)._m0[1].z;
    float _197 = _185 * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _199 = _193 * _191;
    float _201 = _195 * _189;
    float _203 = -_199;
    float _205 = fma(_195, _187, _203);
    float _207 = _197 * _187;
    float _209 = -_201;
    float _211 = fma(_197, _191, _209);
    float _213 = _67 * _137;
    float _215 = -(*spvDescriptorSet0.fp_c10)._m0[9].w;
    float _217 = _145 + _215;
    float _219 = -_207;
    float _221 = fma(_193, _189, _219);
    float _223 = _191 * _205;
    float _225 = -(*spvDescriptorSet0.fp_c10)._m0[8].w;
    float _227 = _213 + _225;
    float _229 = _205 * _217;
    float _231 = _187 * _221;
    float _233 = -_223;
    float _235 = fma(_189, _221, _233);
    float _237 = _67 * _143;
    float _239 = _189 * _211;
    float _241 = -_231;
    float _243 = fma(_191, _211, _241);
    float _245 = fma(_211, _227, _229);
    float _247 = -(*spvDescriptorSet0.fp_c10)._m0[10].w;
    float _249 = _237 + _247;
    float _251 = -_239;
    float _253 = fma(_187, _205, _251);
    float _255 = _217 * _243;
    float _257 = fma(_221, _249, _245);
    float _259 = fma(_227, _235, _255);
    float _261 = _257 + 0.5;
    float _263 = fma(_249, _253, _259);
    float _265 = -_263;
    float _267 = _265 + 0.5;
    float _269 = fma((*spvDescriptorSet0.fp_c9)._m0[191].y, 0.5, -0.5);
    float _271 = -_269;
    float _273 = fma(_261, (*spvDescriptorSet0.fp_c9)._m0[191].y, _271);
    float _275 = -_269;
    float _277 = fma(_267, (*spvDescriptorSet0.fp_c9)._m0[191].y, _275);
    float2 _658 = float2(_273, _277);
    float3 _281 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_658, float2(0.0), isnan(_658))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_658, float2(0.0), isnan(_658))).xyz;
    float _283 = _281.x;
    float _285 = _281.y;
    float _287 = _281.z;
    if (!_165)
    {
        out.m_46.x = _283;
        out.m_46.y = _285;
        out.m_46.z = _287;
        out.m_46.w = _147;
        return out;
    }
    float _289 = 0.0 + _153;
    float _291 = precise::clamp(_289, 0.0, 1.0);
    out.m_46.x = _283;
    out.m_46.y = _285;
    out.m_46.z = _287;
    out.m_46.w = _291;
    return out;
}

