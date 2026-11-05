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
    float4 m_38 [[color(1)]];
};

struct main0_in
{
    float4 m_33 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _45 = gl_FragCoord.w;
    float _47 = in.m_33.x;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = in.m_33.y;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = 1.0 / _45;
    float _61 = _59 * _51;
    float _63 = _59 * _57;
    float2 _353 = float2(_61, _63);
    float3 _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_353, float2(0.0), isnan(_353))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_353, float2(0.0), isnan(_353))).xyz;
    float _69 = _67.x;
    float _71 = _67.y;
    float _73 = _67.z;
    float _75 = (*spvDescriptorSet0.fp_c5)._m0[0].x * (*spvDescriptorSet0.fp_c5)._m0[0].x;
    float _77 = fma(_75, 0.75, 7.4999996286351233720779418945312e-05);
    float _79 = _75 + 9.9999997473787516355514526367188e-05;
    float _81 = -_77;
    float _83 = _81 + 1.0;
    float _85 = _75 + (-0.99989998340606689453125);
    float _87 = _79 * _83;
    float _89 = _71 * (*spvDescriptorSet0.fp_c4)._m0[1].y;
    float _91 = _71 * (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _93 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[1].x, _89);
    float _95 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[2].x, _91);
    float _97 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[1].z, _93);
    float _99 = -_73;
    float _101 = fma(_99, (*spvDescriptorSet0.fp_c4)._m0[1].z, _93);
    float _103 = fma(_97, -0.5, 0.5);
    float _105 = (*spvDescriptorSet0.fp_c5)._m0[1].x * (*spvDescriptorSet0.fp_c5)._m0[1].x;
    float _107 = _103 * _103;
    float _109 = fma(_105, 0.75, 7.4999996286351233720779418945312e-05);
    float _111 = fma(_101, -0.5, 0.5);
    float _113 = _105 + 9.9999997473787516355514526367188e-05;
    float _115 = fma(_107, _85, 1.0);
    float _117 = -_109;
    float _119 = _117 + 1.0;
    float _121 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[2].z, _95);
    float _123 = _111 * _111;
    float _125 = _105 + (-0.99989998340606689453125);
    float _127 = _113 * _119;
    float _129 = -_73;
    float _131 = fma(_129, (*spvDescriptorSet0.fp_c4)._m0[2].z, _95);
    float _133 = fma(_121, -0.5, 0.5);
    float _135 = fma(_85, _123, 1.0);
    float _137 = abs(_73);
    float _139 = -_137;
    float _141 = _139 + 1.0;
    float _143 = fma(_131, -0.5, 0.5);
    float _145 = _133 * _133;
    float _147 = _115 * _115;
    float _149 = _135 * _135;
    float _151 = _143 * _143;
    float _153 = fma(_145, _125, 1.0);
    float _155 = _141 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _157 = precise::clamp(_155, 0.0, 1.0);
    float _159 = 0.0 + _111;
    float _161 = precise::clamp(_159, 0.0, 1.0);
    float _163 = fma(_125, _151, 1.0);
    float _165 = _153 * _153;
    float _167 = 1.0 / _147;
    float _169 = 0.0 + _103;
    float _171 = precise::clamp(_169, 0.0, 1.0);
    float _173 = _163 * _163;
    float _175 = _143 + _161;
    float _177 = precise::clamp(_175, 0.0, 1.0);
    float _179 = _133 + _171;
    float _181 = precise::clamp(_179, 0.0, 1.0);
    float _183 = 1.0 / _149;
    float _185 = -(*spvDescriptorSet0.fp_c5)._m0[16].x;
    float _187 = _185 + (*spvDescriptorSet0.fp_c5)._m0[17].x;
    float _189 = abs(_157);
    float _191 = log2(_189);
    float _193 = _167 * _87;
    float _195 = fma(_193, _187, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _197 = precise::clamp(_195, 0.0, 1.0);
    float _199 = 1.0 / _165;
    float _201 = _183 * _87;
    float _203 = fma(_187, _201, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _205 = precise::clamp(_203, 0.0, 1.0);
    float _207 = 1.0 / _173;
    float _209 = _191 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _211 = -(*spvDescriptorSet0.fp_c5)._m0[18].x;
    float _213 = _211 + (*spvDescriptorSet0.fp_c5)._m0[19].x;
    float _215 = _199 * _127;
    float _217 = exp2(_209);
    float _219 = fma(_215, _213, (*spvDescriptorSet0.fp_c5)._m0[18].x);
    float _221 = -(*spvDescriptorSet0.fp_c5)._m0[16].y;
    float _223 = _221 + (*spvDescriptorSet0.fp_c5)._m0[17].y;
    float _225 = _207 * _127;
    float _227 = fma(_193, _223, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _229 = precise::clamp(_227, 0.0, 1.0);
    float _231 = fma(_223, _201, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _233 = precise::clamp(_231, 0.0, 1.0);
    float _235 = -(*spvDescriptorSet0.fp_c5)._m0[16].z;
    float _237 = _235 + (*spvDescriptorSet0.fp_c5)._m0[17].z;
    float _239 = -(*spvDescriptorSet0.fp_c5)._m0[18].y;
    float _241 = _239 + (*spvDescriptorSet0.fp_c5)._m0[19].y;
    float _243 = fma(_193, _237, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _245 = precise::clamp(_243, 0.0, 1.0);
    float _247 = -(*spvDescriptorSet0.fp_c5)._m0[18].z;
    float _249 = _247 + (*spvDescriptorSet0.fp_c5)._m0[19].z;
    float _251 = fma(_237, _201, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _253 = precise::clamp(_251, 0.0, 1.0);
    float _255 = fma(_215, _241, (*spvDescriptorSet0.fp_c5)._m0[18].y);
    float _257 = fma(_213, _225, (*spvDescriptorSet0.fp_c5)._m0[18].x);
    float _259 = fma(_215, _249, (*spvDescriptorSet0.fp_c5)._m0[18].z);
    float _261 = fma(_241, _225, (*spvDescriptorSet0.fp_c5)._m0[18].y);
    float _263 = fma(_249, _225, (*spvDescriptorSet0.fp_c5)._m0[18].z);
    float _265 = _219 + _197;
    float _267 = precise::clamp(_265, 0.0, 1.0);
    float _269 = _255 + _229;
    float _271 = precise::clamp(_269, 0.0, 1.0);
    float _273 = _257 + _205;
    float _275 = precise::clamp(_273, 0.0, 1.0);
    float _277 = _259 + _245;
    float _279 = precise::clamp(_277, 0.0, 1.0);
    float _281 = _261 + _233;
    float _283 = precise::clamp(_281, 0.0, 1.0);
    float _285 = _263 + _253;
    float _287 = precise::clamp(_285, 0.0, 1.0);
    float _289 = fma(_217, (*spvDescriptorSet0.fp_c4)._m0[0].x, _267);
    float _291 = precise::clamp(_289, 0.0, 1.0);
    float _293 = fma(_217, (*spvDescriptorSet0.fp_c4)._m0[0].y, _271);
    float _295 = precise::clamp(_293, 0.0, 1.0);
    float _297 = fma(_217, (*spvDescriptorSet0.fp_c4)._m0[0].w, _181);
    float _299 = precise::clamp(_297, 0.0, 1.0);
    float _301 = fma(_217, (*spvDescriptorSet0.fp_c4)._m0[0].w, _177);
    float _303 = precise::clamp(_301, 0.0, 1.0);
    float _305 = fma(_217, (*spvDescriptorSet0.fp_c4)._m0[0].x, _275);
    float _307 = precise::clamp(_305, 0.0, 1.0);
    float _309 = fma(_217, (*spvDescriptorSet0.fp_c4)._m0[0].z, _279);
    float _311 = precise::clamp(_309, 0.0, 1.0);
    float _313 = fma(_217, (*spvDescriptorSet0.fp_c4)._m0[0].y, _283);
    float _315 = precise::clamp(_313, 0.0, 1.0);
    float _317 = fma(_217, (*spvDescriptorSet0.fp_c4)._m0[0].z, _287);
    float _319 = precise::clamp(_317, 0.0, 1.0);
    out.m_36.x = _291;
    out.m_36.y = _295;
    out.m_36.z = _311;
    out.m_36.w = _299;
    out.m_38.x = _307;
    out.m_38.y = _315;
    out.m_38.z = _319;
    out.m_38.w = _303;
    return out;
}

