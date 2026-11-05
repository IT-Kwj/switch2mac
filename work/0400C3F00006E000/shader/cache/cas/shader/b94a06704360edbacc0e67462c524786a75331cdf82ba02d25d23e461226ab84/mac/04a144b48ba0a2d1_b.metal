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
    float _57 = in.m_33.x;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = in.m_33.y;
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
    float2 _349 = float2(_73, _71);
    float _127 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_349, float2(0.0), isnan(_349))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_349, float2(0.0), isnan(_349))).x;
    float2 _361 = float2(_73, _81);
    float _129 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_361, float2(0.0), isnan(_361))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_361, float2(0.0), isnan(_361))).x;
    float2 _369 = float2(_73, _83);
    float _131 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_369, float2(0.0), isnan(_369))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_369, float2(0.0), isnan(_369))).x;
    float2 _377 = float2(_73, _87);
    float _133 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_377, float2(0.0), isnan(_377))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_377, float2(0.0), isnan(_377))).x;
    float2 _385 = float2(_73, _89);
    float _135 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_385, float2(0.0), isnan(_385))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_385, float2(0.0), isnan(_385))).x;
    float2 _393 = float2(_73, _93);
    float _137 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_393, float2(0.0), isnan(_393))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_393, float2(0.0), isnan(_393))).x;
    float2 _401 = float2(_73, _95);
    float _139 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_401, float2(0.0), isnan(_401))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_401, float2(0.0), isnan(_401))).x;
    float2 _409 = float2(_73, _99);
    float _141 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_409, float2(0.0), isnan(_409))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_409, float2(0.0), isnan(_409))).x;
    float2 _417 = float2(_73, _101);
    float _143 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_417, float2(0.0), isnan(_417))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_417, float2(0.0), isnan(_417))).x;
    float2 _425 = float2(_73, _105);
    float _145 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_425, float2(0.0), isnan(_425))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_425, float2(0.0), isnan(_425))).x;
    float2 _433 = float2(_73, _107);
    float _147 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_433, float2(0.0), isnan(_433))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_433, float2(0.0), isnan(_433))).x;
    float2 _441 = float2(_73, _111);
    float _149 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_441, float2(0.0), isnan(_441))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_441, float2(0.0), isnan(_441))).x;
    float2 _449 = float2(_73, _113);
    float _151 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_449, float2(0.0), isnan(_449))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_449, float2(0.0), isnan(_449))).x;
    float2 _457 = float2(_73, _117);
    float _153 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_457, float2(0.0), isnan(_457))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_457, float2(0.0), isnan(_457))).x;
    float2 _465 = float2(_73, _119);
    float _155 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_465, float2(0.0), isnan(_465))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_465, float2(0.0), isnan(_465))).x;
    float2 _473 = float2(_73, _123);
    float _157 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_473, float2(0.0), isnan(_473))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_473, float2(0.0), isnan(_473))).x;
    float2 _481 = float2(_73, _125);
    float _159 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_481, float2(0.0), isnan(_481))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_481, float2(0.0), isnan(_481))).x;
    float2 _489 = float2(_75, _77);
    float _161 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_489, float2(0.0), isnan(_489))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_489, float2(0.0), isnan(_489))).x;
    float _163 = _127 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _165 = fma(_129, (*spvDescriptorSet0.fp_c3)._m0[18].x, _163);
    float _167 = fma(_131, (*spvDescriptorSet0.fp_c3)._m0[18].x, _165);
    float _169 = fma(_133, (*spvDescriptorSet0.fp_c3)._m0[18].y, _167);
    float _171 = fma(_135, (*spvDescriptorSet0.fp_c3)._m0[18].y, _169);
    float _173 = -_161;
    float _175 = fma(_173, (*spvDescriptorSet0.fp_c3)._m0[1].w, 1.0);
    float _177 = fma(_137, (*spvDescriptorSet0.fp_c3)._m0[18].z, _171);
    float _179 = fma(_139, (*spvDescriptorSet0.fp_c3)._m0[18].z, _177);
    float _181 = fma(_141, (*spvDescriptorSet0.fp_c3)._m0[18].w, _179);
    float _183 = fma(_143, (*spvDescriptorSet0.fp_c3)._m0[18].w, _181);
    float _185 = fma(_145, (*spvDescriptorSet0.fp_c3)._m0[19].x, _183);
    float _187 = (*spvDescriptorSet0.fp_c3)._m0[1].z * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _189 = fma(_147, (*spvDescriptorSet0.fp_c3)._m0[19].x, _185);
    float _191 = fma(_149, (*spvDescriptorSet0.fp_c3)._m0[19].y, _189);
    float _193 = fma(_151, (*spvDescriptorSet0.fp_c3)._m0[19].y, _191);
    float _195 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[19].z, _193);
    float _197 = fma(_155, (*spvDescriptorSet0.fp_c3)._m0[19].z, _195);
    float _199 = fma(_157, (*spvDescriptorSet0.fp_c3)._m0[19].w, _197);
    float _201 = fma(_159, (*spvDescriptorSet0.fp_c3)._m0[19].w, _199);
    float _203 = _201 * (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _205 = _203 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _207 = precise::clamp(_205, 0.0, 1.0);
    float _209 = _207 * _187;
    float _211 = _209 * _175;
    out.m_36.x = _211;
    return out;
}

