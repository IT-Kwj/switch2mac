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
    sampler fp_t_tcb_10Smplr_w [[id(5)]];
    constant dm_border_t* dm_border [[id(6)]];
};

struct main0_out
{
    float4 m_46 [[color(0)]];
};

struct main0_in
{
    float4 m_39 [[user(locn0)]];
    float4 m_35 [[user(locn2)]];
    float4 m_43 [[user(locn3)]];
    float4 m_41 [[user(locn4)]];
    float4 m_33 [[user(locn5)]];
    float4 m_37 [[user(locn6)]];
    float4 m_48 [[user(locn7)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _55 = gl_FragCoord.w;
    float _57 = in.m_33.w;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = in.m_33.x;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = in.m_33.y;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = 1.0 / _55;
    float _77 = _75 * _61;
    float _79 = _75 * _67;
    float _81 = _75 * _73;
    float _83 = 1.0 / _77;
    float _85 = _79 * _83;
    float _87 = _81 * _83;
    float2 _457 = float2(_85, _87);
    float _89 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_457, float2(0.0), isnan(_457))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_457, float2(0.0), isnan(_457))).x;
    float _91 = in.m_35.y;
    float _93 = gl_FragCoord.w;
    float _95 = _91 * _93;
    float _97 = in.m_35.x;
    float _99 = gl_FragCoord.w;
    float _101 = _97 * _99;
    float _103 = in.m_35.z;
    float _105 = gl_FragCoord.w;
    float _107 = _103 * _105;
    float _109 = in.m_37.y;
    float _111 = gl_FragCoord.w;
    float _113 = _109 * _111;
    float _115 = in.m_37.x;
    float _117 = gl_FragCoord.w;
    float _119 = _115 * _117;
    float _121 = in.m_37.z;
    float _123 = gl_FragCoord.w;
    float _125 = _121 * _123;
    float _127 = in.m_33.z;
    float _129 = gl_FragCoord.w;
    float _131 = _127 * _129;
    float _133 = in.m_39.w;
    float _135 = gl_FragCoord.w;
    float _137 = _133 * _135;
    float _139 = in.m_41.w;
    float _141 = gl_FragCoord.w;
    float _143 = _139 * _141;
    float _145 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _147 = _75 * _95;
    float _149 = _75 * _101;
    float _151 = _75 * _107;
    float _153 = _147 * _147;
    float _155 = fma(_149, _149, _153);
    float _157 = fma(_151, _151, _155);
    float _159 = _75 * _113;
    float _161 = rsqrt(_157);
    float _163 = -(*spvDescriptorSet0.fp_c9)._m0[139].z;
    float _165 = _163 + (*spvDescriptorSet0.fp_c9)._m0[139].w;
    float _167 = 1.0 / _165;
    float _169 = _147 * _161;
    float _171 = _75 * _119;
    float _173 = _151 * _161;
    float _175 = _159 * _169;
    float _177 = _149 * _161;
    float _179 = _75 * _125;
    float _181 = fma(_171, _177, _175);
    float _183 = _75 * _137;
    float _185 = fma(_179, _173, _181);
    float _187 = _75 * _131;
    float _189 = abs(_185);
    float _191 = -(*spvDescriptorSet0.fp_c9)._m0[139].z;
    float _193 = _189 + _191;
    float _195 = _187 * _83;
    float _197 = _75 * _143;
    float _199 = _193 * _167;
    float _201 = precise::clamp(_199, 0.0, 1.0);
    float _203 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _205 = fma(_195, (*spvDescriptorSet0.fp_c8)._m0[30].w, _203);
    float _207 = _183 * _197;
    float _209 = fma(_201, -2.0, 3.0);
    float _211 = _201 * _201;
    float _213 = 1.0 / _205;
    float _215 = _209 * _211;
    float _217 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _219 = _213 * _217;
    float _221 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _223 = fma(_89, (*spvDescriptorSet0.fp_c8)._m0[30].w, _221);
    float _225 = in.m_43.x;
    float _227 = gl_FragCoord.w;
    float _229 = _225 * _227;
    float _231 = 1.0 / _223;
    float _233 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _235 = -_219;
    float _237 = fma(_231, _233, _235);
    float _239 = _237 * _145;
    float _241 = precise::clamp(_239, 0.0, 1.0);
    float _243 = 0.0 + _207;
    float _245 = precise::clamp(_243, 0.0, 1.0);
    float _247 = _245 * _241;
    float _249 = _247 * _215;
    float _251 = _75 * _229;
    float _253 = _249 * _251;
    bool _257 = _253 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _259 = isnan(_253);
    bool _261 = _257 || _259;
    bool _263 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _265 = _261 || _263;
    float _267 = in.m_41.x;
    float _269 = gl_FragCoord.w;
    float _271 = _267 * _269;
    float _273 = _219;
    float _275 = _253;
    if (!_265)
    {
        discard_fragment();
    }
    float _277 = in.m_39.x;
    float _279 = gl_FragCoord.w;
    float _281 = _277 * _279;
    float _283 = in.m_41.y;
    float _285 = gl_FragCoord.w;
    float _287 = _283 * _285;
    float _289 = _75 * _271;
    float _291 = in.m_39.y;
    float _293 = gl_FragCoord.w;
    float _295 = _291 * _293;
    float _297 = _75 * _281;
    float _299 = _297 * _289;
    float _301 = _75 * _295;
    float _303 = _75 * _287;
    float _305 = in.m_41.z;
    float _307 = gl_FragCoord.w;
    float _309 = _305 * _307;
    float _311 = _301 * _303;
    float _313 = in.m_39.z;
    float _315 = gl_FragCoord.w;
    float _317 = _313 * _315;
    float _319 = _75 * _309;
    float _321 = _75 * _317;
    float _323 = _321 * _319;
    if (!_265)
    {
        out.m_46.x = _299;
        out.m_46.y = _311;
        out.m_46.z = _323;
        out.m_46.w = _207;
        return out;
    }
    float _325 = _311 * 0.715200006961822509765625;
    float _327 = in.m_48.w;
    float _329 = gl_FragCoord.w;
    float _331 = _327 * _329;
    float _333 = in.m_48.x;
    float _335 = gl_FragCoord.w;
    float _337 = _333 * _335;
    float _339 = in.m_48.y;
    float _341 = gl_FragCoord.w;
    float _343 = _339 * _341;
    float _345 = fma(_299, 0.2125999927520751953125, _325);
    float _347 = in.m_48.z;
    float _349 = gl_FragCoord.w;
    float _351 = _347 * _349;
    float _353 = fma(_323, 0.072200000286102294921875, _345);
    bool _355 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _357 = 1.0 / _353;
    if (_355)
    {
        float _359 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _361 = _219 + _359;
        _273 = _361;
    }
    float _363 = _273;
    float _365 = _357 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _367 = precise::clamp(_365, 0.0, 1.0);
    float _369 = fma(_367, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _371 = _75 * _331;
    float _373 = _75 * _337;
    float _375 = _369 * _371;
    float _377 = 0.0 + _253;
    float _379 = precise::clamp(_377, 0.0, 1.0);
    float _381 = _379;
    if (_355)
    {
        float _383 = _363 * 8.0;
        float _385 = precise::clamp(_383, 0.0, 1.0);
        _275 = _385;
    }
    float _387 = _275;
    float _389 = _75 * _343;
    float _391 = _75 * _351;
    float _393 = fma(_299, _375, _373);
    if (_355)
    {
        float _395 = _379 * _387;
        _381 = _395;
    }
    float _397 = _381;
    float _399 = fma(_311, _375, _389);
    float _401 = fma(_323, _375, _391);
    float _403 = 0.0 + _397;
    float _405 = precise::clamp(_403, 0.0, 1.0);
    out.m_46.x = _393;
    out.m_46.y = _399;
    out.m_46.z = _401;
    out.m_46.w = _405;
    return out;
}

