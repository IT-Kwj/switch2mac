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
    constant _16* fp_c9 [[id(0)]];
    constant _16* fp_c15 [[id(1)]];
    constant _16* fp_c8 [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    sampler fp_t_tcb_8Smplr_w [[id(5)]];
    constant dm_border_t* dm_border [[id(6)]];
};

struct main0_out
{
    float4 m_44 [[color(0)]];
};

struct main0_in
{
    float4 m_35 [[user(locn0)]];
    float4 m_39 [[user(locn1)]];
    float4 m_33 [[user(locn2)]];
    float4 m_48 [[user(locn3)]];
    float4 m_41 [[user(locn4)]];
    float4 m_37 [[user(locn5)]];
    float4 m_46 [[user(locn7)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _55 = gl_FragCoord.w;
    float _57 = in.m_33.x;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = in.m_33.y;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = 1.0 / _55;
    float _71 = _69 * _61;
    float _73 = _69 * _67;
    float2 _402;
    _402.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_71, _73));
    _402.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_71, _73));
    float _75 = _402.x;
    float _77 = _75 * 256.0;
    int _80 = int(_77);
    float _82 = float(uint(_80));
    float _84 = _82 * 0.00390625;
    float _86 = precise::min(_84, 2.0);
    float2 _422 = float2(_71, _73);
    float4 _89 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_422, float2(0.0), isnan(_422)), level(_86)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_422, float2(0.0), isnan(_422)), level(_86)).xyzw;
    float _91 = _89.x;
    float _93 = _89.y;
    float _95 = _89.z;
    float _97 = _89.w;
    float _99 = in.m_35.w;
    float _101 = gl_FragCoord.w;
    float _103 = _99 * _101;
    float _105 = in.m_37.w;
    float _107 = gl_FragCoord.w;
    float _109 = _105 * _107;
    float _111 = in.m_39.w;
    float _113 = gl_FragCoord.w;
    float _115 = _111 * _113;
    float _117 = in.m_41.x;
    float _119 = gl_FragCoord.w;
    float _121 = _117 * _119;
    float _123 = _69 * _103;
    float _125 = _69 * _109;
    float _127 = _69 * _115;
    float _129 = in.m_35.x;
    float _131 = gl_FragCoord.w;
    float _133 = _129 * _131;
    float _135 = in.m_35.y;
    float _137 = gl_FragCoord.w;
    float _139 = _135 * _137;
    float _141 = in.m_35.z;
    float _143 = gl_FragCoord.w;
    float _145 = _141 * _143;
    float _147 = in.m_39.z;
    float _149 = gl_FragCoord.w;
    float _151 = _147 * _149;
    float _153 = in.m_37.x;
    float _155 = gl_FragCoord.w;
    float _157 = _153 * _155;
    float _159 = in.m_37.y;
    float _161 = gl_FragCoord.w;
    float _163 = _159 * _161;
    float _165 = in.m_37.z;
    float _167 = gl_FragCoord.w;
    float _169 = _165 * _167;
    float _171 = _69 * _133;
    float _173 = _69 * _139;
    float _175 = _69 * _145;
    float _177 = _69 * _151;
    float _179 = -_177;
    float _181 = _175 + _179;
    float _183 = -_123;
    float _185 = fma(_97, _125, _183);
    float _187 = _69 * _121;
    float _189 = _127 * _185;
    float _191 = 0.0 + _189;
    float _193 = precise::clamp(_191, 0.0, 1.0);
    float _195 = _193 * _187;
    bool _199 = _195 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _201 = isnan(_195);
    bool _203 = _199 || _201;
    bool _205 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _207 = _203 || _205;
    float _209 = in.m_39.x;
    float _211 = gl_FragCoord.w;
    float _213 = _209 * _211;
    float _215 = in.m_39.y;
    float _217 = gl_FragCoord.w;
    float _219 = _215 * _217;
    if (!_207)
    {
        discard_fragment();
    }
    float _221 = _91 * _91;
    float _223 = _93 * _93;
    float _225 = _95 * _95;
    float _227 = fma(_225, _181, _177);
    float _229 = _69 * _213;
    float _231 = _69 * _219;
    float _233 = -_229;
    float _235 = _171 + _233;
    float _237 = -_231;
    float _239 = _173 + _237;
    float _241 = fma(_221, _235, _229);
    float _243 = fma(_223, _239, _231);
    float _245 = _69 * _157;
    float _247 = _69 * _163;
    float _249 = _69 * _169;
    float _251 = _241 * _245;
    float _253 = _243 * _247;
    float _255 = _227 * _249;
    if (!_207)
    {
        out.m_44.x = _251;
        out.m_44.y = _253;
        out.m_44.z = _255;
        out.m_44.w = _189;
        return out;
    }
    float _257 = _253 * 0.715200006961822509765625;
    float _259 = in.m_46.w;
    float _261 = gl_FragCoord.w;
    float _263 = _259 * _261;
    float _265 = in.m_46.z;
    float _267 = gl_FragCoord.w;
    float _269 = _265 * _267;
    float _271 = in.m_46.x;
    float _273 = gl_FragCoord.w;
    float _275 = _271 * _273;
    float _277 = fma(_251, 0.2125999927520751953125, _257);
    float _279 = in.m_46.y;
    float _281 = gl_FragCoord.w;
    float _283 = _279 * _281;
    float _285 = fma(_255, 0.072200000286102294921875, _277);
    bool _287 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _289 = 1.0 / _285;
    float _291 = _289 * (*spvDescriptorSet0.fp_c15)._m0[661].z;
    float _293 = precise::clamp(_291, 0.0, 1.0);
    float _295 = fma(_293, (*spvDescriptorSet0.fp_c15)._m0[661].y, (*spvDescriptorSet0.fp_c15)._m0[661].x);
    float _297 = _69 * _263;
    float _299 = _69 * _269;
    float _301 = _295 * _297;
    float _303 = 0.0 + _195;
    float _305 = precise::clamp(_303, 0.0, 1.0);
    float _307 = _69 * _275;
    float _309 = _69 * _283;
    float _311 = fma(_255, _301, _299);
    float _313 = fma(_251, _301, _307);
    float _315 = fma(_253, _301, _309);
    float _317 = _299;
    if (!_287)
    {
        _317 = _305;
    }
    float _319 = _317;
    bool _321 = !_287;
    float _323 = _319;
    if (!_321)
    {
        float _325 = in.m_48.w;
        float _327 = gl_FragCoord.w;
        float _329 = _325 * _327;
        float _331 = in.m_48.z;
        float _333 = gl_FragCoord.w;
        float _335 = _331 * _333;
        float _337 = _69 * _329;
        float _339 = _69 * _335;
        float _341 = 1.0 / _337;
        float _343 = _339 * _341;
        float _345 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _347 = fma(_343, (*spvDescriptorSet0.fp_c8)._m0[30].w, _345);
        float _349 = 1.0 / _347;
        float _351 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _353 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _355 = fma(_349, _351, _353);
        float _357 = _355 * 8.0;
        float _359 = precise::clamp(_357, 0.0, 1.0);
        float _361 = _305 * _359;
        _323 = _361;
    }
    float _363 = _323;
    float _365 = 0.0 + _363;
    float _367 = precise::clamp(_365, 0.0, 1.0);
    out.m_44.x = _313;
    out.m_44.y = _315;
    out.m_44.z = _311;
    out.m_44.w = _367;
    return out;
}

