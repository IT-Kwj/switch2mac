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
    float2 _305 = float2(_61, _63);
    float3 _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_305, float2(0.0), isnan(_305))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_305, float2(0.0), isnan(_305))).xyz;
    float _69 = _67.x;
    float _71 = _67.y;
    float _73 = _67.z;
    float _75 = _71 * (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _77 = _71 * (*spvDescriptorSet0.fp_c4)._m0[1].y;
    float _79 = _71 * (*spvDescriptorSet0.fp_c4)._m0[3].y;
    float _81 = _71 * (*spvDescriptorSet0.fp_c4)._m0[4].y;
    float _83 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[2].x, _75);
    float _85 = _71 * (*spvDescriptorSet0.fp_c4)._m0[5].y;
    float _87 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[1].x, _77);
    float _89 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[3].x, _79);
    float _91 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[2].z, _83);
    float _93 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[4].x, _81);
    float _95 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[5].x, _85);
    float _97 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[1].z, _87);
    float _99 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[3].z, _89);
    float _101 = fma(_91, -0.5, 0.5);
    float _103 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[4].z, _93);
    float _105 = fma(_97, -0.5, 0.5);
    float _107 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[5].z, _95);
    float _109 = fma(_99, -0.5, 0.5);
    float _111 = fma(_103, -0.5, 0.5);
    float2 _410 = float2(_105, (*spvDescriptorSet0.fp_c5)._m0[8].x);
    float _113 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_410, float2(0.0), isnan(_410))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_410, float2(0.0), isnan(_410))).x;
    float2 _420 = float2(_101, (*spvDescriptorSet0.fp_c5)._m0[9].x);
    float _115 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_420, float2(0.0), isnan(_420))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_420, float2(0.0), isnan(_420))).x;
    float _117 = fma(_107, -0.5, 0.5);
    float2 _432 = float2(_109, (*spvDescriptorSet0.fp_c5)._m0[10].x);
    float _119 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_432, float2(0.0), isnan(_432))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_432, float2(0.0), isnan(_432))).x;
    float2 _442 = float2(_111, (*spvDescriptorSet0.fp_c5)._m0[11].x);
    float _121 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_442, float2(0.0), isnan(_442))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_442, float2(0.0), isnan(_442))).x;
    float2 _452 = float2(_117, (*spvDescriptorSet0.fp_c5)._m0[12].x);
    float _123 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_452, float2(0.0), isnan(_452))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_452, float2(0.0), isnan(_452))).x;
    float _125 = _105 + _101;
    float _127 = abs(_73);
    float _129 = -_127;
    float _131 = _129 + 1.0;
    float _133 = _125 + _109;
    float _135 = _131 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _137 = precise::clamp(_135, 0.0, 1.0);
    float _139 = _133 + _111;
    float _141 = _117 + _139;
    float _143 = -(*spvDescriptorSet0.fp_c5)._m0[16].z;
    float _145 = _143 + (*spvDescriptorSet0.fp_c5)._m0[17].z;
    float _147 = -(*spvDescriptorSet0.fp_c5)._m0[16].y;
    float _149 = _147 + (*spvDescriptorSet0.fp_c5)._m0[17].y;
    float _151 = -(*spvDescriptorSet0.fp_c5)._m0[16].x;
    float _153 = _151 + (*spvDescriptorSet0.fp_c5)._m0[17].x;
    float _155 = -(*spvDescriptorSet0.fp_c5)._m0[18].x;
    float _157 = _155 + (*spvDescriptorSet0.fp_c5)._m0[19].x;
    float _159 = -(*spvDescriptorSet0.fp_c5)._m0[18].y;
    float _161 = _159 + (*spvDescriptorSet0.fp_c5)._m0[19].y;
    float _163 = abs(_137);
    float _165 = log2(_163);
    float _167 = -(*spvDescriptorSet0.fp_c5)._m0[20].x;
    float _169 = _167 + (*spvDescriptorSet0.fp_c5)._m0[21].x;
    float _171 = -(*spvDescriptorSet0.fp_c5)._m0[18].z;
    float _173 = _171 + (*spvDescriptorSet0.fp_c5)._m0[19].z;
    float _175 = -(*spvDescriptorSet0.fp_c5)._m0[20].y;
    float _177 = _175 + (*spvDescriptorSet0.fp_c5)._m0[21].y;
    float _179 = -(*spvDescriptorSet0.fp_c5)._m0[20].z;
    float _181 = _179 + (*spvDescriptorSet0.fp_c5)._m0[21].z;
    float _183 = _165 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _185 = fma(_113, _153, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _187 = fma(_115, _157, (*spvDescriptorSet0.fp_c5)._m0[18].x);
    float _189 = fma(_113, _149, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _191 = fma(_113, _145, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _193 = fma(_115, _161, (*spvDescriptorSet0.fp_c5)._m0[18].y);
    float _195 = _185 + _187;
    float _197 = fma(_119, _169, (*spvDescriptorSet0.fp_c5)._m0[20].x);
    float _199 = fma(_119, _181, (*spvDescriptorSet0.fp_c5)._m0[20].z);
    float _201 = _189 + _193;
    float _203 = fma(_119, _177, (*spvDescriptorSet0.fp_c5)._m0[20].y);
    float _205 = _195 + _197;
    float _207 = fma(_115, _173, (*spvDescriptorSet0.fp_c5)._m0[18].z);
    float _209 = _201 + _203;
    float _211 = -(*spvDescriptorSet0.fp_c5)._m0[22].x;
    float _213 = _211 + (*spvDescriptorSet0.fp_c5)._m0[23].x;
    float _215 = _191 + _207;
    float _217 = -(*spvDescriptorSet0.fp_c5)._m0[22].y;
    float _219 = _217 + (*spvDescriptorSet0.fp_c5)._m0[23].y;
    float _221 = -(*spvDescriptorSet0.fp_c5)._m0[22].z;
    float _223 = _221 + (*spvDescriptorSet0.fp_c5)._m0[23].z;
    float _225 = fma(_121, _213, (*spvDescriptorSet0.fp_c5)._m0[22].x);
    float _227 = fma(_121, _219, (*spvDescriptorSet0.fp_c5)._m0[22].y);
    float _229 = exp2(_183);
    float _231 = fma(_121, _223, (*spvDescriptorSet0.fp_c5)._m0[22].z);
    float _233 = _205 + _225;
    float _235 = _209 + _227;
    float _237 = _215 + _199;
    float _239 = -(*spvDescriptorSet0.fp_c5)._m0[24].x;
    float _241 = _239 + (*spvDescriptorSet0.fp_c5)._m0[25].x;
    float _243 = -(*spvDescriptorSet0.fp_c5)._m0[24].z;
    float _245 = _243 + (*spvDescriptorSet0.fp_c5)._m0[25].z;
    float _247 = -(*spvDescriptorSet0.fp_c5)._m0[24].y;
    float _249 = _247 + (*spvDescriptorSet0.fp_c5)._m0[25].y;
    float _251 = _237 + _231;
    float _253 = fma(_123, _241, (*spvDescriptorSet0.fp_c5)._m0[24].x);
    float _255 = fma(_123, _245, (*spvDescriptorSet0.fp_c5)._m0[24].z);
    float _257 = fma(_123, _249, (*spvDescriptorSet0.fp_c5)._m0[24].y);
    float _259 = _253 + _233;
    float _261 = _255 + _251;
    float _263 = _257 + _235;
    float _265 = fma(_229, (*spvDescriptorSet0.fp_c4)._m0[0].w, _141);
    float _267 = fma(_229, (*spvDescriptorSet0.fp_c4)._m0[0].x, _259);
    float _269 = fma(_229, (*spvDescriptorSet0.fp_c4)._m0[0].z, _261);
    float _271 = fma(_229, (*spvDescriptorSet0.fp_c4)._m0[0].y, _263);
    out.m_38.x = _267;
    out.m_38.y = _271;
    out.m_38.z = _269;
    out.m_38.w = _265;
    return out;
}

