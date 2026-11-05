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
    texture2d_array<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    sampler fp_t_tcb_8Smplr_w [[id(5)]];
    constant dm_border_t* dm_border [[id(6)]];
};

struct main0_out
{
    float4 m_46 [[color(0)]];
};

struct main0_in
{
    float4 m_37 [[user(locn0)]];
    float4 m_41 [[user(locn1)]];
    float4 m_35 [[user(locn2)]];
    float4 m_50 [[user(locn3)]];
    float4 m_43 [[user(locn4)]];
    float4 m_39 [[user(locn5)]];
    float4 m_33 [[user(locn6), flat]];
    float4 m_48 [[user(locn8)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _57 = gl_FragCoord.w;
    float _59 = in.m_33.x;
    float _61 = in.m_35.y;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = in.m_35.x;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = 1.0 / _57;
    float _75 = rint(_59);
    float _77 = precise::max(_75, 0.0);
    uint _80 = uint(_77);
    uint _82 = clamp(_80, 0u, 65535u);
    float _84 = _73 * _65;
    float _86 = _73 * _71;
    float3 _418 = float3(_86, _84, float(int(_82)));
    float3 _422 = select(_418, float3(0.0), isnan(_418));
    float4 _89 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _422.xy, uint(rint(_422.z))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _422.xy, uint(rint(_422.z))).xyzw;
    float _91 = _89.x;
    float _93 = _89.y;
    float _95 = _89.z;
    float _97 = _89.w;
    float _99 = in.m_37.w;
    float _101 = gl_FragCoord.w;
    float _103 = _99 * _101;
    float _105 = in.m_39.w;
    float _107 = gl_FragCoord.w;
    float _109 = _105 * _107;
    float _111 = in.m_41.w;
    float _113 = gl_FragCoord.w;
    float _115 = _111 * _113;
    float _117 = in.m_43.x;
    float _119 = gl_FragCoord.w;
    float _121 = _117 * _119;
    float _123 = _73 * _103;
    float _125 = _73 * _109;
    float _127 = _73 * _115;
    float _129 = in.m_37.z;
    float _131 = gl_FragCoord.w;
    float _133 = _129 * _131;
    float _135 = in.m_41.z;
    float _137 = gl_FragCoord.w;
    float _139 = _135 * _137;
    float _141 = in.m_41.x;
    float _143 = gl_FragCoord.w;
    float _145 = _141 * _143;
    float _147 = in.m_41.y;
    float _149 = gl_FragCoord.w;
    float _151 = _147 * _149;
    float _153 = in.m_39.x;
    float _155 = gl_FragCoord.w;
    float _157 = _153 * _155;
    float _159 = in.m_39.y;
    float _161 = gl_FragCoord.w;
    float _163 = _159 * _161;
    float _165 = in.m_39.z;
    float _167 = gl_FragCoord.w;
    float _169 = _165 * _167;
    float _171 = _73 * _145;
    float _173 = _73 * _151;
    float _175 = -_123;
    float _177 = fma(_97, _125, _175);
    float _179 = _127 * _177;
    float _181 = _73 * _121;
    float _183 = 0.0 + _179;
    float _185 = precise::clamp(_183, 0.0, 1.0);
    float _187 = _185 * _181;
    bool _191 = _187 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _193 = isnan(_187);
    bool _195 = _191 || _193;
    bool _197 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _199 = _195 || _197;
    float _201 = in.m_37.y;
    float _203 = gl_FragCoord.w;
    float _205 = _201 * _203;
    float _207 = in.m_37.x;
    float _209 = gl_FragCoord.w;
    float _211 = _207 * _209;
    if (!_199)
    {
        discard_fragment();
    }
    float _213 = _73 * _133;
    float _215 = _95 * _95;
    float _217 = _91 * _91;
    float _219 = _93 * _93;
    float _221 = _73 * _205;
    float _223 = _73 * _139;
    float _225 = _73 * _211;
    float _227 = -_173;
    float _229 = _221 + _227;
    float _231 = -_223;
    float _233 = _213 + _231;
    float _235 = -_171;
    float _237 = _225 + _235;
    float _239 = fma(_219, _229, _173);
    float _241 = fma(_215, _233, _223);
    float _243 = fma(_217, _237, _171);
    float _245 = _73 * _157;
    float _247 = _73 * _163;
    float _249 = _73 * _169;
    float _251 = _243 * _245;
    float _253 = _239 * _247;
    float _255 = _241 * _249;
    if (!_199)
    {
        out.m_46.x = _251;
        out.m_46.y = _253;
        out.m_46.z = _255;
        out.m_46.w = _179;
        return out;
    }
    float _257 = _253 * 0.715200006961822509765625;
    float _259 = in.m_48.w;
    float _261 = gl_FragCoord.w;
    float _263 = _259 * _261;
    float _265 = in.m_48.z;
    float _267 = gl_FragCoord.w;
    float _269 = _265 * _267;
    float _271 = in.m_48.x;
    float _273 = gl_FragCoord.w;
    float _275 = _271 * _273;
    float _277 = fma(_251, 0.2125999927520751953125, _257);
    float _279 = in.m_48.y;
    float _281 = gl_FragCoord.w;
    float _283 = _279 * _281;
    float _285 = 0.0 + _187;
    float _287 = precise::clamp(_285, 0.0, 1.0);
    float _289 = fma(_255, 0.072200000286102294921875, _277);
    bool _291 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _293 = 1.0 / _289;
    float _295 = _293 * (*spvDescriptorSet0.fp_c15)._m0[661].z;
    float _297 = precise::clamp(_295, 0.0, 1.0);
    float _299 = _73 * _263;
    float _301 = fma(_297, (*spvDescriptorSet0.fp_c15)._m0[661].y, (*spvDescriptorSet0.fp_c15)._m0[661].x);
    float _303 = _73 * _269;
    float _305 = _301 * _299;
    float _307 = _73 * _275;
    float _309 = _73 * _283;
    float _311 = fma(_255, _305, _303);
    float _313 = fma(_251, _305, _307);
    float _315 = fma(_253, _305, _309);
    float _317 = _303;
    if (!_291)
    {
        _317 = _287;
    }
    float _319 = _317;
    bool _321 = !_291;
    float _323 = _319;
    if (!_321)
    {
        float _325 = in.m_50.w;
        float _327 = gl_FragCoord.w;
        float _329 = _325 * _327;
        float _331 = in.m_50.z;
        float _333 = gl_FragCoord.w;
        float _335 = _331 * _333;
        float _337 = _73 * _329;
        float _339 = _73 * _335;
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
        float _361 = _287 * _359;
        _323 = _361;
    }
    float _363 = _323;
    float _365 = 0.0 + _363;
    float _367 = precise::clamp(_365, 0.0, 1.0);
    out.m_46.x = _313;
    out.m_46.y = _315;
    out.m_46.z = _311;
    out.m_46.w = _367;
    return out;
}

