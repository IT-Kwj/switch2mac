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
    float _45 = in.m_31.y;
    float _47 = gl_FragCoord.w;
    float _49 = _45 * _47;
    float _51 = in.m_31.x;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = in.m_33.y;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = in.m_33.x;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = 1.0 / _43;
    float _71 = _69 * _49;
    float _73 = _69 * _55;
    float _75 = _69 * _61;
    float _77 = _69 * _67;
    float _79 = -(*spvDescriptorSet0.fp_c3)._m0[10].x;
    float _81 = _71 + _79;
    float _83 = _71 + (*spvDescriptorSet0.fp_c3)._m0[10].x;
    float _85 = -(*spvDescriptorSet0.fp_c3)._m0[10].y;
    float _87 = _71 + _85;
    float _89 = _71 + (*spvDescriptorSet0.fp_c3)._m0[10].y;
    float _91 = -(*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _93 = _71 + _91;
    float _95 = _71 + (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _97 = -(*spvDescriptorSet0.fp_c3)._m0[10].w;
    float _99 = _71 + _97;
    float _101 = _71 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
    float _103 = -(*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _105 = _71 + _103;
    float _107 = _71 + (*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _109 = -(*spvDescriptorSet0.fp_c3)._m0[11].y;
    float _111 = _71 + _109;
    float _113 = _71 + (*spvDescriptorSet0.fp_c3)._m0[11].y;
    float _115 = -(*spvDescriptorSet0.fp_c3)._m0[11].z;
    float _117 = _71 + _115;
    float _119 = _71 + (*spvDescriptorSet0.fp_c3)._m0[11].z;
    float _121 = -(*spvDescriptorSet0.fp_c3)._m0[11].w;
    float _123 = _71 + _121;
    float _125 = _71 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
    float _127 = -(*spvDescriptorSet0.fp_c3)._m0[12].x;
    float _129 = _71 + _127;
    float _131 = _71 + (*spvDescriptorSet0.fp_c3)._m0[12].x;
    float _133 = -(*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _135 = _71 + _133;
    float _137 = _71 + (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _139 = -(*spvDescriptorSet0.fp_c3)._m0[12].z;
    float _141 = _71 + _139;
    float _143 = _71 + (*spvDescriptorSet0.fp_c3)._m0[12].z;
    float _145 = -(*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _147 = _71 + _145;
    float _149 = _71 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float2 _462 = float2(_73, _71);
    float _151 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_462, float2(0.0), isnan(_462))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_462, float2(0.0), isnan(_462))).x;
    float2 _474 = float2(_73, _81);
    float _153 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_474, float2(0.0), isnan(_474))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_474, float2(0.0), isnan(_474))).x;
    float2 _482 = float2(_73, _83);
    float _155 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_482, float2(0.0), isnan(_482))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_482, float2(0.0), isnan(_482))).x;
    float2 _490 = float2(_73, _87);
    float _157 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_490, float2(0.0), isnan(_490))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_490, float2(0.0), isnan(_490))).x;
    float2 _498 = float2(_73, _89);
    float _159 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_498, float2(0.0), isnan(_498))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_498, float2(0.0), isnan(_498))).x;
    float2 _506 = float2(_73, _93);
    float _161 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_506, float2(0.0), isnan(_506))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_506, float2(0.0), isnan(_506))).x;
    float2 _514 = float2(_73, _95);
    float _163 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_514, float2(0.0), isnan(_514))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_514, float2(0.0), isnan(_514))).x;
    float2 _522 = float2(_73, _99);
    float _165 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_522, float2(0.0), isnan(_522))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_522, float2(0.0), isnan(_522))).x;
    float2 _530 = float2(_73, _101);
    float _167 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_530, float2(0.0), isnan(_530))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_530, float2(0.0), isnan(_530))).x;
    float2 _538 = float2(_73, _105);
    float _169 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_538, float2(0.0), isnan(_538))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_538, float2(0.0), isnan(_538))).x;
    float2 _546 = float2(_73, _107);
    float _171 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_546, float2(0.0), isnan(_546))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_546, float2(0.0), isnan(_546))).x;
    float2 _554 = float2(_73, _111);
    float _173 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_554, float2(0.0), isnan(_554))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_554, float2(0.0), isnan(_554))).x;
    float2 _562 = float2(_73, _113);
    float _175 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_562, float2(0.0), isnan(_562))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_562, float2(0.0), isnan(_562))).x;
    float2 _570 = float2(_73, _117);
    float _177 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_570, float2(0.0), isnan(_570))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_570, float2(0.0), isnan(_570))).x;
    float2 _578 = float2(_73, _119);
    float _179 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_578, float2(0.0), isnan(_578))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_578, float2(0.0), isnan(_578))).x;
    float2 _586 = float2(_73, _123);
    float _181 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_586, float2(0.0), isnan(_586))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_586, float2(0.0), isnan(_586))).x;
    float2 _594 = float2(_73, _125);
    float _183 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_594, float2(0.0), isnan(_594))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_594, float2(0.0), isnan(_594))).x;
    float2 _602 = float2(_73, _129);
    float _185 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_602, float2(0.0), isnan(_602))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_602, float2(0.0), isnan(_602))).x;
    float2 _610 = float2(_73, _131);
    float _187 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_610, float2(0.0), isnan(_610))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_610, float2(0.0), isnan(_610))).x;
    float2 _618 = float2(_73, _135);
    float _189 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_618, float2(0.0), isnan(_618))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_618, float2(0.0), isnan(_618))).x;
    float2 _626 = float2(_73, _137);
    float _191 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_626, float2(0.0), isnan(_626))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_626, float2(0.0), isnan(_626))).x;
    float2 _634 = float2(_73, _141);
    float _193 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_634, float2(0.0), isnan(_634))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_634, float2(0.0), isnan(_634))).x;
    float2 _642 = float2(_73, _143);
    float _195 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_642, float2(0.0), isnan(_642))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_642, float2(0.0), isnan(_642))).x;
    float2 _650 = float2(_73, _147);
    float _197 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_650, float2(0.0), isnan(_650))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_650, float2(0.0), isnan(_650))).x;
    float2 _658 = float2(_73, _149);
    float _199 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_658, float2(0.0), isnan(_658))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_658, float2(0.0), isnan(_658))).x;
    float2 _666 = float2(_77, _75);
    float _201 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_666, float2(0.0), isnan(_666))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_666, float2(0.0), isnan(_666))).x;
    float _203 = _151 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _205 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[18].x, _203);
    float _207 = fma(_155, (*spvDescriptorSet0.fp_c3)._m0[18].x, _205);
    float _209 = fma(_157, (*spvDescriptorSet0.fp_c3)._m0[18].y, _207);
    float _211 = fma(_159, (*spvDescriptorSet0.fp_c3)._m0[18].y, _209);
    float _213 = fma(_161, (*spvDescriptorSet0.fp_c3)._m0[18].z, _211);
    float _215 = fma(_163, (*spvDescriptorSet0.fp_c3)._m0[18].z, _213);
    float _217 = fma(_165, (*spvDescriptorSet0.fp_c3)._m0[18].w, _215);
    float _219 = (*spvDescriptorSet0.fp_c3)._m0[1].z * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _221 = fma(_167, (*spvDescriptorSet0.fp_c3)._m0[18].w, _217);
    float _223 = fma(_169, (*spvDescriptorSet0.fp_c3)._m0[19].x, _221);
    float _225 = fma(_171, (*spvDescriptorSet0.fp_c3)._m0[19].x, _223);
    float _227 = fma(_173, (*spvDescriptorSet0.fp_c3)._m0[19].y, _225);
    float _229 = fma(_175, (*spvDescriptorSet0.fp_c3)._m0[19].y, _227);
    float _231 = fma(_177, (*spvDescriptorSet0.fp_c3)._m0[19].z, _229);
    float _233 = fma(_179, (*spvDescriptorSet0.fp_c3)._m0[19].z, _231);
    float _235 = fma(_181, (*spvDescriptorSet0.fp_c3)._m0[19].w, _233);
    float _237 = fma(_183, (*spvDescriptorSet0.fp_c3)._m0[19].w, _235);
    float _239 = fma(_185, (*spvDescriptorSet0.fp_c3)._m0[20].x, _237);
    float _241 = fma(_187, (*spvDescriptorSet0.fp_c3)._m0[20].x, _239);
    float _243 = fma(_189, (*spvDescriptorSet0.fp_c3)._m0[20].y, _241);
    float _245 = fma(_191, (*spvDescriptorSet0.fp_c3)._m0[20].y, _243);
    float _247 = fma(_193, (*spvDescriptorSet0.fp_c3)._m0[20].z, _245);
    float _249 = fma(_195, (*spvDescriptorSet0.fp_c3)._m0[20].z, _247);
    float _251 = fma(_197, (*spvDescriptorSet0.fp_c3)._m0[20].w, _249);
    float _253 = fma(_199, (*spvDescriptorSet0.fp_c3)._m0[20].w, _251);
    float _255 = _253 * (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _257 = _255 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _259 = precise::clamp(_257, 0.0, 1.0);
    float _261 = -_259;
    float _263 = _261 + 1.0;
    float _265 = abs(_263);
    float _267 = log2(_265);
    float _269 = _267 * 2.2000000476837158203125;
    float _271 = exp2(_269);
    float _273 = -_201;
    float _275 = fma(_273, (*spvDescriptorSet0.fp_c3)._m0[1].w, 1.0);
    float _277 = -_271;
    float _279 = _277 + 1.0;
    float _281 = _279 * _219;
    float _283 = _281 * _275;
    out.m_36.x = _283;
    return out;
}

