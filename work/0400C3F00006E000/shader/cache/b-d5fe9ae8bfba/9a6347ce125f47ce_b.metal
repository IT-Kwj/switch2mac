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
    float _39 = in.m_27.x;
    float _41 = in.m_29.x;
    float _43 = in.m_27.y;
    float _45 = in.m_29.y;
    float _47 = _39 * 2.0;
    float _49 = _39 * 3.0;
    float _51 = _43 * 2.0;
    float _53 = _39 * 4.0;
    float _55 = _41 + _47;
    float _57 = _43 * 3.0;
    float _59 = _45 + _51;
    float _61 = _41 + _39;
    float _63 = fma(_47, (*spvDescriptorSet0.fp_c3)._m0[2].x, _55);
    float _65 = fma(_47, (*spvDescriptorSet0.fp_c3)._m0[2].y, _55);
    float _67 = fma(_47, (*spvDescriptorSet0.fp_c3)._m0[2].z, _55);
    float _69 = _41 + _49;
    float _71 = fma(_51, (*spvDescriptorSet0.fp_c3)._m0[2].x, _59);
    float _73 = fma(_51, (*spvDescriptorSet0.fp_c3)._m0[2].y, _59);
    float _75 = fma(_51, (*spvDescriptorSet0.fp_c3)._m0[2].z, _59);
    float _77 = fma(_49, (*spvDescriptorSet0.fp_c3)._m0[2].x, _69);
    float _79 = fma(_49, (*spvDescriptorSet0.fp_c3)._m0[2].y, _69);
    float _81 = fma(_49, (*spvDescriptorSet0.fp_c3)._m0[2].z, _69);
    float _83 = _41 + _53;
    float _85 = _45 + _57;
    float _87 = _45 + _43;
    float _89 = _43 * 4.0;
    float _91 = fma(_53, (*spvDescriptorSet0.fp_c3)._m0[2].x, _83);
    float _93 = fma(_53, (*spvDescriptorSet0.fp_c3)._m0[2].y, _83);
    float _95 = fma(_53, (*spvDescriptorSet0.fp_c3)._m0[2].z, _83);
    float _97 = fma(_39, (*spvDescriptorSet0.fp_c3)._m0[2].x, _61);
    float _99 = fma(_39, (*spvDescriptorSet0.fp_c3)._m0[2].y, _61);
    float _101 = _43 * 5.0;
    float _103 = fma(_57, (*spvDescriptorSet0.fp_c3)._m0[2].x, _85);
    float _105 = fma(_57, (*spvDescriptorSet0.fp_c3)._m0[2].y, _85);
    float _107 = fma(_39, (*spvDescriptorSet0.fp_c3)._m0[2].z, _61);
    float _109 = fma(_57, (*spvDescriptorSet0.fp_c3)._m0[2].z, _85);
    float _111 = fma(_43, (*spvDescriptorSet0.fp_c3)._m0[2].x, _87);
    float _113 = fma(_43, (*spvDescriptorSet0.fp_c3)._m0[2].y, _87);
    float _115 = _39 * 5.0;
    float _117 = _45 + _89;
    float _119 = fma(_43, (*spvDescriptorSet0.fp_c3)._m0[2].z, _87);
    float _121 = _101 + _45;
    float _123 = _115 + _41;
    float _125 = fma(_89, (*spvDescriptorSet0.fp_c3)._m0[2].x, _117);
    float _127 = fma(_89, (*spvDescriptorSet0.fp_c3)._m0[2].y, _117);
    float _129 = fma(_89, (*spvDescriptorSet0.fp_c3)._m0[2].z, _117);
    float2 _402 = float2(_107, _119);
    float _131 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_402, float2(0.0), isnan(_402))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_402, float2(0.0), isnan(_402))).z;
    float2 _414 = float2(_67, _75);
    float _133 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_414, float2(0.0), isnan(_414))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_414, float2(0.0), isnan(_414))).z;
    float2 _422 = float2(_81, _109);
    float _135 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_422, float2(0.0), isnan(_422))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_422, float2(0.0), isnan(_422))).z;
    float _137 = fma(_101, (*spvDescriptorSet0.fp_c3)._m0[2].x, _121);
    float _139 = fma(_101, (*spvDescriptorSet0.fp_c3)._m0[2].y, _121);
    float _141 = fma(_101, (*spvDescriptorSet0.fp_c3)._m0[2].z, _121);
    float _143 = fma(_115, (*spvDescriptorSet0.fp_c3)._m0[2].x, _123);
    float2 _450 = float2(_41, _45);
    float _145 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_450, float2(0.0), isnan(_450))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_450, float2(0.0), isnan(_450))).z;
    float2 _458 = float2(_97, _111);
    float _147 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_458, float2(0.0), isnan(_458))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_458, float2(0.0), isnan(_458))).x;
    float2 _466 = float2(_41, _45);
    float _149 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_466, float2(0.0), isnan(_466))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_466, float2(0.0), isnan(_466))).x;
    float _151 = fma(_115, (*spvDescriptorSet0.fp_c3)._m0[2].y, _123);
    float _153 = fma(_115, (*spvDescriptorSet0.fp_c3)._m0[2].z, _123);
    float2 _484 = float2(_41, _45);
    float _155 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_484, float2(0.0), isnan(_484))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_484, float2(0.0), isnan(_484))).y;
    float2 _492 = float2(_99, _113);
    float _157 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_492, float2(0.0), isnan(_492))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_492, float2(0.0), isnan(_492))).y;
    float2 _500 = float2(_63, _71);
    float _159 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_500, float2(0.0), isnan(_500))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_500, float2(0.0), isnan(_500))).x;
    float2 _508 = float2(_65, _73);
    float _161 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_508, float2(0.0), isnan(_508))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_508, float2(0.0), isnan(_508))).y;
    float2 _516 = float2(_77, _103);
    float _163 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_516, float2(0.0), isnan(_516))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_516, float2(0.0), isnan(_516))).x;
    float2 _524 = float2(_79, _105);
    float _165 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_524, float2(0.0), isnan(_524))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_524, float2(0.0), isnan(_524))).y;
    float2 _532 = float2(_91, _125);
    float _167 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_532, float2(0.0), isnan(_532))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_532, float2(0.0), isnan(_532))).x;
    float2 _540 = float2(_93, _127);
    float _169 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_540, float2(0.0), isnan(_540))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_540, float2(0.0), isnan(_540))).y;
    float2 _548 = float2(_95, _129);
    float _171 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_548, float2(0.0), isnan(_548))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_548, float2(0.0), isnan(_548))).z;
    float2 _556 = float2(_143, _137);
    float _173 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_556, float2(0.0), isnan(_556))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_556, float2(0.0), isnan(_556))).x;
    float2 _564 = float2(_151, _139);
    float _175 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_564, float2(0.0), isnan(_564))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_564, float2(0.0), isnan(_564))).y;
    float2 _572 = float2(_153, _141);
    float _177 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_572, float2(0.0), isnan(_572))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_572, float2(0.0), isnan(_572))).z;
    float _179 = _145 + _131;
    float _181 = _149 + _147;
    float _183 = _179 + _133;
    float _185 = _155 + _157;
    float _187 = _181 + _159;
    float _189 = _183 + _135;
    float _191 = _185 + _161;
    float _193 = _187 + _163;
    float _195 = _191 + _165;
    float _197 = _193 + _167;
    float _199 = _189 + _171;
    float _201 = _195 + _169;
    float _203 = _173 + _197;
    float _205 = _177 + _199;
    float _207 = _175 + _201;
    float _209 = _203 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _211 = _205 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _213 = _207 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    out.m_32.x = _209;
    out.m_32.y = _213;
    out.m_32.z = _211;
    return out;
}

