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
    float _41 = in.m_29.x;
    float _43 = gl_FragCoord.w;
    float _45 = _41 * _43;
    float _47 = in.m_29.y;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = 1.0 / _39;
    float _55 = _53 * _45;
    float _57 = _53 * _51;
    float _59 = -(*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _61 = _55 + _59;
    float _63 = _55 + (*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _65 = -(*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _67 = _55 + _65;
    float _69 = _55 + (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _71 = -(*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _73 = _55 + _71;
    float _75 = _55 + (*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _77 = -(*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _79 = _55 + _77;
    float _81 = _55 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _83 = -(*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _85 = _55 + _83;
    float _87 = _55 + (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _89 = -(*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _91 = _55 + _89;
    float _93 = _55 + (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _95 = -(*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _97 = _55 + _95;
    float _99 = _55 + (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _101 = -(*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _103 = _55 + _101;
    float _105 = _55 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _107 = -(*spvDescriptorSet0.fp_c3)._m0[4].x;
    float _109 = _55 + _107;
    float _111 = _55 + (*spvDescriptorSet0.fp_c3)._m0[4].x;
    float _113 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _115 = _55 + _113;
    float _117 = _55 + (*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _119 = -(*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _121 = _55 + _119;
    float _123 = _55 + (*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _125 = -(*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _127 = _55 + _125;
    float _129 = _55 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float2 _386 = float2(_55, _57);
    float _131 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_386, float2(0.0), isnan(_386))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_386, float2(0.0), isnan(_386))).x;
    float2 _398 = float2(_61, _57);
    float _133 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_398, float2(0.0), isnan(_398))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_398, float2(0.0), isnan(_398))).x;
    float2 _406 = float2(_63, _57);
    float _135 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_406, float2(0.0), isnan(_406))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_406, float2(0.0), isnan(_406))).x;
    float2 _414 = float2(_67, _57);
    float _137 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_414, float2(0.0), isnan(_414))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_414, float2(0.0), isnan(_414))).x;
    float2 _422 = float2(_69, _57);
    float _139 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_422, float2(0.0), isnan(_422))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_422, float2(0.0), isnan(_422))).x;
    float2 _430 = float2(_73, _57);
    float _141 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_430, float2(0.0), isnan(_430))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_430, float2(0.0), isnan(_430))).x;
    float2 _438 = float2(_75, _57);
    float _143 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_438, float2(0.0), isnan(_438))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_438, float2(0.0), isnan(_438))).x;
    float2 _446 = float2(_79, _57);
    float _145 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_446, float2(0.0), isnan(_446))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_446, float2(0.0), isnan(_446))).x;
    float2 _454 = float2(_81, _57);
    float _147 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_454, float2(0.0), isnan(_454))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_454, float2(0.0), isnan(_454))).x;
    float2 _462 = float2(_85, _57);
    float _149 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_462, float2(0.0), isnan(_462))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_462, float2(0.0), isnan(_462))).x;
    float2 _470 = float2(_87, _57);
    float _151 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_470, float2(0.0), isnan(_470))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_470, float2(0.0), isnan(_470))).x;
    float2 _478 = float2(_91, _57);
    float _153 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_478, float2(0.0), isnan(_478))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_478, float2(0.0), isnan(_478))).x;
    float2 _486 = float2(_93, _57);
    float _155 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_486, float2(0.0), isnan(_486))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_486, float2(0.0), isnan(_486))).x;
    float2 _494 = float2(_97, _57);
    float _157 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_494, float2(0.0), isnan(_494))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_494, float2(0.0), isnan(_494))).x;
    float2 _502 = float2(_99, _57);
    float _159 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_502, float2(0.0), isnan(_502))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_502, float2(0.0), isnan(_502))).x;
    float2 _510 = float2(_103, _57);
    float _161 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_510, float2(0.0), isnan(_510))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_510, float2(0.0), isnan(_510))).x;
    float2 _518 = float2(_105, _57);
    float _163 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_518, float2(0.0), isnan(_518))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_518, float2(0.0), isnan(_518))).x;
    float2 _526 = float2(_109, _57);
    float _165 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_526, float2(0.0), isnan(_526))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_526, float2(0.0), isnan(_526))).x;
    float2 _534 = float2(_111, _57);
    float _167 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_534, float2(0.0), isnan(_534))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_534, float2(0.0), isnan(_534))).x;
    float2 _542 = float2(_115, _57);
    float _169 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_542, float2(0.0), isnan(_542))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_542, float2(0.0), isnan(_542))).x;
    float2 _550 = float2(_117, _57);
    float _171 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_550, float2(0.0), isnan(_550))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_550, float2(0.0), isnan(_550))).x;
    float2 _558 = float2(_121, _57);
    float _173 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_558, float2(0.0), isnan(_558))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_558, float2(0.0), isnan(_558))).x;
    float2 _566 = float2(_123, _57);
    float _175 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_566, float2(0.0), isnan(_566))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_566, float2(0.0), isnan(_566))).x;
    float2 _574 = float2(_127, _57);
    float _177 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_574, float2(0.0), isnan(_574))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_574, float2(0.0), isnan(_574))).x;
    float2 _582 = float2(_129, _57);
    float _179 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_582, float2(0.0), isnan(_582))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_582, float2(0.0), isnan(_582))).x;
    float _181 = _131 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _183 = fma(_133, (*spvDescriptorSet0.fp_c3)._m0[18].x, _181);
    float _185 = fma(_135, (*spvDescriptorSet0.fp_c3)._m0[18].x, _183);
    float _187 = fma(_137, (*spvDescriptorSet0.fp_c3)._m0[18].y, _185);
    float _189 = fma(_139, (*spvDescriptorSet0.fp_c3)._m0[18].y, _187);
    float _191 = fma(_141, (*spvDescriptorSet0.fp_c3)._m0[18].z, _189);
    float _193 = fma(_143, (*spvDescriptorSet0.fp_c3)._m0[18].z, _191);
    float _195 = fma(_145, (*spvDescriptorSet0.fp_c3)._m0[18].w, _193);
    float _197 = fma(_147, (*spvDescriptorSet0.fp_c3)._m0[18].w, _195);
    float _199 = fma(_149, (*spvDescriptorSet0.fp_c3)._m0[19].x, _197);
    float _201 = fma(_151, (*spvDescriptorSet0.fp_c3)._m0[19].x, _199);
    float _203 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[19].y, _201);
    float _205 = fma(_155, (*spvDescriptorSet0.fp_c3)._m0[19].y, _203);
    float _207 = fma(_157, (*spvDescriptorSet0.fp_c3)._m0[19].z, _205);
    float _209 = fma(_159, (*spvDescriptorSet0.fp_c3)._m0[19].z, _207);
    float _211 = fma(_161, (*spvDescriptorSet0.fp_c3)._m0[19].w, _209);
    float _213 = fma(_163, (*spvDescriptorSet0.fp_c3)._m0[19].w, _211);
    float _215 = fma(_165, (*spvDescriptorSet0.fp_c3)._m0[20].x, _213);
    float _217 = fma(_167, (*spvDescriptorSet0.fp_c3)._m0[20].x, _215);
    float _219 = fma(_169, (*spvDescriptorSet0.fp_c3)._m0[20].y, _217);
    float _221 = fma(_171, (*spvDescriptorSet0.fp_c3)._m0[20].y, _219);
    float _223 = fma(_173, (*spvDescriptorSet0.fp_c3)._m0[20].z, _221);
    float _225 = fma(_175, (*spvDescriptorSet0.fp_c3)._m0[20].z, _223);
    float _227 = fma(_177, (*spvDescriptorSet0.fp_c3)._m0[20].w, _225);
    float _229 = fma(_179, (*spvDescriptorSet0.fp_c3)._m0[20].w, _227);
    out.m_32.x = _229;
    return out;
}

