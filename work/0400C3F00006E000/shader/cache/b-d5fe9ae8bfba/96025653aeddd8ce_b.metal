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
    float4 m_34 [[color(0)]];
};

struct main0_in
{
    float4 m_31 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _41 = gl_FragCoord.w;
    float _43 = in.m_31.x;
    float _45 = gl_FragCoord.w;
    float _47 = _43 * _45;
    float _49 = in.m_31.y;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = 1.0 / _41;
    float _57 = _55 * _47;
    float _59 = _55 * _53;
    float _61 = -(*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _63 = _57 + _61;
    float2 _225 = float2(_57, _59);
    float _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_225, float2(0.0), isnan(_225))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_225, float2(0.0), isnan(_225))).x;
    float _67 = _57 + (*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _69 = -(*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _71 = _57 + _69;
    float2 _247 = float2(_63, _59);
    float _73 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_247, float2(0.0), isnan(_247))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_247, float2(0.0), isnan(_247))).x;
    float _75 = _57 + (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float2 _259 = float2(_67, _59);
    float _77 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_259, float2(0.0), isnan(_259))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_259, float2(0.0), isnan(_259))).x;
    float2 _267 = float2(_71, _59);
    float _79 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_267, float2(0.0), isnan(_267))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_267, float2(0.0), isnan(_267))).x;
    float _81 = -(*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _83 = _57 + _81;
    float2 _281 = float2(_75, _59);
    float _85 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_281, float2(0.0), isnan(_281))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_281, float2(0.0), isnan(_281))).x;
    float _87 = _57 + (*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _89 = -(*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _91 = _57 + _89;
    float2 _299 = float2(_83, _59);
    float _93 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_299, float2(0.0), isnan(_299))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_299, float2(0.0), isnan(_299))).x;
    float _95 = _57 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float2 _311 = float2(_87, _59);
    float _97 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_311, float2(0.0), isnan(_311))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_311, float2(0.0), isnan(_311))).x;
    float2 _319 = float2(_91, _59);
    float _99 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_319, float2(0.0), isnan(_319))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_319, float2(0.0), isnan(_319))).x;
    float _101 = -(*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _103 = _57 + _101;
    float2 _333 = float2(_95, _59);
    float _105 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_333, float2(0.0), isnan(_333))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_333, float2(0.0), isnan(_333))).x;
    float _107 = _57 + (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _109 = -(*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _111 = _57 + _109;
    float _113 = _57 + (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _115 = -(*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _117 = _57 + _115;
    float2 _361 = float2(_103, _59);
    float _119 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_361, float2(0.0), isnan(_361))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_361, float2(0.0), isnan(_361))).x;
    float2 _369 = float2(_107, _59);
    float _121 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_369, float2(0.0), isnan(_369))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_369, float2(0.0), isnan(_369))).x;
    float _123 = _57 + (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float2 _381 = float2(_111, _59);
    float _125 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_381, float2(0.0), isnan(_381))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_381, float2(0.0), isnan(_381))).x;
    float2 _389 = float2(_113, _59);
    float _127 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_389, float2(0.0), isnan(_389))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_389, float2(0.0), isnan(_389))).x;
    float2 _397 = float2(_117, _59);
    float _129 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_397, float2(0.0), isnan(_397))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_397, float2(0.0), isnan(_397))).x;
    float _131 = -(*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _133 = _57 + _131;
    float _135 = _57 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float2 _415 = float2(_123, _59);
    float _137 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_415, float2(0.0), isnan(_415))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_415, float2(0.0), isnan(_415))).x;
    float2 _423 = float2(_133, _59);
    float _139 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_423, float2(0.0), isnan(_423))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_423, float2(0.0), isnan(_423))).x;
    float2 _431 = float2(_57, _59);
    float _141 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_431, float2(0.0), isnan(_431))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_431, float2(0.0), isnan(_431))).x;
    float2 _439 = float2(_135, _59);
    float _143 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_439, float2(0.0), isnan(_439))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_439, float2(0.0), isnan(_439))).x;
    float _145 = _65 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _147 = fma(_73, (*spvDescriptorSet0.fp_c3)._m0[18].x, _145);
    float _149 = fma(_77, (*spvDescriptorSet0.fp_c3)._m0[18].x, _147);
    float _151 = fma(_79, (*spvDescriptorSet0.fp_c3)._m0[18].y, _149);
    float _153 = fma(_85, (*spvDescriptorSet0.fp_c3)._m0[18].y, _151);
    float _155 = fma(_93, (*spvDescriptorSet0.fp_c3)._m0[18].z, _153);
    float _157 = fma(_97, (*spvDescriptorSet0.fp_c3)._m0[18].z, _155);
    float _159 = fma(_99, (*spvDescriptorSet0.fp_c3)._m0[18].w, _157);
    float _161 = fma(_105, (*spvDescriptorSet0.fp_c3)._m0[18].w, _159);
    float _163 = fma(_119, (*spvDescriptorSet0.fp_c3)._m0[19].x, _161);
    float _165 = fma(_121, (*spvDescriptorSet0.fp_c3)._m0[19].x, _163);
    float _167 = fma(_125, (*spvDescriptorSet0.fp_c3)._m0[19].y, _165);
    float _169 = fma(_127, (*spvDescriptorSet0.fp_c3)._m0[19].y, _167);
    float _171 = fma(_129, (*spvDescriptorSet0.fp_c3)._m0[19].z, _169);
    float _173 = fma(_137, (*spvDescriptorSet0.fp_c3)._m0[19].z, _171);
    float _175 = fma(_139, (*spvDescriptorSet0.fp_c3)._m0[19].w, _173);
    float _177 = -_141;
    float _179 = fma(_177, (*spvDescriptorSet0.fp_c3)._m0[1].w, 1.0);
    float _181 = fma(_143, (*spvDescriptorSet0.fp_c3)._m0[19].w, _175);
    float _183 = _181 * _179;
    out.m_34.x = _183;
    return out;
}

