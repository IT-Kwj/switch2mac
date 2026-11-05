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
    sampler fp_t_tcb_8Smplr_w [[id(3)]];
    constant dm_border_t* dm_border [[id(4)]];
};

struct main0_out
{
    float4 m_32 [[color(0)]];
};

struct main0_in
{
    float4 m_29 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _39 = gl_FragCoord.w;
    float _41 = in.m_29.y;
    float _43 = gl_FragCoord.w;
    float _45 = _41 * _43;
    float _47 = in.m_29.x;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = 1.0 / _39;
    float _55 = _53 * _45;
    float _57 = _53 * _51;
    float _59 = -(*spvDescriptorSet0.fp_c3)._m0[10].x;
    float _61 = _55 + _59;
    float2 _281 = float2(_57, _55);
    float _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_281, float2(0.0), isnan(_281))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_281, float2(0.0), isnan(_281))).x;
    float _65 = _55 + (*spvDescriptorSet0.fp_c3)._m0[10].x;
    float _67 = -(*spvDescriptorSet0.fp_c3)._m0[10].y;
    float _69 = _55 + _67;
    float _71 = _55 + (*spvDescriptorSet0.fp_c3)._m0[10].y;
    float _73 = -(*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _75 = _55 + _73;
    float2 _314 = float2(_57, _61);
    float _77 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_314, float2(0.0), isnan(_314))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_314, float2(0.0), isnan(_314))).x;
    float2 _322 = float2(_57, _65);
    float _79 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_322, float2(0.0), isnan(_322))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_322, float2(0.0), isnan(_322))).x;
    float _81 = _55 + (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float2 _334 = float2(_57, _69);
    float _83 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_334, float2(0.0), isnan(_334))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_334, float2(0.0), isnan(_334))).x;
    float2 _342 = float2(_57, _71);
    float _85 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_342, float2(0.0), isnan(_342))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_342, float2(0.0), isnan(_342))).x;
    float2 _350 = float2(_57, _75);
    float _87 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_350, float2(0.0), isnan(_350))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_350, float2(0.0), isnan(_350))).x;
    float _89 = -(*spvDescriptorSet0.fp_c3)._m0[10].w;
    float _91 = _55 + _89;
    float _93 = _55 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
    float2 _368 = float2(_57, _81);
    float _95 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_368, float2(0.0), isnan(_368))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_368, float2(0.0), isnan(_368))).x;
    float _97 = -(*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _99 = _55 + _97;
    float _101 = _55 + (*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _103 = -(*spvDescriptorSet0.fp_c3)._m0[11].y;
    float _105 = _55 + _103;
    float2 _393 = float2(_57, _91);
    float _107 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_393, float2(0.0), isnan(_393))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_393, float2(0.0), isnan(_393))).x;
    float2 _401 = float2(_57, _93);
    float _109 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_401, float2(0.0), isnan(_401))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_401, float2(0.0), isnan(_401))).x;
    float _111 = _55 + (*spvDescriptorSet0.fp_c3)._m0[11].y;
    float2 _413 = float2(_57, _99);
    float _113 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_413, float2(0.0), isnan(_413))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_413, float2(0.0), isnan(_413))).x;
    float2 _421 = float2(_57, _101);
    float _115 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_421, float2(0.0), isnan(_421))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_421, float2(0.0), isnan(_421))).x;
    float _117 = -(*spvDescriptorSet0.fp_c3)._m0[11].z;
    float _119 = _55 + _117;
    float _121 = _55 + (*spvDescriptorSet0.fp_c3)._m0[11].z;
    float _123 = -(*spvDescriptorSet0.fp_c3)._m0[11].w;
    float _125 = _55 + _123;
    float _127 = _55 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
    float _129 = -(*spvDescriptorSet0.fp_c3)._m0[12].x;
    float _131 = _55 + _129;
    float _133 = _55 + (*spvDescriptorSet0.fp_c3)._m0[12].x;
    float _135 = -(*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _137 = _55 + _135;
    float _139 = _55 + (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _141 = -(*spvDescriptorSet0.fp_c3)._m0[12].z;
    float _143 = _55 + _141;
    float _145 = _55 + (*spvDescriptorSet0.fp_c3)._m0[12].z;
    float _147 = -(*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _149 = _55 + _147;
    float _151 = _55 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float2 _490 = float2(_57, _105);
    float _153 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_490, float2(0.0), isnan(_490))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_490, float2(0.0), isnan(_490))).x;
    float2 _498 = float2(_57, _111);
    float _155 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_498, float2(0.0), isnan(_498))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_498, float2(0.0), isnan(_498))).x;
    float2 _506 = float2(_57, _119);
    float _157 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_506, float2(0.0), isnan(_506))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_506, float2(0.0), isnan(_506))).x;
    float2 _514 = float2(_57, _121);
    float _159 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_514, float2(0.0), isnan(_514))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_514, float2(0.0), isnan(_514))).x;
    float2 _522 = float2(_57, _125);
    float _161 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_522, float2(0.0), isnan(_522))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_522, float2(0.0), isnan(_522))).x;
    float2 _530 = float2(_57, _127);
    float _163 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_530, float2(0.0), isnan(_530))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_530, float2(0.0), isnan(_530))).x;
    float2 _538 = float2(_57, _131);
    float _165 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_538, float2(0.0), isnan(_538))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_538, float2(0.0), isnan(_538))).x;
    float2 _546 = float2(_57, _133);
    float _167 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_546, float2(0.0), isnan(_546))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_546, float2(0.0), isnan(_546))).x;
    float2 _554 = float2(_57, _137);
    float _169 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_554, float2(0.0), isnan(_554))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_554, float2(0.0), isnan(_554))).x;
    float2 _562 = float2(_57, _139);
    float _171 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_562, float2(0.0), isnan(_562))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_562, float2(0.0), isnan(_562))).x;
    float2 _570 = float2(_57, _143);
    float _173 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_570, float2(0.0), isnan(_570))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_570, float2(0.0), isnan(_570))).x;
    float2 _578 = float2(_57, _145);
    float _175 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_578, float2(0.0), isnan(_578))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_578, float2(0.0), isnan(_578))).x;
    float2 _586 = float2(_57, _149);
    float _177 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_586, float2(0.0), isnan(_586))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_586, float2(0.0), isnan(_586))).x;
    float2 _594 = float2(_57, _151);
    float _179 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_594, float2(0.0), isnan(_594))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_594, float2(0.0), isnan(_594))).x;
    float _181 = _63 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _183 = fma(_77, (*spvDescriptorSet0.fp_c3)._m0[18].x, _181);
    float _185 = fma(_79, (*spvDescriptorSet0.fp_c3)._m0[18].x, _183);
    float _187 = fma(_83, (*spvDescriptorSet0.fp_c3)._m0[18].y, _185);
    float _189 = fma(_85, (*spvDescriptorSet0.fp_c3)._m0[18].y, _187);
    float _191 = fma(_87, (*spvDescriptorSet0.fp_c3)._m0[18].z, _189);
    float _193 = fma(_95, (*spvDescriptorSet0.fp_c3)._m0[18].z, _191);
    float _195 = fma(_107, (*spvDescriptorSet0.fp_c3)._m0[18].w, _193);
    float _197 = fma(_109, (*spvDescriptorSet0.fp_c3)._m0[18].w, _195);
    float _199 = fma(_113, (*spvDescriptorSet0.fp_c3)._m0[19].x, _197);
    float _201 = fma(_115, (*spvDescriptorSet0.fp_c3)._m0[19].x, _199);
    float _203 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[19].y, _201);
    float _205 = fma(_155, (*spvDescriptorSet0.fp_c3)._m0[19].y, _203);
    float _207 = fma(_157, (*spvDescriptorSet0.fp_c3)._m0[19].z, _205);
    float _209 = (*spvDescriptorSet0.fp_c3)._m0[1].z * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _211 = fma(_159, (*spvDescriptorSet0.fp_c3)._m0[19].z, _207);
    float _213 = fma(_161, (*spvDescriptorSet0.fp_c3)._m0[19].w, _211);
    float _215 = fma(_163, (*spvDescriptorSet0.fp_c3)._m0[19].w, _213);
    float _217 = fma(_165, (*spvDescriptorSet0.fp_c3)._m0[20].x, _215);
    float _219 = fma(_167, (*spvDescriptorSet0.fp_c3)._m0[20].x, _217);
    float _221 = fma(_169, (*spvDescriptorSet0.fp_c3)._m0[20].y, _219);
    float _223 = fma(_171, (*spvDescriptorSet0.fp_c3)._m0[20].y, _221);
    float _225 = fma(_173, (*spvDescriptorSet0.fp_c3)._m0[20].z, _223);
    float _227 = fma(_175, (*spvDescriptorSet0.fp_c3)._m0[20].z, _225);
    float _229 = fma(_177, (*spvDescriptorSet0.fp_c3)._m0[20].w, _227);
    float _231 = fma(_179, (*spvDescriptorSet0.fp_c3)._m0[20].w, _229);
    float _233 = _231 * (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _235 = _233 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _237 = precise::clamp(_235, 0.0, 1.0);
    float _239 = _237 * _209;
    out.m_32.x = _239;
    return out;
}

