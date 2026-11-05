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
    uint4 _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float4 _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* fp_c9 [[id(1)]];
    constant _16* fp_c15 [[id(2)]];
    constant _16* fp_c8 [[id(3)]];
    texture2d<float> fp_t_tcb_8 [[id(4)]];
    sampler fp_t_tcb_8Smplr [[id(5)]];
    texturecube<float> fp_t_tcb_1E [[id(6)]];
    sampler fp_t_tcb_1ESmplr [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    sampler fp_t_tcb_1ESmplr_w [[id(9)]];
    constant dm_border_t* dm_border [[id(10)]];
};

struct main0_out
{
    float4 m_47 [[color(0)]];
};

struct main0_in
{
    float4 m_40 [[user(locn0)]];
    float4 m_42 [[user(locn1)]];
    float4 m_38 [[user(locn2)]];
    float4 m_59 [[user(locn3)]];
    float4 m_53 [[user(locn4)]];
    float4 m_44 [[user(locn5)]];
    float4 m_51 [[user(locn6)]];
    float4 m_55 [[user(locn7)]];
    float4 m_49 [[user(locn8)]];
    float4 m_57 [[user(locn9)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _66 = gl_FragCoord.w;
    float _68 = in.m_38.x;
    float _70 = gl_FragCoord.w;
    float _72 = _68 * _70;
    float _74 = in.m_38.y;
    float _76 = gl_FragCoord.w;
    float _78 = _74 * _76;
    float _80 = 1.0 / _66;
    float _82 = _80 * _72;
    float _84 = _80 * _78;
    float2 _557 = float2(_82, _84);
    float4 _87 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_557, float2(0.0), isnan(_557))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_557, float2(0.0), isnan(_557))).xyzw;
    float _89 = _87.x;
    float _91 = _87.y;
    float _93 = _87.z;
    float _95 = _87.w;
    float _97 = in.m_40.w;
    float _99 = gl_FragCoord.w;
    float _101 = _97 * _99;
    float _103 = in.m_42.w;
    float _105 = gl_FragCoord.w;
    float _107 = _103 * _105;
    float _109 = in.m_44.x;
    float _111 = gl_FragCoord.w;
    float _113 = _109 * _111;
    float _115 = _80 * _101;
    float _117 = _80 * _107;
    float _119 = _80 * _113;
    float _121 = in.m_42.y;
    float _123 = gl_FragCoord.w;
    float _125 = _121 * _123;
    float _127 = in.m_40.y;
    float _129 = gl_FragCoord.w;
    float _131 = _127 * _129;
    float _133 = in.m_40.z;
    float _135 = gl_FragCoord.w;
    float _137 = _133 * _135;
    float _139 = in.m_42.z;
    float _141 = gl_FragCoord.w;
    float _143 = _139 * _141;
    float _145 = _80 * _125;
    float _147 = -_115;
    float _149 = _95 + _147;
    float _151 = _117 * _149;
    float _153 = 0.0 + _151;
    float _155 = precise::clamp(_153, 0.0, 1.0);
    float _157 = _155 * _119;
    bool _161 = _157 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _163 = isnan(_157);
    bool _165 = _161 || _163;
    bool _167 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _169 = _165 || _167;
    float _171 = in.m_40.x;
    float _173 = gl_FragCoord.w;
    float _175 = _171 * _173;
    float _177 = in.m_42.x;
    float _179 = gl_FragCoord.w;
    float _181 = _177 * _179;
    if (!_169)
    {
        discard_fragment();
    }
    float _183 = _80 * _131;
    float _185 = _80 * _137;
    float _187 = _80 * _143;
    float _189 = fma(_91, _183, _145);
    float _191 = fma(_93, _185, _187);
    float _193 = _80 * _175;
    float _195 = _80 * _181;
    float _197 = fma(_89, _193, _195);
    if (!_169)
    {
        out.m_47.x = _197;
        out.m_47.y = _189;
        out.m_47.z = _191;
        out.m_47.w = _151;
        return out;
    }
    float _199 = in.m_49.w;
    float _201 = gl_FragCoord.w;
    float _203 = _199 * _201;
    float _205 = _80 * _203;
    bool _207 = _205 != 1.0;
    bool _209 = isnan(_205);
    bool _211 = _207 || _209;
    bool _213 = isnan(1.0);
    bool _215 = _211 || _213;
    bool _217 = !_215;
    if (!_217)
    {
        float _219 = gl_FragCoord.x;
        float _221 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _223 = _219 / _221;
        float _225 = gl_FragCoord.y;
        float _227 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _229 = _225 / _227;
        float _231 = _205 * 256.0;
        float _233 = trunc(_231);
        int _236 = int(_233);
        uint _239 = uint(int(uint(_236) >> uint(7)));
        int _241 = int(_239) + _236;
        float _243 = trunc(_223);
        int _245 = int(_243);
        float _247 = trunc(_229);
        int _249 = int(_247);
        int _251 = _245 + 2;
        int _253 = _251 >> 1;
        uint _255 = uint(int(uint(_249) >> uint(1)));
        int _257 = _253 ^ int(_255);
        int _259 = _257 << 16;
        int _261 = _259 ^ _253;
        int _263 = 983055 & _261;
        int _265 = _263 << 6;
        int _267 = _265 + _263;
        int _269 = _267 & 13369548;
        uint _271 = uint(int(uint(_269) >> uint(3)));
        int _273 = _269 | int(_271);
        int _275 = _273 & 5570560;
        int _277 = _273 & 85;
        uint _279 = uint(int(uint(_275) >> uint(15)));
        int _281 = int(_279) + _277;
        bool _283 = uint(_241) > uint(_281);
        if (!_283)
        {
            discard_fragment();
        }
        if (!_283)
        {
            out.m_47.x = _197;
            out.m_47.y = _189;
            out.m_47.z = _191;
            out.m_47.w = _157;
            return out;
        }
    }
    float _285 = in.m_51.y;
    float _287 = gl_FragCoord.w;
    float _289 = _285 * _287;
    float _291 = in.m_51.x;
    float _293 = gl_FragCoord.w;
    float _295 = _291 * _293;
    float _297 = in.m_51.z;
    float _299 = gl_FragCoord.w;
    float _301 = _297 * _299;
    float _303 = in.m_49.x;
    float _305 = gl_FragCoord.w;
    float _307 = _303 * _305;
    float _309 = _80 * _289;
    float _311 = _80 * _295;
    float _313 = _80 * _301;
    float _315 = _309 * _309;
    float _317 = fma(_311, _311, _315);
    float _319 = fma(_313, _313, _317);
    float _321 = rsqrt(_319);
    float _323 = _311 * _321;
    float _325 = _309 * _321;
    float _327 = _313 * _321;
    float _329 = _80 * _307;
    float _331 = abs(_323);
    float _333 = abs(_325);
    float _335 = precise::max(_331, _333);
    float _337 = abs(_327);
    float _339 = precise::max(_337, _335);
    float _341 = 1.0 / _339;
    float _343 = _323 * _341;
    float _345 = -_341;
    float _347 = _327 * _345;
    float _349 = precise::min(_329, 1.0);
    float _351 = _325 * _341;
    float3 _955 = float3(_343, _351, _347);
    float3 _355 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_955, float3(0.0), isnan(_955)), level(_349)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_955, float3(0.0), isnan(_955)), level(_349)).xyz;
    float _357 = _355.x;
    float _359 = _355.y;
    float _361 = _355.z;
    float _363 = in.m_53.y;
    float _365 = gl_FragCoord.w;
    float _367 = _363 * _365;
    float _369 = in.m_53.z;
    float _371 = gl_FragCoord.w;
    float _373 = _369 * _371;
    float _375 = in.m_53.x;
    float _377 = gl_FragCoord.w;
    float _379 = _375 * _377;
    float _381 = in.m_55.z;
    float _383 = gl_FragCoord.w;
    float _385 = _381 * _383;
    float _387 = in.m_55.x;
    float _389 = gl_FragCoord.w;
    float _391 = _387 * _389;
    float _393 = in.m_55.y;
    float _395 = gl_FragCoord.w;
    float _397 = _393 * _395;
    float _399 = in.m_57.x;
    float _401 = gl_FragCoord.w;
    float _403 = _399 * _401;
    float _405 = in.m_57.w;
    float _407 = gl_FragCoord.w;
    float _409 = _405 * _407;
    float _411 = in.m_57.y;
    float _413 = gl_FragCoord.w;
    float _415 = _411 * _413;
    float _417 = in.m_57.z;
    float _419 = gl_FragCoord.w;
    float _421 = _417 * _419;
    float _423 = _80 * _367;
    float _425 = _80 * _373;
    float _427 = _80 * _379;
    bool _429 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _431 = _80 * _409;
    float _433 = fma(_361, 0.20999999344348907470703125, _425);
    float _435 = fma(_357, 0.20999999344348907470703125, _427);
    float _437 = _80 * _385;
    float _439 = fma(_359, 0.20999999344348907470703125, _423);
    float _441 = _80 * _391;
    float _443 = _80 * _397;
    float _445 = _433 + _437;
    float _447 = _435 + _441;
    float _449 = _439 + _443;
    float _451 = _191 * _445;
    float _453 = 0.0 + _157;
    float _455 = precise::clamp(_453, 0.0, 1.0);
    float _457 = _197 * _447;
    float _459 = _80 * _403;
    float _461 = _189 * _449;
    float _463 = _80 * _415;
    float _465 = _80 * _421;
    float _467 = fma(_457, _431, _459);
    float _469 = _459;
    if (!_429)
    {
        _469 = _455;
    }
    float _471 = _469;
    float _473 = fma(_461, _431, _463);
    float _475 = fma(_451, _431, _465);
    bool _477 = !_429;
    float _479 = _471;
    if (!_477)
    {
        float _481 = in.m_59.w;
        float _483 = gl_FragCoord.w;
        float _485 = _481 * _483;
        float _487 = in.m_59.z;
        float _489 = gl_FragCoord.w;
        float _491 = _487 * _489;
        float _493 = _80 * _485;
        float _495 = _80 * _491;
        float _497 = 1.0 / _493;
        float _499 = _495 * _497;
        float _501 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _503 = fma(_499, (*spvDescriptorSet0.fp_c8)._m0[30].w, _501);
        float _505 = 1.0 / _503;
        float _507 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _509 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _511 = fma(_505, _507, _509);
        float _513 = _511 * 8.0;
        float _515 = precise::clamp(_513, 0.0, 1.0);
        float _517 = _455 * _515;
        _479 = _517;
    }
    float _519 = _479;
    float _521 = 0.0 + _519;
    float _523 = precise::clamp(_521, 0.0, 1.0);
    out.m_47.x = _467;
    out.m_47.y = _473;
    out.m_47.z = _475;
    out.m_47.w = _523;
    return out;
}

