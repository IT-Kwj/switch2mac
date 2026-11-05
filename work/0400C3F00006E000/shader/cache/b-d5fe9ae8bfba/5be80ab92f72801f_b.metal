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
    constant _16* fp_c5 [[id(0)]];
    constant _16* fp_c4 [[id(1)]];
    constant _16* fp_c3 [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    sampler fp_t_tcb_8Smplr_w [[id(5)]];
    constant dm_border_t* dm_border [[id(6)]];
};

struct main0_out
{
    float4 m_36 [[color(0)]];
};

struct main0_in
{
    float4 m_33 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _43 = gl_FragCoord.w;
    float _45 = in.m_33.x;
    float _47 = gl_FragCoord.w;
    float _49 = _45 * _47;
    float _51 = in.m_33.y;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = 1.0 / _43;
    float _59 = _57 * _49;
    float _61 = _57 * _55;
    float2 _331 = float2(_59, _61);
    float3 _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_331, float2(0.0), isnan(_331))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_331, float2(0.0), isnan(_331))).xyz;
    float _67 = _65.x;
    float _69 = _65.y;
    float _71 = _65.z;
    float _73 = (*spvDescriptorSet0.fp_c5)._m0[0].x * (*spvDescriptorSet0.fp_c5)._m0[0].x;
    float _75 = (*spvDescriptorSet0.fp_c5)._m0[1].x * (*spvDescriptorSet0.fp_c5)._m0[1].x;
    float _77 = -(*spvDescriptorSet0.fp_c5)._m0[18].z;
    float _79 = _77 + (*spvDescriptorSet0.fp_c5)._m0[19].z;
    float _81 = _69 * (*spvDescriptorSet0.fp_c4)._m0[1].y;
    float _83 = _69 * (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _85 = _69 * (*spvDescriptorSet0.fp_c4)._m0[3].y;
    float _87 = fma(_67, (*spvDescriptorSet0.fp_c4)._m0[1].x, _81);
    float _89 = fma(_67, (*spvDescriptorSet0.fp_c4)._m0[2].x, _83);
    float _91 = fma(_67, (*spvDescriptorSet0.fp_c4)._m0[3].x, _85);
    float _93 = fma(_71, (*spvDescriptorSet0.fp_c4)._m0[1].z, _87);
    float _95 = fma(_71, (*spvDescriptorSet0.fp_c4)._m0[2].z, _89);
    float _97 = fma(_71, (*spvDescriptorSet0.fp_c4)._m0[3].z, _91);
    float _99 = abs(_71);
    float _101 = -_99;
    float _103 = _101 + 1.0;
    float _105 = fma(_93, -0.5, 0.5);
    float _107 = _73 + (-0.99989998340606689453125);
    float _109 = fma(_95, -0.5, 0.5);
    float _111 = fma(_97, -0.5, 0.5);
    float _113 = _105 * _105;
    float _115 = _103 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _117 = precise::clamp(_115, 0.0, 1.0);
    float _119 = _109 * _109;
    float _121 = fma(_113, _107, 1.0);
    float _123 = _75 + (-0.99989998340606689453125);
    float _125 = abs(_117);
    float _127 = log2(_125);
    float _129 = _121 * _121;
    float _131 = (*spvDescriptorSet0.fp_c5)._m0[2].x * (*spvDescriptorSet0.fp_c5)._m0[2].x;
    float _133 = fma(_119, _123, 1.0);
    float _135 = _111 * _111;
    float _137 = _131 + (-0.99989998340606689453125);
    float _139 = _133 * _133;
    float _141 = 1.0 / _129;
    float _143 = _75 + 9.9999997473787516355514526367188e-05;
    float _145 = fma(_135, _137, 1.0);
    float _147 = fma(_75, 0.75, 7.4999996286351233720779418945312e-05);
    float _149 = _145 * _145;
    float _151 = 0.0 + _105;
    float _153 = precise::clamp(_151, 0.0, 1.0);
    float _155 = 1.0 / _139;
    float _157 = _73 + 9.9999997473787516355514526367188e-05;
    float _159 = _153 + _109;
    float _161 = precise::clamp(_159, 0.0, 1.0);
    float _163 = -_147;
    float _165 = _163 + 1.0;
    float _167 = _111 + _161;
    float _169 = precise::clamp(_167, 0.0, 1.0);
    float _171 = 1.0 / _149;
    float _173 = _157 * _141;
    float _175 = fma(_73, 0.75, 7.4999996286351233720779418945312e-05);
    float _177 = fma(_131, 0.75, 7.4999996286351233720779418945312e-05);
    float _179 = _131 + 9.9999997473787516355514526367188e-05;
    float _181 = -_175;
    float _183 = _181 + 1.0;
    float _185 = -_177;
    float _187 = _185 + 1.0;
    float _189 = _143 * _155;
    float _191 = _173 * _183;
    float _193 = _189 * _165;
    float _195 = -(*spvDescriptorSet0.fp_c5)._m0[18].x;
    float _197 = _195 + (*spvDescriptorSet0.fp_c5)._m0[19].x;
    float _199 = -(*spvDescriptorSet0.fp_c5)._m0[18].y;
    float _201 = _199 + (*spvDescriptorSet0.fp_c5)._m0[19].y;
    float _203 = _179 * _171;
    float _205 = -(*spvDescriptorSet0.fp_c5)._m0[16].y;
    float _207 = _205 + (*spvDescriptorSet0.fp_c5)._m0[17].y;
    float _209 = -(*spvDescriptorSet0.fp_c5)._m0[16].z;
    float _211 = _209 + (*spvDescriptorSet0.fp_c5)._m0[17].z;
    float _213 = _203 * _187;
    float _215 = _127 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _217 = -(*spvDescriptorSet0.fp_c5)._m0[16].x;
    float _219 = _217 + (*spvDescriptorSet0.fp_c5)._m0[17].x;
    float _221 = fma(_191, _207, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _223 = precise::clamp(_221, 0.0, 1.0);
    float _225 = fma(_191, _211, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _227 = precise::clamp(_225, 0.0, 1.0);
    float _229 = fma(_193, _201, (*spvDescriptorSet0.fp_c5)._m0[18].y);
    float _231 = fma(_191, _219, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _233 = precise::clamp(_231, 0.0, 1.0);
    float _235 = exp2(_215);
    float _237 = -(*spvDescriptorSet0.fp_c5)._m0[20].x;
    float _239 = _237 + (*spvDescriptorSet0.fp_c5)._m0[21].x;
    float _241 = -(*spvDescriptorSet0.fp_c5)._m0[20].y;
    float _243 = _241 + (*spvDescriptorSet0.fp_c5)._m0[21].y;
    float _245 = -(*spvDescriptorSet0.fp_c5)._m0[20].z;
    float _247 = _245 + (*spvDescriptorSet0.fp_c5)._m0[21].z;
    float _249 = fma(_193, _197, (*spvDescriptorSet0.fp_c5)._m0[18].x);
    float _251 = fma(_193, _79, (*spvDescriptorSet0.fp_c5)._m0[18].z);
    float _253 = fma(_213, _239, (*spvDescriptorSet0.fp_c5)._m0[20].x);
    float _255 = fma(_213, _243, (*spvDescriptorSet0.fp_c5)._m0[20].y);
    float _257 = fma(_213, _247, (*spvDescriptorSet0.fp_c5)._m0[20].z);
    float _259 = _233 + _249;
    float _261 = precise::clamp(_259, 0.0, 1.0);
    float _263 = _223 + _229;
    float _265 = precise::clamp(_263, 0.0, 1.0);
    float _267 = _227 + _251;
    float _269 = precise::clamp(_267, 0.0, 1.0);
    float _271 = _253 + _261;
    float _273 = precise::clamp(_271, 0.0, 1.0);
    float _275 = _255 + _265;
    float _277 = precise::clamp(_275, 0.0, 1.0);
    float _279 = _257 + _269;
    float _281 = precise::clamp(_279, 0.0, 1.0);
    float _283 = fma(_235, (*spvDescriptorSet0.fp_c4)._m0[0].w, _169);
    float _285 = precise::clamp(_283, 0.0, 1.0);
    float _287 = fma(_235, (*spvDescriptorSet0.fp_c4)._m0[0].x, _273);
    float _289 = precise::clamp(_287, 0.0, 1.0);
    float _291 = fma(_235, (*spvDescriptorSet0.fp_c4)._m0[0].y, _277);
    float _293 = precise::clamp(_291, 0.0, 1.0);
    float _295 = fma(_235, (*spvDescriptorSet0.fp_c4)._m0[0].z, _281);
    float _297 = precise::clamp(_295, 0.0, 1.0);
    out.m_36.x = _289;
    out.m_36.y = _293;
    out.m_36.z = _297;
    out.m_36.w = _285;
    return out;
}

