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
    float4 m_27 [[user(locn0), center_no_perspective]];
    float4 m_29 [[user(locn1), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _39 = in.m_27.y;
    float _41 = in.m_27.x;
    float _43 = in.m_29.x;
    float _45 = in.m_29.y;
    float _47 = _39 * _39;
    float _49 = _41 * 2.0;
    float _51 = _39 * 2.0;
    float _53 = _41 * 3.0;
    float _55 = fma(_41, _41, _47);
    float _57 = _43 + _49;
    float _59 = _45 + _51;
    float _61 = _53 + _43;
    float _63 = _43 + _41;
    float _65 = fma(_49, (*spvDescriptorSet0.fp_c3)._m0[2].x, _57);
    float _67 = rsqrt(_55);
    float _69 = fma(_49, (*spvDescriptorSet0.fp_c3)._m0[2].y, _57);
    float _71 = fma(_51, (*spvDescriptorSet0.fp_c3)._m0[2].x, _59);
    float _73 = fma(_51, (*spvDescriptorSet0.fp_c3)._m0[2].y, _59);
    float _75 = fma(_49, (*spvDescriptorSet0.fp_c3)._m0[2].z, _57);
    float _77 = fma(_51, (*spvDescriptorSet0.fp_c3)._m0[2].z, _59);
    float _79 = fma(_53, (*spvDescriptorSet0.fp_c3)._m0[2].x, _61);
    float _81 = fma(_53, (*spvDescriptorSet0.fp_c3)._m0[2].y, _61);
    float _83 = fma(_53, (*spvDescriptorSet0.fp_c3)._m0[2].z, _61);
    float _85 = fma(_41, (*spvDescriptorSet0.fp_c3)._m0[2].x, _63);
    float _87 = fma(_41, (*spvDescriptorSet0.fp_c3)._m0[2].y, _63);
    float _89 = fma(_41, (*spvDescriptorSet0.fp_c3)._m0[2].z, _63);
    float _91 = _45 + _39;
    float _93 = _39 * 3.0;
    float _95 = _67 * (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _97 = fma(_39, (*spvDescriptorSet0.fp_c3)._m0[2].x, _91);
    float _99 = fma(_39, (*spvDescriptorSet0.fp_c3)._m0[2].y, _91);
    float _101 = fma(_39, (*spvDescriptorSet0.fp_c3)._m0[2].z, _91);
    float _103 = _41 * _95;
    float _105 = _39 * _95;
    float _107 = _93 + _45;
    float _109 = _103 + _43;
    float _111 = _105 + _45;
    float _113 = fma(_93, (*spvDescriptorSet0.fp_c3)._m0[2].x, _107);
    float _115 = fma(_93, (*spvDescriptorSet0.fp_c3)._m0[2].y, _107);
    float _117 = fma(_93, (*spvDescriptorSet0.fp_c3)._m0[2].z, _107);
    float _119 = fma(_103, (*spvDescriptorSet0.fp_c3)._m0[2].x, _109);
    float _121 = fma(_103, (*spvDescriptorSet0.fp_c3)._m0[2].y, _109);
    float _123 = fma(_103, (*spvDescriptorSet0.fp_c3)._m0[2].z, _109);
    float _125 = fma(_105, (*spvDescriptorSet0.fp_c3)._m0[2].x, _111);
    float _127 = fma(_105, (*spvDescriptorSet0.fp_c3)._m0[2].y, _111);
    float _129 = fma(_105, (*spvDescriptorSet0.fp_c3)._m0[2].z, _111);
    float2 _382 = float2(_89, _101);
    float _131 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_382, float2(0.0), isnan(_382))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_382, float2(0.0), isnan(_382))).z;
    float2 _394 = float2(_43, _45);
    float _133 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_394, float2(0.0), isnan(_394))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_394, float2(0.0), isnan(_394))).z;
    float2 _402 = float2(_75, _77);
    float _135 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_402, float2(0.0), isnan(_402))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_402, float2(0.0), isnan(_402))).z;
    float2 _410 = float2(_83, _117);
    float _137 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_410, float2(0.0), isnan(_410))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_410, float2(0.0), isnan(_410))).z;
    float2 _418 = float2(_85, _97);
    float _139 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_418, float2(0.0), isnan(_418))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_418, float2(0.0), isnan(_418))).x;
    float2 _426 = float2(_43, _45);
    float _141 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_426, float2(0.0), isnan(_426))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_426, float2(0.0), isnan(_426))).x;
    float2 _434 = float2(_43, _45);
    float _143 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_434, float2(0.0), isnan(_434))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_434, float2(0.0), isnan(_434))).y;
    float2 _442 = float2(_87, _99);
    float _145 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_442, float2(0.0), isnan(_442))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_442, float2(0.0), isnan(_442))).y;
    float2 _450 = float2(_65, _71);
    float _147 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_450, float2(0.0), isnan(_450))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_450, float2(0.0), isnan(_450))).x;
    float2 _458 = float2(_69, _73);
    float _149 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_458, float2(0.0), isnan(_458))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_458, float2(0.0), isnan(_458))).y;
    float2 _466 = float2(_79, _113);
    float _151 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_466, float2(0.0), isnan(_466))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_466, float2(0.0), isnan(_466))).x;
    float2 _474 = float2(_81, _115);
    float _153 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_474, float2(0.0), isnan(_474))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_474, float2(0.0), isnan(_474))).y;
    float2 _482 = float2(_119, _125);
    float _155 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_482, float2(0.0), isnan(_482))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_482, float2(0.0), isnan(_482))).x;
    float2 _490 = float2(_121, _127);
    float _157 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_490, float2(0.0), isnan(_490))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_490, float2(0.0), isnan(_490))).y;
    float2 _498 = float2(_123, _129);
    float _159 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_498, float2(0.0), isnan(_498))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_498, float2(0.0), isnan(_498))).z;
    float _161 = _133 + _131;
    float _163 = _141 + _139;
    float _165 = _161 + _135;
    float _167 = _143 + _145;
    float _169 = _163 + _147;
    float _171 = _137 + _165;
    float _173 = _167 + _149;
    float _175 = _151 + _169;
    float _177 = _153 + _173;
    float _179 = fma(_159, (*spvDescriptorSet0.fp_c3)._m0[1].z, _171);
    float _181 = fma(_155, (*spvDescriptorSet0.fp_c3)._m0[1].x, _175);
    float _183 = fma(_157, (*spvDescriptorSet0.fp_c3)._m0[1].y, _177);
    float _185 = _179 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _187 = _181 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _189 = _183 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    out.m_32.x = _187;
    out.m_32.y = _189;
    out.m_32.z = _185;
    return out;
}

