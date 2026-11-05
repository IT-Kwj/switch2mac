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
    constant _16* fp_c8 [[id(0)]];
    constant _16* fp_c9 [[id(1)]];
    constant _16* fp_c15 [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_10 [[id(5)]];
    sampler fp_t_tcb_10Smplr [[id(6)]];
    sampler fp_t_tcb_8Smplr_w [[id(7)]];
    sampler fp_t_tcb_10Smplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

struct main0_out
{
    float4 m_46 [[color(0)]];
};

struct main0_in
{
    float4 m_39 [[user(locn0)]];
    float4 m_43 [[user(locn1)]];
    float4 m_37 [[user(locn2)]];
    float4 m_41 [[user(locn3)]];
    float4 m_35 [[user(locn4)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _53 = gl_FragCoord.w;
    float _55 = in.m_35.x;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = in.m_35.y;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = 1.0 / _53;
    float _69 = _67 * _59;
    float _71 = _67 * _65;
    float2 _356;
    _356.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_69, _71));
    _356.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_69, _71));
    float _73 = _356.x;
    float _75 = _73 * 256.0;
    int _78 = int(_75);
    float _80 = in.m_37.w;
    float _82 = gl_FragCoord.w;
    float _84 = _80 * _82;
    float _86 = in.m_37.x;
    float _88 = gl_FragCoord.w;
    float _90 = _86 * _88;
    float _92 = in.m_37.y;
    float _94 = gl_FragCoord.w;
    float _96 = _92 * _94;
    float _98 = _67 * _84;
    float _100 = _67 * _90;
    float _102 = _67 * _96;
    float _104 = 1.0 / _98;
    float _106 = _100 * _104;
    float _108 = _102 * _104;
    float2 _404 = float2(_106, _108);
    float _110 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_404, float2(0.0), isnan(_404))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_404, float2(0.0), isnan(_404))).x;
    float _112 = float(uint(_78));
    float _114 = _112 * 0.00390625;
    float _116 = precise::min(_114, 2.0);
    float2 _425 = float2(_69, _71);
    float4 _119 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_425, float2(0.0), isnan(_425)), level(_116)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_425, float2(0.0), isnan(_425)), level(_116)).xyzw;
    float _121 = _119.x;
    float _123 = _119.y;
    float _125 = _119.z;
    float _127 = _119.w;
    float _129 = in.m_37.z;
    float _131 = gl_FragCoord.w;
    float _133 = _129 * _131;
    float _135 = in.m_39.w;
    float _137 = gl_FragCoord.w;
    float _139 = _135 * _137;
    float _141 = in.m_41.x;
    float _143 = gl_FragCoord.w;
    float _145 = _141 * _143;
    float _147 = _67 * _133;
    float _149 = _67 * _139;
    float _151 = _67 * _145;
    float _153 = _147 * _104;
    float _155 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _157 = fma(_153, (*spvDescriptorSet0.fp_c8)._m0[30].w, _155);
    float _159 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _161 = fma(_110, (*spvDescriptorSet0.fp_c8)._m0[30].w, _159);
    float _163 = 1.0 / _157;
    float _165 = 1.0 / _161;
    float _167 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _169 = _163 * _167;
    float _171 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _173 = -_169;
    float _175 = fma(_165, _171, _173);
    float _177 = in.m_39.x;
    float _179 = gl_FragCoord.w;
    float _181 = _177 * _179;
    float _183 = in.m_43.x;
    float _185 = gl_FragCoord.w;
    float _187 = _183 * _185;
    float _189 = in.m_43.y;
    float _191 = gl_FragCoord.w;
    float _193 = _189 * _191;
    float _195 = in.m_43.z;
    float _197 = gl_FragCoord.w;
    float _199 = _195 * _197;
    float _201 = _127 * _149;
    float _203 = abs(_175);
    bool _207 = _203 < (*spvDescriptorSet0.fp_c9)._m0[141].x;
    float _209 = float(_207);
    float _211 = 0.0 + _201;
    float _213 = precise::clamp(_211, 0.0, 1.0);
    float _215 = _213 * _209;
    float _217 = _215 * _151;
    bool _219 = _217 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _221 = isnan(_217);
    bool _223 = _219 || _221;
    bool _225 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _227 = _223 || _225;
    float _229 = in.m_39.y;
    float _231 = gl_FragCoord.w;
    float _233 = _229 * _231;
    float _235 = in.m_39.z;
    float _237 = gl_FragCoord.w;
    float _239 = _235 * _237;
    float _241 = _169;
    float _243 = _125;
    if (!_227)
    {
        discard_fragment();
    }
    float _245 = _67 * _181;
    float _247 = _67 * _193;
    float _249 = _67 * _233;
    float _251 = _67 * _239;
    float _253 = _67 * _187;
    float _255 = _67 * _199;
    float _257 = -_247;
    float _259 = _249 + _257;
    float _261 = -_253;
    float _263 = _245 + _261;
    float _265 = -_255;
    float _267 = _251 + _265;
    float _269 = fma(_123, _259, _247);
    float _271 = fma(_121, _263, _253);
    float _273 = fma(_125, _267, _255);
    if (!_227)
    {
        out.m_46.x = _271;
        out.m_46.y = _269;
        out.m_46.z = _273;
        out.m_46.w = _201;
        return out;
    }
    float _275 = _269 * 0.715200006961822509765625;
    float _277 = fma(_271, 0.2125999927520751953125, _275);
    float _279 = fma(_273, 0.072200000286102294921875, _277);
    bool _281 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _283 = 1.0 / _279;
    float _285 = 0.0 + _217;
    float _287 = precise::clamp(_285, 0.0, 1.0);
    float _289 = _287;
    if (_281)
    {
        float _291 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _293 = _169 + _291;
        _241 = _293;
    }
    float _295 = _241;
    float _297 = _283 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _299 = precise::clamp(_297, 0.0, 1.0);
    if (_281)
    {
        float _301 = _295 * 8.0;
        float _303 = precise::clamp(_301, 0.0, 1.0);
        _243 = _303;
    }
    float _305 = _243;
    float _307 = fma(_299, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    if (_281)
    {
        float _309 = _287 * _305;
        _289 = _309;
    }
    float _311 = _289;
    float _313 = _271 * _307;
    float _315 = _269 * _307;
    float _317 = _273 * _307;
    float _319 = 0.0 + _311;
    float _321 = precise::clamp(_319, 0.0, 1.0);
    out.m_46.x = _313;
    out.m_46.y = _315;
    out.m_46.z = _317;
    out.m_46.w = _321;
    return out;
}

