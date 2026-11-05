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
    float4 m_38 [[user(locn0)]];
    float4 m_31 [[user(locn1)]];
    float4 m_33 [[user(locn2)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _45 = gl_FragCoord.w;
    float _47 = in.m_31.x;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = in.m_31.y;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = 1.0 / _45;
    float _61 = _59 * _51;
    float _63 = _59 * _57;
    float2 _287 = float2(_61, _63);
    float3 _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_287, float2(0.0), isnan(_287))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_287, float2(0.0), isnan(_287))).xyz;
    float _69 = _67.x;
    float _71 = _67.y;
    float _73 = _67.z;
    float _75 = in.m_33.x;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_33.y;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = _59 * _79;
    float _89 = _59 * _85;
    bool _93 = _73 > 0.0;
    bool _95 = isnan(_73);
    bool _97 = _93 || _95;
    bool _99 = isnan(0.0);
    bool _101 = _97 || _99;
    if (!_101)
    {
        discard_fragment();
    }
    float2 _339 = float2(_87, _89);
    float _103 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_339, float2(0.0), isnan(_339))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_339, float2(0.0), isnan(_339))).x;
    if (!_101)
    {
        out.m_36.x = 0.0;
        out.m_36.y = 0.0;
        out.m_36.z = 0.0;
        out.m_36.w = 0.0;
        return out;
    }
    float _105 = -_71;
    float _107 = _105 + 1.0;
    float _109 = _71 * (*spvDescriptorSet0.fp_c3)._m0[18].x;
    float _111 = in.m_38.x;
    float _113 = gl_FragCoord.w;
    float _115 = _111 * _113;
    float _117 = fma(_73, _107, _71);
    float _119 = _103 * _109;
    float _121 = _107 * _73;
    float _123 = in.m_38.y;
    float _125 = gl_FragCoord.w;
    float _127 = _123 * _125;
    float _129 = in.m_38.z;
    float _131 = gl_FragCoord.w;
    float _133 = _129 * _131;
    float _135 = in.m_38.w;
    float _137 = gl_FragCoord.w;
    float _139 = _135 * _137;
    float _141 = -(*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _143 = _141 + (*spvDescriptorSet0.fp_c3)._m0[4].x;
    float _145 = -(*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _147 = _145 + (*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _149 = -(*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _151 = _149 + (*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _153 = 1.0 / _117;
    float _155 = -_109;
    float _157 = _155 + 1.0;
    float _159 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _161 = _159 + (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _163 = fma(_63, _143, (*spvDescriptorSet0.fp_c3)._m0[3].x);
    float _165 = fma(_63, _147, (*spvDescriptorSet0.fp_c3)._m0[3].y);
    float _167 = fma(_63, _151, (*spvDescriptorSet0.fp_c3)._m0[3].z);
    float _169 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _171 = _169 + (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _173 = fma(_117, _157, _109);
    float _175 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _177 = _175 + (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _179 = fma(_63, _161, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _181 = _163 * _121;
    float _183 = _165 * _121;
    float _185 = _167 * _121;
    float _187 = -_69;
    float _189 = _187 + 1.0;
    float _191 = fma(_63, _171, (*spvDescriptorSet0.fp_c3)._m0[5].y);
    float _193 = fma(_63, _177, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _195 = fma(_71, _179, _181);
    float _197 = fma(_173, _189, _69);
    float _199 = fma(_71, _191, _183);
    float _201 = fma(_71, _193, _185);
    float _203 = _173 * _189;
    float _205 = _195 * _153;
    float _207 = 1.0 / _197;
    float _209 = _199 * _153;
    float _211 = _201 * _153;
    float _213 = fma(_119, (*spvDescriptorSet0.fp_c3)._m0[2].x, _205);
    float _215 = _59 * _115;
    float _217 = fma(_119, (*spvDescriptorSet0.fp_c3)._m0[2].y, _209);
    float _219 = fma(_119, (*spvDescriptorSet0.fp_c3)._m0[2].z, _211);
    float _221 = _213 * _203;
    float _223 = _59 * _127;
    float _225 = _217 * _203;
    float _227 = _219 * _203;
    float _229 = _59 * _133;
    float _231 = _59 * _139;
    float _233 = fma(_69, _215, _221);
    float _235 = fma(_69, _223, _225);
    float _237 = fma(_69, _229, _227);
    float _239 = _231 * _197;
    float _241 = precise::clamp(_239, 0.0, 1.0);
    float _243 = _233 * _207;
    float _245 = precise::clamp(_243, 0.0, 1.0);
    float _247 = _235 * _207;
    float _249 = precise::clamp(_247, 0.0, 1.0);
    float _251 = _237 * _207;
    float _253 = precise::clamp(_251, 0.0, 1.0);
    out.m_36.x = _245;
    out.m_36.y = _249;
    out.m_36.z = _253;
    out.m_36.w = _241;
    return out;
}

