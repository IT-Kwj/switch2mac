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
    constant _16* fp_c5 [[id(1)]];
    constant _16* fp_c3 [[id(2)]];
    texture2d<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    sampler fp_t_tcb_ASmplr_w [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

struct main0_out
{
    float4 m_38 [[color(0)]];
};

struct main0_in
{
    float4 m_35 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _45 = gl_FragCoord.w;
    float _47 = in.m_35.x;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = in.m_35.y;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = 1.0 / _45;
    float _61 = _59 * _51;
    float _63 = _59 * _57;
    float2 _301 = float2(_61, _63);
    float3 _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_301, float2(0.0), isnan(_301))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_301, float2(0.0), isnan(_301))).xyz;
    float _69 = _67.x;
    float _71 = _67.y;
    float _73 = _67.z;
    float _75 = _71 * (*spvDescriptorSet0.fp_c4)._m0[1].y;
    float _77 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[1].x, _75);
    float _79 = _71 * (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _81 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[1].z, _77);
    float _83 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[2].x, _79);
    float _85 = _71 * (*spvDescriptorSet0.fp_c4)._m0[3].y;
    float _87 = _71 * (*spvDescriptorSet0.fp_c4)._m0[4].y;
    float _89 = fma(_81, -0.5, 0.5);
    float _91 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[2].z, _83);
    float _93 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[3].x, _85);
    float _95 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[4].x, _87);
    float _97 = abs(_89);
    float _99 = log2(_97);
    float _101 = fma(_91, -0.5, 0.5);
    float _103 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[3].z, _93);
    float _105 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[4].z, _95);
    float _107 = fma(_103, -0.5, 0.5);
    float _109 = fma(_105, -0.5, 0.5);
    float _111 = abs(_101);
    float _113 = log2(_111);
    float _115 = abs(_107);
    float _117 = log2(_115);
    float _119 = _99 * (*spvDescriptorSet0.fp_c5)._m0[0].x;
    float _121 = _113 * (*spvDescriptorSet0.fp_c5)._m0[1].x;
    float _123 = exp2(_119);
    float _125 = _117 * (*spvDescriptorSet0.fp_c5)._m0[2].x;
    float _127 = exp2(_121);
    float _129 = abs(_109);
    float _131 = log2(_129);
    float2 _423 = float2(_123, (*spvDescriptorSet0.fp_c5)._m0[8].x);
    float _133 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_423, float2(0.0), isnan(_423))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_423, float2(0.0), isnan(_423))).x;
    float _135 = exp2(_125);
    float2 _435 = float2(_127, (*spvDescriptorSet0.fp_c5)._m0[9].x);
    float _137 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_435, float2(0.0), isnan(_435))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_435, float2(0.0), isnan(_435))).x;
    float _139 = _131 * (*spvDescriptorSet0.fp_c5)._m0[3].x;
    float _141 = exp2(_139);
    float2 _451 = float2(_135, (*spvDescriptorSet0.fp_c5)._m0[10].x);
    float _143 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_451, float2(0.0), isnan(_451))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_451, float2(0.0), isnan(_451))).x;
    float2 _461 = float2(_141, (*spvDescriptorSet0.fp_c5)._m0[11].x);
    float _145 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_461, float2(0.0), isnan(_461))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_461, float2(0.0), isnan(_461))).x;
    float _147 = _89 + _101;
    float _149 = abs(_73);
    float _151 = -_149;
    float _153 = _151 + 1.0;
    float _155 = _147 + _107;
    float _157 = _153 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _159 = precise::clamp(_157, 0.0, 1.0);
    float _161 = _109 + _155;
    float _163 = abs(_159);
    float _165 = log2(_163);
    float _167 = -(*spvDescriptorSet0.fp_c5)._m0[16].x;
    float _169 = _167 + (*spvDescriptorSet0.fp_c5)._m0[17].x;
    float _171 = -(*spvDescriptorSet0.fp_c5)._m0[18].x;
    float _173 = _171 + (*spvDescriptorSet0.fp_c5)._m0[19].x;
    float _175 = -(*spvDescriptorSet0.fp_c5)._m0[16].y;
    float _177 = _175 + (*spvDescriptorSet0.fp_c5)._m0[17].y;
    float _179 = -(*spvDescriptorSet0.fp_c5)._m0[16].z;
    float _181 = _179 + (*spvDescriptorSet0.fp_c5)._m0[17].z;
    float _183 = -(*spvDescriptorSet0.fp_c5)._m0[18].y;
    float _185 = _183 + (*spvDescriptorSet0.fp_c5)._m0[19].y;
    float _187 = -(*spvDescriptorSet0.fp_c5)._m0[18].z;
    float _189 = _187 + (*spvDescriptorSet0.fp_c5)._m0[19].z;
    float _191 = -(*spvDescriptorSet0.fp_c5)._m0[20].y;
    float _193 = _191 + (*spvDescriptorSet0.fp_c5)._m0[21].y;
    float _195 = -(*spvDescriptorSet0.fp_c5)._m0[20].z;
    float _197 = _195 + (*spvDescriptorSet0.fp_c5)._m0[21].z;
    float _199 = fma(_133, _169, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _201 = fma(_133, _177, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _203 = fma(_133, _181, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _205 = fma(_137, _173, (*spvDescriptorSet0.fp_c5)._m0[18].x);
    float _207 = fma(_137, _185, (*spvDescriptorSet0.fp_c5)._m0[18].y);
    float _209 = fma(_137, _189, (*spvDescriptorSet0.fp_c5)._m0[18].z);
    float _211 = _199 + _205;
    float _213 = _203 + _209;
    float _215 = _201 + _207;
    float _217 = -(*spvDescriptorSet0.fp_c5)._m0[20].x;
    float _219 = _217 + (*spvDescriptorSet0.fp_c5)._m0[21].x;
    float _221 = _165 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _223 = fma(_143, _219, (*spvDescriptorSet0.fp_c5)._m0[20].x);
    float _225 = fma(_143, _193, (*spvDescriptorSet0.fp_c5)._m0[20].y);
    float _227 = fma(_143, _197, (*spvDescriptorSet0.fp_c5)._m0[20].z);
    float _229 = exp2(_221);
    float _231 = _211 + _223;
    float _233 = _215 + _225;
    float _235 = -(*spvDescriptorSet0.fp_c5)._m0[22].x;
    float _237 = _235 + (*spvDescriptorSet0.fp_c5)._m0[23].x;
    float _239 = -(*spvDescriptorSet0.fp_c5)._m0[22].y;
    float _241 = _239 + (*spvDescriptorSet0.fp_c5)._m0[23].y;
    float _243 = -(*spvDescriptorSet0.fp_c5)._m0[22].z;
    float _245 = _243 + (*spvDescriptorSet0.fp_c5)._m0[23].z;
    float _247 = _213 + _227;
    float _249 = fma(_145, _237, (*spvDescriptorSet0.fp_c5)._m0[22].x);
    float _251 = fma(_145, _241, (*spvDescriptorSet0.fp_c5)._m0[22].y);
    float _253 = fma(_145, _245, (*spvDescriptorSet0.fp_c5)._m0[22].z);
    float _255 = _249 + _231;
    float _257 = _251 + _233;
    float _259 = _253 + _247;
    float _261 = fma(_229, (*spvDescriptorSet0.fp_c4)._m0[0].w, _161);
    float _263 = fma(_229, (*spvDescriptorSet0.fp_c4)._m0[0].x, _255);
    float _265 = fma(_229, (*spvDescriptorSet0.fp_c4)._m0[0].y, _257);
    float _267 = fma(_229, (*spvDescriptorSet0.fp_c4)._m0[0].z, _259);
    out.m_38.x = _263;
    out.m_38.y = _265;
    out.m_38.z = _267;
    out.m_38.w = _261;
    return out;
}

