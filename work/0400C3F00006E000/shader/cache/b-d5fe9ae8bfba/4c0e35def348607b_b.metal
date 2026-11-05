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
    float2 _569 = float2(_82, _84);
    float4 _87 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_569, float2(0.0), isnan(_569))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_569, float2(0.0), isnan(_569))).xyzw;
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
    float _121 = in.m_40.z;
    float _123 = gl_FragCoord.w;
    float _125 = _121 * _123;
    float _127 = in.m_42.x;
    float _129 = gl_FragCoord.w;
    float _131 = _127 * _129;
    float _133 = in.m_42.y;
    float _135 = gl_FragCoord.w;
    float _137 = _133 * _135;
    float _139 = in.m_42.z;
    float _141 = gl_FragCoord.w;
    float _143 = _139 * _141;
    float _145 = _80 * _131;
    float _147 = _80 * _137;
    float _149 = -_115;
    float _151 = _95 + _149;
    float _153 = _117 * _151;
    float _155 = 0.0 + _153;
    float _157 = precise::clamp(_155, 0.0, 1.0);
    float _159 = _157 * _119;
    bool _163 = _159 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _165 = isnan(_159);
    bool _167 = _163 || _165;
    bool _169 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _171 = _167 || _169;
    float _173 = in.m_40.x;
    float _175 = gl_FragCoord.w;
    float _177 = _173 * _175;
    float _179 = in.m_40.y;
    float _181 = gl_FragCoord.w;
    float _183 = _179 * _181;
    if (!_171)
    {
        discard_fragment();
    }
    float _185 = _80 * _177;
    float _187 = _80 * _183;
    float _189 = _80 * _125;
    float _191 = _80 * _143;
    float _193 = -_145;
    float _195 = _185 + _193;
    float _197 = -_147;
    float _199 = _187 + _197;
    float _201 = -_191;
    float _203 = _189 + _201;
    float _205 = fma(_89, _195, _145);
    float _207 = fma(_91, _199, _147);
    float _209 = fma(_93, _203, _191);
    if (!_171)
    {
        out.m_47.x = _205;
        out.m_47.y = _207;
        out.m_47.z = _209;
        out.m_47.w = _153;
        return out;
    }
    float _211 = in.m_49.w;
    float _213 = gl_FragCoord.w;
    float _215 = _211 * _213;
    float _217 = _80 * _215;
    bool _219 = _217 != 1.0;
    bool _221 = isnan(_217);
    bool _223 = _219 || _221;
    bool _225 = isnan(1.0);
    bool _227 = _223 || _225;
    bool _229 = !_227;
    if (!_229)
    {
        float _231 = gl_FragCoord.x;
        float _233 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _235 = _231 / _233;
        float _237 = gl_FragCoord.y;
        float _239 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _241 = _237 / _239;
        float _243 = _217 * 256.0;
        float _245 = trunc(_243);
        int _248 = int(_245);
        float _250 = trunc(_235);
        int _252 = int(_250);
        float _254 = trunc(_241);
        int _256 = int(_254);
        int _258 = _252 + 2;
        int _260 = _258 >> 1;
        uint _263 = uint(int(uint(_256) >> uint(1)));
        int _265 = _260 ^ int(_263);
        int _267 = _265 << 16;
        int _269 = _267 ^ _260;
        int _271 = 983055 & _269;
        int _273 = _271 << 6;
        int _275 = _273 + _271;
        int _277 = _275 & 13369548;
        uint _279 = uint(int(uint(_277) >> uint(3)));
        int _281 = _277 | int(_279);
        uint _283 = uint(int(uint(_248) >> uint(7)));
        int _285 = int(_283) + _248;
        int _287 = _281 & 5570560;
        int _289 = _281 & 85;
        uint _291 = uint(int(uint(_287) >> uint(15)));
        int _293 = int(_291) + _289;
        bool _295 = uint(_285) > uint(_293);
        if (!_295)
        {
            discard_fragment();
        }
        if (!_295)
        {
            out.m_47.x = _205;
            out.m_47.y = _207;
            out.m_47.z = _209;
            out.m_47.w = _159;
            return out;
        }
    }
    float _297 = in.m_51.y;
    float _299 = gl_FragCoord.w;
    float _301 = _297 * _299;
    float _303 = in.m_51.x;
    float _305 = gl_FragCoord.w;
    float _307 = _303 * _305;
    float _309 = in.m_51.z;
    float _311 = gl_FragCoord.w;
    float _313 = _309 * _311;
    float _315 = in.m_49.x;
    float _317 = gl_FragCoord.w;
    float _319 = _315 * _317;
    float _321 = _80 * _301;
    float _323 = _80 * _307;
    float _325 = _80 * _313;
    float _327 = _321 * _321;
    float _329 = fma(_323, _323, _327);
    float _331 = fma(_325, _325, _329);
    float _333 = rsqrt(_331);
    float _335 = _323 * _333;
    float _337 = _321 * _333;
    float _339 = _325 * _333;
    float _341 = abs(_335);
    float _343 = abs(_337);
    float _345 = precise::max(_341, _343);
    float _347 = abs(_339);
    float _349 = precise::max(_347, _345);
    float _351 = _80 * _319;
    float _353 = 1.0 / _349;
    float _355 = precise::min(_351, 1.0);
    float _357 = -_353;
    float _359 = _339 * _357;
    float _361 = _335 * _353;
    float _363 = _337 * _353;
    float3 _982 = float3(_361, _363, _359);
    float3 _367 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_982, float3(0.0), isnan(_982)), level(_355)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_982, float3(0.0), isnan(_982)), level(_355)).xyz;
    float _369 = _367.x;
    float _371 = _367.y;
    float _373 = _367.z;
    float _375 = in.m_53.x;
    float _377 = gl_FragCoord.w;
    float _379 = _375 * _377;
    float _381 = in.m_53.z;
    float _383 = gl_FragCoord.w;
    float _385 = _381 * _383;
    float _387 = in.m_53.y;
    float _389 = gl_FragCoord.w;
    float _391 = _387 * _389;
    float _393 = in.m_55.z;
    float _395 = gl_FragCoord.w;
    float _397 = _393 * _395;
    float _399 = in.m_55.x;
    float _401 = gl_FragCoord.w;
    float _403 = _399 * _401;
    float _405 = in.m_55.y;
    float _407 = gl_FragCoord.w;
    float _409 = _405 * _407;
    float _411 = in.m_57.x;
    float _413 = gl_FragCoord.w;
    float _415 = _411 * _413;
    float _417 = in.m_57.w;
    float _419 = gl_FragCoord.w;
    float _421 = _417 * _419;
    float _423 = in.m_57.y;
    float _425 = gl_FragCoord.w;
    float _427 = _423 * _425;
    float _429 = in.m_57.z;
    float _431 = gl_FragCoord.w;
    float _433 = _429 * _431;
    float _435 = _80 * _379;
    float _437 = _80 * _385;
    float _439 = _80 * _391;
    bool _441 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _443 = fma(_373, 0.20999999344348907470703125, _437);
    float _445 = fma(_369, 0.20999999344348907470703125, _435);
    float _447 = _80 * _397;
    float _449 = fma(_371, 0.20999999344348907470703125, _439);
    float _451 = _80 * _403;
    float _453 = _80 * _409;
    float _455 = _443 + _447;
    float _457 = _445 + _451;
    float _459 = _449 + _453;
    float _461 = _209 * _455;
    float _463 = 0.0 + _159;
    float _465 = precise::clamp(_463, 0.0, 1.0);
    float _467 = _205 * _457;
    float _469 = _80 * _415;
    float _471 = _80 * _421;
    float _473 = _207 * _459;
    float _475 = _80 * _427;
    float _477 = _80 * _433;
    float _479 = fma(_467, _471, _469);
    float _481 = _469;
    if (!_441)
    {
        _481 = _465;
    }
    float _483 = _481;
    float _485 = fma(_473, _471, _475);
    float _487 = fma(_461, _471, _477);
    bool _489 = !_441;
    float _491 = _483;
    if (!_489)
    {
        float _493 = in.m_59.w;
        float _495 = gl_FragCoord.w;
        float _497 = _493 * _495;
        float _499 = in.m_59.z;
        float _501 = gl_FragCoord.w;
        float _503 = _499 * _501;
        float _505 = _80 * _497;
        float _507 = _80 * _503;
        float _509 = 1.0 / _505;
        float _511 = _507 * _509;
        float _513 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _515 = fma(_511, (*spvDescriptorSet0.fp_c8)._m0[30].w, _513);
        float _517 = 1.0 / _515;
        float _519 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _521 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _523 = fma(_517, _519, _521);
        float _525 = _523 * 8.0;
        float _527 = precise::clamp(_525, 0.0, 1.0);
        float _529 = _465 * _527;
        _491 = _529;
    }
    float _531 = _491;
    float _533 = 0.0 + _531;
    float _535 = precise::clamp(_533, 0.0, 1.0);
    out.m_47.x = _479;
    out.m_47.y = _485;
    out.m_47.z = _487;
    out.m_47.w = _535;
    return out;
}

