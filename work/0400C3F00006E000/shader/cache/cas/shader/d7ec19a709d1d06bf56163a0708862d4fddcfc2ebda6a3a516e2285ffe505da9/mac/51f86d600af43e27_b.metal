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
    float2 _383 = float2(_55, _57);
    float _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_383, float2(0.0), isnan(_383))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_383, float2(0.0), isnan(_383))).x;
    float _65 = _55 + (*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _67 = -(*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _69 = _55 + _67;
    float _71 = _55 + (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _73 = -(*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _75 = _55 + _73;
    float2 _415 = float2(_61, _57);
    float _77 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_415, float2(0.0), isnan(_415))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_415, float2(0.0), isnan(_415))).x;
    float _79 = _55 + (*spvDescriptorSet0.fp_c3)._m0[2].z;
    float2 _427 = float2(_65, _57);
    float _81 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_427, float2(0.0), isnan(_427))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_427, float2(0.0), isnan(_427))).x;
    float2 _435 = float2(_69, _57);
    float _83 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_435, float2(0.0), isnan(_435))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_435, float2(0.0), isnan(_435))).x;
    float2 _443 = float2(_71, _57);
    float _85 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_443, float2(0.0), isnan(_443))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_443, float2(0.0), isnan(_443))).x;
    float2 _451 = float2(_75, _57);
    float _87 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_451, float2(0.0), isnan(_451))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_451, float2(0.0), isnan(_451))).x;
    float _89 = -(*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _91 = _55 + _89;
    float2 _465 = float2(_79, _57);
    float _93 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_465, float2(0.0), isnan(_465))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_465, float2(0.0), isnan(_465))).x;
    float2 _473 = float2(_91, _57);
    float _95 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_473, float2(0.0), isnan(_473))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_473, float2(0.0), isnan(_473))).x;
    float _97 = _55 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _99 = -(*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _101 = _55 + _99;
    float _103 = -(*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _105 = _55 + _103;
    float _107 = -(*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _109 = _55 + _107;
    float _111 = -(*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _113 = _55 + _111;
    float _115 = -(*spvDescriptorSet0.fp_c3)._m0[4].x;
    float _117 = _55 + _115;
    float2 _516 = float2(_97, _57);
    float _119 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_516, float2(0.0), isnan(_516))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_516, float2(0.0), isnan(_516))).x;
    float2 _524 = float2(_101, _57);
    float _121 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_524, float2(0.0), isnan(_524))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_524, float2(0.0), isnan(_524))).x;
    float _123 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _125 = _55 + _123;
    float _127 = -(*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _129 = _55 + _127;
    float _131 = -(*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _133 = _55 + _131;
    float _135 = _55 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _137 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _139 = _55 + _137;
    float _141 = _55 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _143 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _145 = _55 + _143;
    float _147 = _55 + (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _149 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _151 = _55 + _149;
    float _153 = _55 + (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _155 = -(*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _157 = _55 + _155;
    float _159 = _55 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _161 = -(*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _163 = _55 + _161;
    float _165 = _55 + (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _167 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _169 = _55 + _167;
    float _171 = _55 + (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _173 = -(*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _175 = _55 + _173;
    float _177 = _55 + (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _179 = -(*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _181 = _55 + _179;
    float _183 = _63 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _185 = fma(_77, (*spvDescriptorSet0.fp_c3)._m0[18].x, _183);
    float _187 = _55 + (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _189 = fma(_81, (*spvDescriptorSet0.fp_c3)._m0[18].x, _185);
    float _191 = _55 + (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float2 _656 = float2(_187, _57);
    float _193 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_656, float2(0.0), isnan(_656))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_656, float2(0.0), isnan(_656))).x;
    float2 _664 = float2(_105, _57);
    float _195 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_664, float2(0.0), isnan(_664))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_664, float2(0.0), isnan(_664))).x;
    float _197 = fma(_83, (*spvDescriptorSet0.fp_c3)._m0[18].y, _189);
    float _199 = _55 + (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float2 _681 = float2(_191, _57);
    float _201 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_681, float2(0.0), isnan(_681))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_681, float2(0.0), isnan(_681))).x;
    float2 _689 = float2(_109, _57);
    float _203 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_689, float2(0.0), isnan(_689))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_689, float2(0.0), isnan(_689))).x;
    float _205 = fma(_85, (*spvDescriptorSet0.fp_c3)._m0[18].y, _197);
    float _207 = _55 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float2 _706 = float2(_199, _57);
    float _209 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_706, float2(0.0), isnan(_706))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_706, float2(0.0), isnan(_706))).x;
    float2 _714 = float2(_113, _57);
    float _211 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_714, float2(0.0), isnan(_714))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_714, float2(0.0), isnan(_714))).x;
    float _213 = fma(_87, (*spvDescriptorSet0.fp_c3)._m0[18].z, _205);
    float _215 = _55 + (*spvDescriptorSet0.fp_c3)._m0[4].x;
    float2 _731 = float2(_207, _57);
    float _217 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_731, float2(0.0), isnan(_731))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_731, float2(0.0), isnan(_731))).x;
    float2 _739 = float2(_117, _57);
    float _219 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_739, float2(0.0), isnan(_739))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_739, float2(0.0), isnan(_739))).x;
    float _221 = fma(_93, (*spvDescriptorSet0.fp_c3)._m0[18].z, _213);
    float _223 = _55 + (*spvDescriptorSet0.fp_c3)._m0[4].y;
    float2 _756 = float2(_215, _57);
    float _225 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_756, float2(0.0), isnan(_756))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_756, float2(0.0), isnan(_756))).x;
    float2 _764 = float2(_125, _57);
    float _227 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_764, float2(0.0), isnan(_764))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_764, float2(0.0), isnan(_764))).x;
    float _229 = fma(_95, (*spvDescriptorSet0.fp_c3)._m0[18].w, _221);
    float _231 = _55 + (*spvDescriptorSet0.fp_c3)._m0[4].z;
    float2 _781 = float2(_223, _57);
    float _233 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_781, float2(0.0), isnan(_781))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_781, float2(0.0), isnan(_781))).x;
    float2 _789 = float2(_129, _57);
    float _235 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_789, float2(0.0), isnan(_789))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_789, float2(0.0), isnan(_789))).x;
    float _237 = _55 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float2 _801 = float2(_231, _57);
    float _239 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_801, float2(0.0), isnan(_801))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_801, float2(0.0), isnan(_801))).x;
    float2 _809 = float2(_133, _57);
    float _241 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_809, float2(0.0), isnan(_809))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_809, float2(0.0), isnan(_809))).x;
    float2 _817 = float2(_135, _57);
    float _243 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_817, float2(0.0), isnan(_817))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_817, float2(0.0), isnan(_817))).x;
    float2 _825 = float2(_139, _57);
    float _245 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_825, float2(0.0), isnan(_825))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_825, float2(0.0), isnan(_825))).x;
    float2 _833 = float2(_141, _57);
    float _247 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_833, float2(0.0), isnan(_833))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_833, float2(0.0), isnan(_833))).x;
    float2 _841 = float2(_145, _57);
    float _249 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_841, float2(0.0), isnan(_841))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_841, float2(0.0), isnan(_841))).x;
    float2 _849 = float2(_147, _57);
    float _251 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_849, float2(0.0), isnan(_849))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_849, float2(0.0), isnan(_849))).x;
    float2 _857 = float2(_151, _57);
    float _253 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_857, float2(0.0), isnan(_857))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_857, float2(0.0), isnan(_857))).x;
    float2 _865 = float2(_153, _57);
    float _255 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_865, float2(0.0), isnan(_865))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_865, float2(0.0), isnan(_865))).x;
    float2 _873 = float2(_157, _57);
    float _257 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_873, float2(0.0), isnan(_873))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_873, float2(0.0), isnan(_873))).x;
    float2 _881 = float2(_159, _57);
    float _259 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_881, float2(0.0), isnan(_881))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_881, float2(0.0), isnan(_881))).x;
    float2 _889 = float2(_163, _57);
    float _261 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_889, float2(0.0), isnan(_889))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_889, float2(0.0), isnan(_889))).x;
    float2 _897 = float2(_165, _57);
    float _263 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_897, float2(0.0), isnan(_897))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_897, float2(0.0), isnan(_897))).x;
    float2 _905 = float2(_169, _57);
    float _265 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_905, float2(0.0), isnan(_905))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_905, float2(0.0), isnan(_905))).x;
    float2 _913 = float2(_171, _57);
    float _267 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_913, float2(0.0), isnan(_913))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_913, float2(0.0), isnan(_913))).x;
    float2 _921 = float2(_175, _57);
    float _269 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_921, float2(0.0), isnan(_921))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_921, float2(0.0), isnan(_921))).x;
    float2 _929 = float2(_177, _57);
    float _271 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_929, float2(0.0), isnan(_929))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_929, float2(0.0), isnan(_929))).x;
    float2 _937 = float2(_181, _57);
    float _273 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_937, float2(0.0), isnan(_937))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_937, float2(0.0), isnan(_937))).x;
    float2 _945 = float2(_237, _57);
    float _275 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_945, float2(0.0), isnan(_945))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_945, float2(0.0), isnan(_945))).x;
    float _277 = fma(_119, (*spvDescriptorSet0.fp_c3)._m0[18].w, _229);
    float _279 = fma(_121, (*spvDescriptorSet0.fp_c3)._m0[19].x, _277);
    float _281 = fma(_193, (*spvDescriptorSet0.fp_c3)._m0[19].x, _279);
    float _283 = fma(_195, (*spvDescriptorSet0.fp_c3)._m0[19].y, _281);
    float _285 = fma(_201, (*spvDescriptorSet0.fp_c3)._m0[19].y, _283);
    float _287 = fma(_203, (*spvDescriptorSet0.fp_c3)._m0[19].z, _285);
    float _289 = fma(_209, (*spvDescriptorSet0.fp_c3)._m0[19].z, _287);
    float _291 = fma(_211, (*spvDescriptorSet0.fp_c3)._m0[19].w, _289);
    float _293 = fma(_217, (*spvDescriptorSet0.fp_c3)._m0[19].w, _291);
    float _295 = fma(_219, (*spvDescriptorSet0.fp_c3)._m0[20].x, _293);
    float _297 = fma(_225, (*spvDescriptorSet0.fp_c3)._m0[20].x, _295);
    float _299 = fma(_227, (*spvDescriptorSet0.fp_c3)._m0[20].y, _297);
    float _301 = fma(_233, (*spvDescriptorSet0.fp_c3)._m0[20].y, _299);
    float _303 = fma(_235, (*spvDescriptorSet0.fp_c3)._m0[20].z, _301);
    float _305 = fma(_239, (*spvDescriptorSet0.fp_c3)._m0[20].z, _303);
    float _307 = fma(_241, (*spvDescriptorSet0.fp_c3)._m0[20].w, _305);
    float _309 = fma(_243, (*spvDescriptorSet0.fp_c3)._m0[20].w, _307);
    float _311 = fma(_245, (*spvDescriptorSet0.fp_c3)._m0[21].x, _309);
    float _313 = fma(_247, (*spvDescriptorSet0.fp_c3)._m0[21].x, _311);
    float _315 = fma(_249, (*spvDescriptorSet0.fp_c3)._m0[21].y, _313);
    float _317 = fma(_251, (*spvDescriptorSet0.fp_c3)._m0[21].y, _315);
    float _319 = fma(_253, (*spvDescriptorSet0.fp_c3)._m0[21].z, _317);
    float _321 = fma(_255, (*spvDescriptorSet0.fp_c3)._m0[21].z, _319);
    float _323 = fma(_257, (*spvDescriptorSet0.fp_c3)._m0[21].w, _321);
    float _325 = fma(_259, (*spvDescriptorSet0.fp_c3)._m0[21].w, _323);
    float _327 = fma(_261, (*spvDescriptorSet0.fp_c3)._m0[22].x, _325);
    float _329 = fma(_263, (*spvDescriptorSet0.fp_c3)._m0[22].x, _327);
    float _331 = fma(_265, (*spvDescriptorSet0.fp_c3)._m0[22].y, _329);
    float _333 = fma(_267, (*spvDescriptorSet0.fp_c3)._m0[22].y, _331);
    float _335 = fma(_269, (*spvDescriptorSet0.fp_c3)._m0[22].z, _333);
    float _337 = fma(_271, (*spvDescriptorSet0.fp_c3)._m0[22].z, _335);
    float _339 = fma(_273, (*spvDescriptorSet0.fp_c3)._m0[22].w, _337);
    float _341 = fma(_275, (*spvDescriptorSet0.fp_c3)._m0[22].w, _339);
    out.m_32.x = _341;
    return out;
}

