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
    constant _16* fp_c13 [[id(2)]];
    constant _16* fp_c8 [[id(3)]];
    texture2d<float> fp_t_tcb_10 [[id(4)]];
    sampler fp_t_tcb_10Smplr [[id(5)]];
    sampler fp_t_tcb_10Smplr_w [[id(6)]];
    constant dm_border_t* dm_border [[id(7)]];
};

struct main0_out
{
    float4 m_44 [[color(0)]];
};

struct main0_in
{
    float4 m_41 [[user(locn0)]];
    float4 m_37 [[user(locn1)]];
    float4 m_52 [[user(locn2), flat]];
    float4 m_46 [[user(locn3)]];
    float4 m_39 [[user(locn4)]];
    float4 m_50 [[user(locn6), flat]];
    float4 m_48 [[user(locn7)]];
    float4 m_35 [[user(locn8)]];
    float4 m_54 [[user(locn9)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _61 = gl_FragCoord.w;
    float _63 = in.m_35.y;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = in.m_35.x;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_37.w;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_39.x;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = 1.0 / _61;
    float _89 = _87 * _67;
    float _91 = _87 * _73;
    float _93 = in.m_41.w;
    float _95 = gl_FragCoord.w;
    float _97 = _93 * _95;
    float _99 = fma(_89, 2.0, -1.0);
    float _101 = fma(_91, 2.0, -1.0);
    float _103 = _87 * _79;
    float _105 = _87 * _85;
    float _107 = _99 * _99;
    float _109 = fma(_101, _101, _107);
    float _111 = 0.0 + _109;
    float _113 = precise::clamp(_111, 0.0, 1.0);
    float _115 = -_113;
    float _117 = _115 + 1.0;
    float _119 = abs(_117);
    float _121 = log2(_119);
    float _123 = _87 * _97;
    float _125 = _121 * (*spvDescriptorSet0.fp_c9)._m0[194].w;
    float _127 = exp2(_125);
    float _129 = _123 * _127;
    float _131 = _103 * _129;
    float _133 = precise::clamp(_131, 0.0, 1.0);
    float _135 = _133 * _105;
    bool _139 = _135 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _141 = isnan(_135);
    bool _143 = _139 || _141;
    bool _145 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _147 = _143 || _145;
    float _149 = sqrt(_109);
    float _151 = _135;
    if (!_147)
    {
        discard_fragment();
    }
    float _153 = 0.0 + _149;
    float _155 = precise::clamp(_153, 0.0, 1.0);
    float _157 = in.m_37.x;
    float _159 = gl_FragCoord.w;
    float _161 = _157 * _159;
    float _163 = in.m_37.y;
    float _165 = gl_FragCoord.w;
    float _167 = _163 * _165;
    float _169 = in.m_37.z;
    float _171 = gl_FragCoord.w;
    float _173 = _169 * _171;
    float _175 = -_155;
    float _177 = _175 + 1.0;
    float _179 = in.m_41.x;
    float _181 = gl_FragCoord.w;
    float _183 = _179 * _181;
    float _185 = in.m_41.y;
    float _187 = gl_FragCoord.w;
    float _189 = _185 * _187;
    float _191 = in.m_41.z;
    float _193 = gl_FragCoord.w;
    float _195 = _191 * _193;
    float _197 = abs(_177);
    float _199 = log2(_197);
    float _201 = _199 * (*spvDescriptorSet0.fp_c9)._m0[194].z;
    float _203 = exp2(_201);
    float _205 = _87 * _161;
    float _207 = _87 * _167;
    float _209 = _87 * _173;
    float _211 = _87 * _195;
    float _213 = -_203;
    float _215 = _213 + 1.0;
    float _217 = _205 * _215;
    float _219 = _207 * _215;
    float _221 = _209 * _215;
    float _223 = _87 * _183;
    float _225 = _87 * _189;
    float _227 = fma(_203, _223, _217);
    float _229 = fma(_203, _225, _219);
    float _231 = fma(_203, _211, _221);
    if (!_147)
    {
        out.m_44.x = _227;
        out.m_44.y = _229;
        out.m_44.z = _231;
        out.m_44.w = _133;
        return out;
    }
    float _233 = in.m_46.w;
    float _235 = gl_FragCoord.w;
    float _237 = _233 * _235;
    float _239 = in.m_46.x;
    float _241 = gl_FragCoord.w;
    float _243 = _239 * _241;
    float _245 = in.m_46.y;
    float _247 = gl_FragCoord.w;
    float _249 = _245 * _247;
    float _251 = _87 * _237;
    float _253 = _87 * _243;
    float _255 = _87 * _249;
    float _257 = 1.0 / _251;
    float _259 = _253 * _257;
    float _261 = _255 * _257;
    float2 _719 = float2(_259, _261);
    float _263 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_719, float2(0.0), isnan(_719))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_719, float2(0.0), isnan(_719))).x;
    float _265 = in.m_48.y;
    float _267 = gl_FragCoord.w;
    float _269 = _265 * _267;
    float _271 = in.m_48.x;
    float _273 = gl_FragCoord.w;
    float _275 = _271 * _273;
    float _277 = in.m_50.y;
    float _279 = in.m_50.x;
    float _281 = in.m_48.z;
    float _283 = gl_FragCoord.w;
    float _285 = _281 * _283;
    float _287 = in.m_46.z;
    float _289 = gl_FragCoord.w;
    float _291 = _287 * _289;
    float _293 = in.m_50.z;
    float _295 = in.m_52.x;
    float _297 = _229 * 0.715200006961822509765625;
    float _299 = fma(_227, 0.2125999927520751953125, _297);
    float _301 = fma(_231, 0.072200000286102294921875, _299);
    float _303 = 1.0 / _301;
    float _305 = _87 * _269;
    float _307 = _87 * _275;
    float _309 = -_277;
    float _311 = _305 + _309;
    float _313 = -_279;
    float _315 = _307 + _313;
    float _317 = _87 * _285;
    float _319 = _311 * _311;
    float _321 = _87 * _291;
    float _323 = -_293;
    float _325 = _317 + _323;
    float _327 = _303 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _329 = precise::clamp(_327, 0.0, 1.0);
    float _331 = fma(_315, _315, _319);
    float _333 = _321 * _257;
    float _335 = in.m_54.w;
    float _337 = gl_FragCoord.w;
    float _339 = _335 * _337;
    float _341 = fma(_325, _325, _331);
    float _343 = _295 * (*spvDescriptorSet0.fp_c13)._m0[2].y;
    float _345 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _347 = fma(_333, (*spvDescriptorSet0.fp_c8)._m0[30].w, _345);
    float _349 = fma(_329, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _351 = -_341;
    float _353 = fma(_343, _343, _351);
    float _355 = _227 * _349;
    float _357 = 1.0 / _347;
    float _359 = _229 * _349;
    float _361 = precise::max(0.0, _353);
    float _363 = _231 * _349;
    float _365 = sqrt(_361);
    float _367 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _369 = _357 * _367;
    float _371 = _87 * _339;
    float _373 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _375 = fma(_263, (*spvDescriptorSet0.fp_c8)._m0[30].w, _373);
    float _377 = 1.0 / _375;
    float _379 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _381 = -_369;
    float _383 = fma(_377, _379, _381);
    float _385 = _365 + _383;
    float _387 = -_371;
    float _389 = _385 + _387;
    float _391 = _389 * (*spvDescriptorSet0.fp_c13)._m0[2].z;
    float _393 = _391 * (-1.44269502162933349609375);
    bool _395 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _397 = exp2(_393);
    float _399 = _375;
    if (_395)
    {
        float _401 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _403 = _369 + _401;
        _399 = _403;
    }
    float _405 = _399;
    float _407 = -_397;
    float _409 = _407 + 1.0;
    float _411 = precise::clamp(_409, 0.0, 1.0);
    float _413 = _135 * _411;
    float _415 = precise::clamp(_413, 0.0, 1.0);
    float _417 = _415;
    if (_395)
    {
        float _419 = _405 * 8.0;
        float _421 = precise::clamp(_419, 0.0, 1.0);
        _151 = _421;
    }
    float _423 = _151;
    if (_395)
    {
        float _425 = _415 * _423;
        _417 = _425;
    }
    float _427 = _417;
    float _429 = 0.0 + _427;
    float _431 = precise::clamp(_429, 0.0, 1.0);
    out.m_44.x = _355;
    out.m_44.y = _359;
    out.m_44.z = _363;
    out.m_44.w = _431;
    return out;
}

