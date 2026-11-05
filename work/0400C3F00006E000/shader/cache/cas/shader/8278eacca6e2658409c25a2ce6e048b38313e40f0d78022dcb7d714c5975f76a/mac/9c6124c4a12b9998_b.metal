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
    constant _16* fp_c8 [[id(1)]];
    constant _16* fp_c15 [[id(2)]];
    texture2d<float> fp_t_tcb_10 [[id(3)]];
    sampler fp_t_tcb_10Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    sampler fp_t_tcb_10Smplr_w [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

struct main0_out
{
    float4 m_46 [[color(0)]];
};

struct main0_in
{
    float4 m_43 [[user(locn0)]];
    float4 m_41 [[user(locn1)]];
    float4 m_37 [[user(locn2)]];
    float4 m_35 [[user(locn3)]];
    float4 m_39 [[user(locn4)]];
    float4 m_48 [[user(locn5)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _55 = gl_FragCoord.w;
    float _57 = in.m_35.w;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = in.m_35.x;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = in.m_35.y;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = 1.0 / _55;
    float _77 = _75 * _61;
    float _79 = _75 * _67;
    float _81 = _75 * _73;
    float _83 = 1.0 / _77;
    float _85 = _79 * _83;
    float _87 = _81 * _83;
    float2 _481 = float2(_85, _87);
    float _89 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_481, float2(0.0), isnan(_481))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_481, float2(0.0), isnan(_481))).x;
    float _91 = in.m_35.z;
    float _93 = gl_FragCoord.w;
    float _95 = _91 * _93;
    float _97 = in.m_37.x;
    float _99 = gl_FragCoord.w;
    float _101 = _97 * _99;
    float _103 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _105 = _75 * _95;
    float _107 = _105 * _83;
    float _109 = _75 * _101;
    float _111 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _113 = fma(_107, (*spvDescriptorSet0.fp_c8)._m0[30].w, _111);
    float _115 = 1.0 / _113;
    float _117 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _119 = _115 * _117;
    float _121 = in.m_39.y;
    float _123 = gl_FragCoord.w;
    float _125 = _121 * _123;
    float _127 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _129 = fma(_89, (*spvDescriptorSet0.fp_c8)._m0[30].w, _127);
    float _131 = 1.0 / _129;
    float _133 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _135 = -_119;
    float _137 = fma(_131, _133, _135);
    float _139 = _137 * _103;
    float _141 = precise::clamp(_139, 0.0, 1.0);
    float _143 = _141 * _109;
    bool _147 = _143 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _149 = isnan(_143);
    bool _151 = _147 || _149;
    bool _153 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _155 = _151 || _153;
    float _157 = in.m_39.x;
    float _159 = gl_FragCoord.w;
    float _161 = _157 * _159;
    float _163 = in.m_39.z;
    float _165 = gl_FragCoord.w;
    float _167 = _163 * _165;
    float _169 = _119;
    if (!_155)
    {
        discard_fragment();
    }
    float _171 = _75 * _125;
    float _173 = _171 * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _175 = _171 * (*spvDescriptorSet0.fp_c8)._m0[0].y;
    float _177 = _75 * _161;
    float _179 = _75 * _167;
    float _181 = fma(_177, (*spvDescriptorSet0.fp_c8)._m0[1].x, _173);
    float _183 = _171 * (*spvDescriptorSet0.fp_c8)._m0[2].y;
    float _185 = fma(_177, (*spvDescriptorSet0.fp_c8)._m0[0].x, _175);
    float _187 = fma(_179, (*spvDescriptorSet0.fp_c8)._m0[1].z, _181);
    float _189 = fma(_177, (*spvDescriptorSet0.fp_c8)._m0[2].x, _183);
    float _191 = fma(_179, (*spvDescriptorSet0.fp_c8)._m0[0].z, _185);
    float _193 = _187 * _187;
    float _195 = fma(_179, (*spvDescriptorSet0.fp_c8)._m0[2].z, _189);
    float _197 = fma(_191, _191, _193);
    float _199 = fma(_195, _195, _197);
    float _201 = rsqrt(_199);
    float _203 = _191 * _201;
    float _205 = _187 * _201;
    float _207 = fma(_203, 0.5, 0.5);
    float _209 = fma(_205, -0.5, 0.5);
    float2 _684 = float2(_207, _209);
    float3 _213 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_684, float2(0.0), isnan(_684))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_684, float2(0.0), isnan(_684))).xyz;
    float _215 = _213.x;
    float _217 = _213.y;
    float _219 = _213.z;
    float _221 = _171 * _171;
    float _223 = in.m_41.x;
    float _225 = gl_FragCoord.w;
    float _227 = _223 * _225;
    float _229 = fma(_177, _177, _221);
    float _231 = in.m_41.y;
    float _233 = gl_FragCoord.w;
    float _235 = _231 * _233;
    float _237 = in.m_41.z;
    float _239 = gl_FragCoord.w;
    float _241 = _237 * _239;
    float _243 = fma(_179, _179, _229);
    float _245 = in.m_43.x;
    float _247 = gl_FragCoord.w;
    float _249 = _245 * _247;
    float _251 = (*spvDescriptorSet0.fp_c8)._m0[28].y * (*spvDescriptorSet0.fp_c8)._m0[28].y;
    float _253 = in.m_43.y;
    float _255 = gl_FragCoord.w;
    float _257 = _253 * _255;
    float _259 = in.m_43.z;
    float _261 = gl_FragCoord.w;
    float _263 = _259 * _261;
    float _265 = rsqrt(_243);
    float _267 = fma((*spvDescriptorSet0.fp_c8)._m0[28].x, (*spvDescriptorSet0.fp_c8)._m0[28].x, _251);
    float _269 = fma((*spvDescriptorSet0.fp_c8)._m0[28].z, (*spvDescriptorSet0.fp_c8)._m0[28].z, _267);
    float _271 = rsqrt(_269);
    float _273 = _171 * _265;
    float _275 = _177 * _265;
    float _277 = _179 * _265;
    float _279 = _273 * _273;
    float _281 = fma(_275, _275, _279);
    float _283 = _271 * (*spvDescriptorSet0.fp_c8)._m0[28].y;
    float _285 = fma(_277, _277, _281);
    float _287 = rsqrt(_285);
    float _289 = _273 * _287;
    float _291 = _275 * _287;
    float _293 = _277 * _287;
    float _295 = _75 * _227;
    float _297 = _289 * _283;
    float _299 = _271 * (*spvDescriptorSet0.fp_c8)._m0[28].x;
    float _301 = _271 * (*spvDescriptorSet0.fp_c8)._m0[28].z;
    float _303 = _75 * _241;
    float _305 = fma(_291, _299, _297);
    float _307 = fma(_293, _301, _305);
    float _309 = precise::clamp(_307, 0.0, 1.0);
    float _311 = _75 * _235;
    float _313 = _75 * _249;
    float _315 = _309 * _295;
    float _317 = _309 * _311;
    float _319 = _309 * _303;
    float _321 = -_309;
    float _323 = _321 + 1.0;
    float _325 = _75 * _257;
    float _327 = _75 * _263;
    float _329 = fma(_323, _313, _315);
    float _331 = fma(_323, _325, _317);
    float _333 = fma(_323, _327, _319);
    float _335 = _215 * _215;
    float _337 = _217 * _217;
    float _339 = _219 * _219;
    float _341 = fma(_335, (*spvDescriptorSet0.fp_c9)._m0[194].y, _329);
    float _343 = fma(_337, (*spvDescriptorSet0.fp_c9)._m0[194].z, _331);
    float _345 = fma(_339, (*spvDescriptorSet0.fp_c9)._m0[194].w, _333);
    if (!_155)
    {
        out.m_46.x = _341;
        out.m_46.y = _343;
        out.m_46.z = _345;
        out.m_46.w = 1.0;
        return out;
    }
    float _347 = _343 * 0.715200006961822509765625;
    float _349 = in.m_48.w;
    float _351 = gl_FragCoord.w;
    float _353 = _349 * _351;
    float _355 = in.m_48.x;
    float _357 = gl_FragCoord.w;
    float _359 = _355 * _357;
    float _361 = in.m_48.y;
    float _363 = gl_FragCoord.w;
    float _365 = _361 * _363;
    float _367 = fma(_341, 0.2125999927520751953125, _347);
    float _369 = in.m_48.z;
    float _371 = gl_FragCoord.w;
    float _373 = _369 * _371;
    bool _375 = 0.5 <= (*spvDescriptorSet0.fp_c15)._m0[653].w;
    float _377 = fma(_345, 0.072200000286102294921875, _367);
    float _379 = 1.0 / _377;
    if (_375)
    {
        float _381 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _383 = _119 + _381;
        _169 = _383;
    }
    float _385 = _169;
    float _387 = _379 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _389 = precise::clamp(_387, 0.0, 1.0);
    float _391 = fma(_389, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _393 = _75 * _353;
    float _395 = _353;
    if (_375)
    {
        float _397 = _385 * 8.0;
        float _399 = precise::clamp(_397, 0.0, 1.0);
        _395 = _399;
    }
    float _401 = _395;
    float _403 = _75 * _359;
    float _405 = _391 * _393;
    float _407 = 0.0 + _143;
    float _409 = precise::clamp(_407, 0.0, 1.0);
    float _411 = _75 * _365;
    float _413 = _75 * _373;
    float _415 = fma(_341, _405, _403);
    float _417 = _409;
    if (_375)
    {
        float _419 = _409 * _401;
        _417 = _419;
    }
    float _421 = _417;
    float _423 = fma(_343, _405, _411);
    float _425 = fma(_345, _405, _413);
    float _427 = 0.0 + _421;
    float _429 = precise::clamp(_427, 0.0, 1.0);
    out.m_46.x = _415;
    out.m_46.y = _423;
    out.m_46.z = _425;
    out.m_46.w = _429;
    return out;
}

