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
    float2 _281 = float2(_57, _59);
    float _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_281, float2(0.0), isnan(_281))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_281, float2(0.0), isnan(_281))).x;
    float _67 = _57 + (*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _69 = -(*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _71 = _57 + _69;
    float _73 = _57 + (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _75 = -(*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _77 = _57 + _75;
    float2 _313 = float2(_63, _59);
    float _79 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_313, float2(0.0), isnan(_313))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_313, float2(0.0), isnan(_313))).x;
    float _81 = _57 + (*spvDescriptorSet0.fp_c3)._m0[2].z;
    float2 _325 = float2(_67, _59);
    float _83 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_325, float2(0.0), isnan(_325))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_325, float2(0.0), isnan(_325))).x;
    float2 _333 = float2(_71, _59);
    float _85 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_333, float2(0.0), isnan(_333))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_333, float2(0.0), isnan(_333))).x;
    float2 _341 = float2(_73, _59);
    float _87 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_341, float2(0.0), isnan(_341))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_341, float2(0.0), isnan(_341))).x;
    float2 _349 = float2(_77, _59);
    float _89 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_349, float2(0.0), isnan(_349))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_349, float2(0.0), isnan(_349))).x;
    float _91 = -(*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _93 = _57 + _91;
    float2 _363 = float2(_81, _59);
    float _95 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_363, float2(0.0), isnan(_363))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_363, float2(0.0), isnan(_363))).x;
    float _97 = _57 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _99 = -(*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _101 = _57 + _99;
    float _103 = _57 + (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _105 = -(*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _107 = _57 + _105;
    float2 _391 = float2(_93, _59);
    float _109 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_391, float2(0.0), isnan(_391))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_391, float2(0.0), isnan(_391))).x;
    float _111 = _57 + (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float2 _403 = float2(_97, _59);
    float _113 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_403, float2(0.0), isnan(_403))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_403, float2(0.0), isnan(_403))).x;
    float2 _411 = float2(_101, _59);
    float _115 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_411, float2(0.0), isnan(_411))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_411, float2(0.0), isnan(_411))).x;
    float2 _419 = float2(_103, _59);
    float _117 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_419, float2(0.0), isnan(_419))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_419, float2(0.0), isnan(_419))).x;
    float2 _427 = float2(_107, _59);
    float _119 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_427, float2(0.0), isnan(_427))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_427, float2(0.0), isnan(_427))).x;
    float _121 = -(*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _123 = _57 + _121;
    float2 _441 = float2(_111, _59);
    float _125 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_441, float2(0.0), isnan(_441))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_441, float2(0.0), isnan(_441))).x;
    float _127 = _57 + (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _129 = -(*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _131 = _57 + _129;
    float _133 = _57 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _135 = -(*spvDescriptorSet0.fp_c3)._m0[4].x;
    float _137 = _57 + _135;
    float2 _470 = float2(_123, _59);
    float _139 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_470, float2(0.0), isnan(_470))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_470, float2(0.0), isnan(_470))).x;
    float2 _478 = float2(_127, _59);
    float _141 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_478, float2(0.0), isnan(_478))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_478, float2(0.0), isnan(_478))).x;
    float2 _486 = float2(_131, _59);
    float _143 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_486, float2(0.0), isnan(_486))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_486, float2(0.0), isnan(_486))).x;
    float2 _494 = float2(_133, _59);
    float _145 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_494, float2(0.0), isnan(_494))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_494, float2(0.0), isnan(_494))).x;
    float2 _502 = float2(_137, _59);
    float _147 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_502, float2(0.0), isnan(_502))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_502, float2(0.0), isnan(_502))).x;
    float _149 = _57 + (*spvDescriptorSet0.fp_c3)._m0[4].x;
    float _151 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _153 = _57 + _151;
    float _155 = _57 + (*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _157 = -(*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _159 = _57 + _157;
    float _161 = _57 + (*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _163 = -(*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _165 = _57 + _163;
    float2 _540 = float2(_149, _59);
    float _167 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_540, float2(0.0), isnan(_540))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_540, float2(0.0), isnan(_540))).x;
    float2 _548 = float2(_153, _59);
    float _169 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_548, float2(0.0), isnan(_548))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_548, float2(0.0), isnan(_548))).x;
    float2 _556 = float2(_155, _59);
    float _171 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_556, float2(0.0), isnan(_556))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_556, float2(0.0), isnan(_556))).x;
    float2 _564 = float2(_159, _59);
    float _173 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_564, float2(0.0), isnan(_564))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_564, float2(0.0), isnan(_564))).x;
    float2 _572 = float2(_161, _59);
    float _175 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_572, float2(0.0), isnan(_572))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_572, float2(0.0), isnan(_572))).x;
    float2 _580 = float2(_165, _59);
    float _177 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_580, float2(0.0), isnan(_580))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_580, float2(0.0), isnan(_580))).x;
    float _179 = _57 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float2 _592 = float2(_57, _59);
    float _181 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_592, float2(0.0), isnan(_592))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_592, float2(0.0), isnan(_592))).x;
    float2 _600 = float2(_179, _59);
    float _183 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_600, float2(0.0), isnan(_600))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_600, float2(0.0), isnan(_600))).x;
    float _185 = _65 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _187 = fma(_79, (*spvDescriptorSet0.fp_c3)._m0[18].x, _185);
    float _189 = fma(_83, (*spvDescriptorSet0.fp_c3)._m0[18].x, _187);
    float _191 = fma(_85, (*spvDescriptorSet0.fp_c3)._m0[18].y, _189);
    float _193 = fma(_87, (*spvDescriptorSet0.fp_c3)._m0[18].y, _191);
    float _195 = fma(_89, (*spvDescriptorSet0.fp_c3)._m0[18].z, _193);
    float _197 = fma(_95, (*spvDescriptorSet0.fp_c3)._m0[18].z, _195);
    float _199 = fma(_109, (*spvDescriptorSet0.fp_c3)._m0[18].w, _197);
    float _201 = fma(_113, (*spvDescriptorSet0.fp_c3)._m0[18].w, _199);
    float _203 = fma(_115, (*spvDescriptorSet0.fp_c3)._m0[19].x, _201);
    float _205 = fma(_117, (*spvDescriptorSet0.fp_c3)._m0[19].x, _203);
    float _207 = fma(_119, (*spvDescriptorSet0.fp_c3)._m0[19].y, _205);
    float _209 = fma(_125, (*spvDescriptorSet0.fp_c3)._m0[19].y, _207);
    float _211 = fma(_139, (*spvDescriptorSet0.fp_c3)._m0[19].z, _209);
    float _213 = fma(_141, (*spvDescriptorSet0.fp_c3)._m0[19].z, _211);
    float _215 = fma(_143, (*spvDescriptorSet0.fp_c3)._m0[19].w, _213);
    float _217 = fma(_145, (*spvDescriptorSet0.fp_c3)._m0[19].w, _215);
    float _219 = fma(_147, (*spvDescriptorSet0.fp_c3)._m0[20].x, _217);
    float _221 = fma(_167, (*spvDescriptorSet0.fp_c3)._m0[20].x, _219);
    float _223 = fma(_169, (*spvDescriptorSet0.fp_c3)._m0[20].y, _221);
    float _225 = fma(_171, (*spvDescriptorSet0.fp_c3)._m0[20].y, _223);
    float _227 = fma(_173, (*spvDescriptorSet0.fp_c3)._m0[20].z, _225);
    float _229 = fma(_175, (*spvDescriptorSet0.fp_c3)._m0[20].z, _227);
    float _231 = fma(_177, (*spvDescriptorSet0.fp_c3)._m0[20].w, _229);
    float _233 = -_181;
    float _235 = fma(_233, (*spvDescriptorSet0.fp_c3)._m0[1].w, 1.0);
    float _237 = fma(_183, (*spvDescriptorSet0.fp_c3)._m0[20].w, _231);
    float _239 = _237 * _235;
    out.m_34.x = _239;
    return out;
}

