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
    float2 _389 = float2(_61, _63);
    float3 _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_389, float2(0.0), isnan(_389))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_389, float2(0.0), isnan(_389))).xyz;
    float _69 = _67.x;
    float _71 = _67.y;
    float _73 = _67.z;
    float _75 = (*spvDescriptorSet0.fp_c5)._m0[0].x * (*spvDescriptorSet0.fp_c5)._m0[0].x;
    float _77 = fma(_75, 0.75, 7.4999996286351233720779418945312e-05);
    float _79 = _75 + 9.9999997473787516355514526367188e-05;
    float _81 = (*spvDescriptorSet0.fp_c5)._m0[1].x * (*spvDescriptorSet0.fp_c5)._m0[1].x;
    float _83 = _75 + (-0.99989998340606689453125);
    float _85 = -_77;
    float _87 = _85 + 1.0;
    float _89 = (*spvDescriptorSet0.fp_c5)._m0[2].x * (*spvDescriptorSet0.fp_c5)._m0[2].x;
    float _91 = fma(_81, 0.75, 7.4999996286351233720779418945312e-05);
    float _93 = _81 + (-0.99989998340606689453125);
    float _95 = _79 * _87;
    float _97 = _81 + 9.9999997473787516355514526367188e-05;
    float _99 = -_91;
    float _101 = _99 + 1.0;
    float _103 = _97 * _101;
    float _105 = _71 * (*spvDescriptorSet0.fp_c4)._m0[1].y;
    float _107 = _71 * (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _109 = _71 * (*spvDescriptorSet0.fp_c4)._m0[3].y;
    float _111 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[1].x, _105);
    float _113 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[2].x, _107);
    float _115 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[3].x, _109);
    float _117 = _89 + 9.9999997473787516355514526367188e-05;
    float _119 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[1].z, _111);
    float _121 = -_73;
    float _123 = fma(_121, (*spvDescriptorSet0.fp_c4)._m0[1].z, _111);
    float _125 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[2].z, _113);
    float _127 = -_73;
    float _129 = fma(_127, (*spvDescriptorSet0.fp_c4)._m0[2].z, _113);
    float _131 = fma(_119, -0.5, 0.5);
    float _133 = fma(_123, -0.5, 0.5);
    float _135 = _131 * _131;
    float _137 = _133 * _133;
    float _139 = fma(_135, _83, 1.0);
    float _141 = fma(_83, _137, 1.0);
    float _143 = _139 * _139;
    float _145 = fma(_125, -0.5, 0.5);
    float _147 = fma(_89, 0.75, 7.4999996286351233720779418945312e-05);
    float _149 = fma(_129, -0.5, 0.5);
    float _151 = _89 + (-0.99989998340606689453125);
    float _153 = _145 * _145;
    float _155 = -_147;
    float _157 = _155 + 1.0;
    float _159 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[3].z, _115);
    float _161 = _149 * _149;
    float _163 = fma(_153, _93, 1.0);
    float _165 = _117 * _157;
    float _167 = fma(_159, -0.5, 0.5);
    float _169 = -_73;
    float _171 = fma(_169, (*spvDescriptorSet0.fp_c4)._m0[3].z, _115);
    float _173 = _141 * _141;
    float _175 = fma(_93, _161, 1.0);
    float _177 = _167 * _167;
    float _179 = fma(_171, -0.5, 0.5);
    float _181 = _163 * _163;
    float _183 = _175 * _175;
    float _185 = fma(_177, _151, 1.0);
    float _187 = 1.0 / _143;
    float _189 = _179 * _179;
    float _191 = _131 + _145;
    float _193 = _185 * _185;
    float _195 = abs(_73);
    float _197 = -_195;
    float _199 = _197 + 1.0;
    float _201 = fma(_151, _189, 1.0);
    float _203 = _133 + _149;
    float _205 = _167 + _191;
    float _207 = 1.0 / _173;
    float _209 = _201 * _201;
    float _211 = _199 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _213 = precise::clamp(_211, 0.0, 1.0);
    float _215 = _179 + _203;
    float _217 = -(*spvDescriptorSet0.fp_c5)._m0[16].x;
    float _219 = _217 + (*spvDescriptorSet0.fp_c5)._m0[17].x;
    float _221 = 1.0 / _181;
    float _223 = _187 * _95;
    float _225 = fma(_223, _219, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _227 = 1.0 / _183;
    float _229 = _207 * _95;
    float _231 = fma(_219, _229, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _233 = 1.0 / _193;
    float _235 = _221 * _103;
    float _237 = 1.0 / _209;
    float _239 = _227 * _103;
    float _241 = -(*spvDescriptorSet0.fp_c5)._m0[16].y;
    float _243 = _241 + (*spvDescriptorSet0.fp_c5)._m0[17].y;
    float _245 = abs(_213);
    float _247 = log2(_245);
    float _249 = fma(_223, _243, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _251 = fma(_243, _229, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _253 = _233 * _165;
    float _255 = -(*spvDescriptorSet0.fp_c5)._m0[16].z;
    float _257 = _255 + (*spvDescriptorSet0.fp_c5)._m0[17].z;
    float _259 = _237 * _165;
    float _261 = fma(_223, _257, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _263 = fma(_257, _229, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _265 = -(*spvDescriptorSet0.fp_c5)._m0[18].x;
    float _267 = _265 + (*spvDescriptorSet0.fp_c5)._m0[19].x;
    float _269 = -(*spvDescriptorSet0.fp_c5)._m0[18].y;
    float _271 = _269 + (*spvDescriptorSet0.fp_c5)._m0[19].y;
    float _273 = -(*spvDescriptorSet0.fp_c5)._m0[18].z;
    float _275 = _273 + (*spvDescriptorSet0.fp_c5)._m0[19].z;
    float _277 = fma(_235, _267, (*spvDescriptorSet0.fp_c5)._m0[18].x);
    float _279 = fma(_235, _271, (*spvDescriptorSet0.fp_c5)._m0[18].y);
    float _281 = fma(_271, _239, (*spvDescriptorSet0.fp_c5)._m0[18].y);
    float _283 = fma(_235, _275, (*spvDescriptorSet0.fp_c5)._m0[18].z);
    float _285 = _247 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _287 = -(*spvDescriptorSet0.fp_c5)._m0[20].x;
    float _289 = _287 + (*spvDescriptorSet0.fp_c5)._m0[21].x;
    float _291 = -(*spvDescriptorSet0.fp_c5)._m0[20].y;
    float _293 = _291 + (*spvDescriptorSet0.fp_c5)._m0[21].y;
    float _295 = -(*spvDescriptorSet0.fp_c5)._m0[20].z;
    float _297 = _295 + (*spvDescriptorSet0.fp_c5)._m0[21].z;
    float _299 = fma(_267, _239, (*spvDescriptorSet0.fp_c5)._m0[18].x);
    float _301 = fma(_275, _239, (*spvDescriptorSet0.fp_c5)._m0[18].z);
    float _303 = exp2(_285);
    float _305 = fma(_253, _289, (*spvDescriptorSet0.fp_c5)._m0[20].x);
    float _307 = fma(_289, _259, (*spvDescriptorSet0.fp_c5)._m0[20].x);
    float _309 = fma(_253, _293, (*spvDescriptorSet0.fp_c5)._m0[20].y);
    float _311 = fma(_253, _297, (*spvDescriptorSet0.fp_c5)._m0[20].z);
    float _313 = fma(_293, _259, (*spvDescriptorSet0.fp_c5)._m0[20].y);
    float _315 = fma(_297, _259, (*spvDescriptorSet0.fp_c5)._m0[20].z);
    float _317 = _225 + _277;
    float _319 = _249 + _279;
    float _321 = _261 + _283;
    float _323 = _231 + _299;
    float _325 = _251 + _281;
    float _327 = _263 + _301;
    float _329 = _305 + _317;
    float _331 = _309 + _319;
    float _333 = _311 + _321;
    float _335 = _307 + _323;
    float _337 = _313 + _325;
    float _339 = _315 + _327;
    float _341 = fma(_303, (*spvDescriptorSet0.fp_c4)._m0[0].x, _329);
    float _343 = fma(_303, (*spvDescriptorSet0.fp_c4)._m0[0].y, _331);
    float _345 = fma(_303, (*spvDescriptorSet0.fp_c4)._m0[0].w, _205);
    float _347 = fma(_303, (*spvDescriptorSet0.fp_c4)._m0[0].w, _215);
    float _349 = fma(_303, (*spvDescriptorSet0.fp_c4)._m0[0].x, _335);
    float _351 = fma(_303, (*spvDescriptorSet0.fp_c4)._m0[0].z, _333);
    float _353 = fma(_303, (*spvDescriptorSet0.fp_c4)._m0[0].y, _337);
    float _355 = fma(_303, (*spvDescriptorSet0.fp_c4)._m0[0].z, _339);
    out.m_36.x = _341;
    out.m_36.y = _343;
    out.m_36.z = _351;
    out.m_36.w = _345;
    out.m_38.x = _349;
    out.m_38.y = _353;
    out.m_38.z = _355;
    out.m_38.w = _347;
    return out;
}

