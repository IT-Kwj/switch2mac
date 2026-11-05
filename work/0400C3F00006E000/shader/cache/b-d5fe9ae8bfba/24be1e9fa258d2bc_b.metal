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
    constant _16* vp_c8 [[id(0)]];
    constant _16* vp_c10 [[id(1)]];
    constant _16* vp_c9 [[id(2)]];
    constant _16* vp_c7 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
    constant _16* vp_c16 [[id(5)]];
    texture3d<float> vp_t_tcb_32 [[id(6)]];
    sampler vp_t_tcb_32Smplr [[id(7)]];
    texture3d<float> vp_t_tcb_30 [[id(8)]];
    sampler vp_t_tcb_30Smplr [[id(9)]];
    texture2d<float> vp_t_tcb_1C [[id(10)]];
    sampler vp_t_tcb_1CSmplr [[id(11)]];
    sampler vp_t_tcb_32Smplr_w [[id(12)]];
    sampler vp_t_tcb_30Smplr_w [[id(13)]];
    sampler vp_t_tcb_1CSmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_58 [[user(locn0)]];
    float4 m_60 [[user(locn1)]];
    float4 m_66 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_62 [[user(locn4)]];
    float4 m_64 [[user(locn6)]];
    float4 m_68 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_53 [[attribute(4)]];
    float4 m_51 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1331 = false;
    bool _611 = false;
    bool _461 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _82 = in.m_44.w;
    float _84 = trunc(_82);
    int _87 = int(_84);
    bool _91 = _87 >= 1;
    float _93 = 0.0;
    if (!_91)
    {
        _93 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _95 = _93;
    float _97 = _95;
    if (!_91)
    {
        out.m_47.x = 0.0;
    }
    int _99 = 0;
    if (!_91)
    {
        float _101 = _95 * 5.0;
        _99 = as_type<int>(_101);
    }
    int _103 = _99;
    int _105 = _103;
    if (!_91)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1963 = as_type<float>(_103);
        out.gl_Position.z = _1963;
    }
    if (!_91)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _107 = in.m_49.w;
    bool _109 = _107 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _111 = isnan(_107);
    bool _113 = _109 || _111;
    bool _115 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _117 = _113 || _115;
    float _119 = -_107;
    float _121 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _123 = 0.0;
    float _125 = 0.0;
    if (_117)
    {
        float _127 = float(_87);
        _97 = _127;
    }
    float _129 = _97;
    bool _131 = _121 >= _129;
    bool _133 = !_117;
    bool _135 = _131 || _133;
    float _137 = _129;
    if (_135)
    {
        _137 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _137;
    if (_135)
    {
        out.m_47.x = 0.0;
    }
    if (_135)
    {
        float _141 = _139 * 5.0;
        _105 = as_type<int>(_141);
    }
    int _143 = _105;
    float _145 = as_type<float>(_143);
    if (_135)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2034 = as_type<float>(_143);
        out.gl_Position.z = _2034;
    }
    if (_135)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _147 = in.m_49.x;
    float _149 = in.m_49.y;
    float _151 = in.m_49.z;
    float _153 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _155 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _157 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _159 = _155 || _157;
    bool _161 = isnan(1.0);
    bool _163 = _159 || _161;
    float _165 = _153;
    if (!_163)
    {
        float _167 = _153 * _153;
        float _169 = _167 * 0.5;
        _145 = _169;
    }
    float _171 = _145;
    float _173 = 0.0;
    float _175 = _171;
    if (!_163)
    {
        float _177 = _121 * _121;
        float _179 = _177 * 0.5;
        _173 = _179;
    }
    float _181 = _173;
    if (!_163)
    {
        float _183 = _171 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _175 = _183;
    }
    float _185 = _175;
    bool _187 = !_163;
    float _189 = _185;
    if (!_187)
    {
        float _191 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _193 = log2(_191);
        float _195 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _197 = _195 + 1.0;
        float _199 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _201 = _153 * _193;
        float _203 = 1.0 / _197;
        float _205 = _199 * 0.693147182464599609375;
        float _207 = exp2(_201);
        float _209 = 1.0 / _205;
        float _211 = _207 + (-1.0);
        float _213 = -_211;
        float _215 = fma(_213, _209, _153);
        float _217 = _215 * _203;
        float _219 = _217 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _123 = _209;
        _189 = _219;
        _125 = _207;
    }
    float _221 = _123;
    float _223 = _189;
    float _225 = _125;
    bool _227 = !_163;
    float _229 = _221;
    float _231 = _225;
    if (!_227)
    {
        float _233 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _235 = log2(_233);
        float _237 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _239 = _237 + 1.0;
        float _241 = 1.0 / _239;
        float _243 = _153 * _235;
        float _245 = exp2(_243);
        float _247 = -_245;
        float _249 = _247 + 1.0;
        float _251 = _249 * _241;
        _229 = _245;
        _231 = _239;
        _165 = _251;
    }
    float _253 = _229;
    float _255 = _231;
    float _257 = _165;
    float _259 = _255;
    float _261 = _253;
    if (!_163)
    {
        _259 = _121;
    }
    float _263 = _259;
    float _265 = _223 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _267 = _263;
    if (!_163)
    {
        float _269 = _181 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _261 = _269;
    }
    float _271 = _261;
    bool _273 = !_163;
    float _275 = _271;
    if (!_273)
    {
        float _277 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _279 = log2(_277);
        float _281 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _283 = _281 + 1.0;
        float _285 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _287 = _121 * _279;
        float _289 = 1.0 / _283;
        float _291 = _285 * 0.693147182464599609375;
        float _293 = exp2(_287);
        float _295 = 1.0 / _291;
        float _297 = _293 + (-1.0);
        float _299 = -_297;
        float _301 = fma(_299, _295, _121);
        float _303 = _301 * _289;
        float _305 = _303 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _275 = _305;
    }
    float _307 = _275;
    bool _309 = !_163;
    if (!_309)
    {
        float _311 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _313 = log2(_311);
        float _315 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _317 = _315 + 1.0;
        float _319 = 1.0 / _317;
        float _321 = _121 * _313;
        float _323 = exp2(_321);
        float _325 = -_323;
        float _327 = _325 + 1.0;
        float _329 = _327 * _319;
        _267 = _329;
    }
    float _331 = _267;
    float _333 = _307 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _335 = fma(_257, _149, _265);
    float _337 = _223 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _339 = _307 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _341 = fma(_331, _149, _333);
    float _343 = _223 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _345 = _307 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _347 = fma(_257, _147, _337);
    float _349 = fma(_331, _147, _339);
    float _351 = -_341;
    float _353 = _335 + _351;
    float _355 = fma(_257, _151, _343);
    float _357 = fma(_331, _151, _345);
    float _359 = -_349;
    float _361 = _347 + _359;
    float _363 = _353 * _353;
    float _365 = in.m_51.w;
    float _367 = -_357;
    float _369 = _355 + _367;
    float _371 = _353 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _373 = fma(_361, _361, _363);
    float _375 = _353 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _377 = _353 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _379 = fma(_361, (*spvDescriptorSet0.vp_c10)._m0[4].x, _371);
    float _381 = fma(_369, _369, _373);
    float _383 = fma(_361, (*spvDescriptorSet0.vp_c10)._m0[5].x, _375);
    float _385 = in.m_44.x;
    float _387 = in.m_44.y;
    float _389 = in.m_44.z;
    float _391 = fma(_361, (*spvDescriptorSet0.vp_c10)._m0[6].x, _377);
    float _393 = fma(_369, (*spvDescriptorSet0.vp_c10)._m0[4].z, _379);
    float _395 = sqrt(_381);
    float _397 = fma(_369, (*spvDescriptorSet0.vp_c10)._m0[5].z, _383);
    float _399 = fma(_369, (*spvDescriptorSet0.vp_c10)._m0[6].z, _391);
    bool _401 = _395 >= 9.9999999747524270787835121154785e-07;
    bool _403 = isnan(_395);
    bool _405 = _401 || _403;
    bool _407 = isnan(9.9999999747524270787835121154785e-07);
    bool _409 = _405 || _407;
    float _411 = fma(_347, _365, _385);
    float _413 = fma(_335, _365, _387);
    float _415 = fma(_355, _365, _389);
    float _417 = _397;
    float _419 = _393;
    float _421 = _399;
    if (!_409)
    {
        bool _423 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _425 = !_423;
        if (!_425)
        {
            float _427 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _429 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _431 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _433 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _427);
            float _435 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _429);
            float _437 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _431);
            float _439 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _433);
            float _441 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _435);
            float _443 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _437);
            float _445 = _439 * _439;
            float _447 = fma(_441, _441, _445);
            float _449 = fma(_443, _443, _447);
            float _451 = rsqrt(_449);
            float _453 = _451 * 9.9999999747524270787835121154785e-07;
            float _455 = _441 * _453;
            float _457 = _439 * _453;
            float _459 = _443 * _453;
            _417 = _457;
            _419 = _455;
            _421 = _459;
            _461 = true;
        }
        else
        {
            float _463 = _149 * _149;
            float _465 = fma(_147, _147, _463);
            float _467 = fma(_151, _151, _465);
            float _469 = sqrt(_467);
            bool _471 = _469 >= 9.9999999747524270787835121154785e-07;
            bool _473 = isnan(_469);
            bool _475 = _471 || _473;
            bool _477 = isnan(9.9999999747524270787835121154785e-07);
            bool _479 = _475 || _477;
            if (!_479)
            {
                float _481 = _387 * _387;
                float _483 = fma(_385, _385, _481);
                float _485 = fma(_389, _389, _483);
                float _487 = sqrt(_485);
                bool _489 = _487 >= 9.9999999747524270787835121154785e-07;
                bool _491 = isnan(_487);
                bool _493 = _489 || _491;
                bool _495 = isnan(9.9999999747524270787835121154785e-07);
                bool _497 = _493 || _495;
                if (!_497)
                {
                    float _499 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _501 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _499);
                    float _503 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _501);
                    float _505 = rsqrt(_503);
                    float _507 = _505 * 9.9999999747524270787835121154785e-07;
                    float _509 = _507 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _511 = _507 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _513 = _507 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _417 = _511;
                    _419 = _509;
                    _421 = _513;
                    _461 = true;
                }
                else
                {
                    float _515 = _387 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _517 = _387 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _519 = _387 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _521 = fma(_385, (*spvDescriptorSet0.vp_c10)._m0[5].x, _515);
                    float _523 = fma(_385, (*spvDescriptorSet0.vp_c10)._m0[4].x, _517);
                    float _525 = fma(_385, (*spvDescriptorSet0.vp_c10)._m0[6].x, _519);
                    float _527 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[5].z, _521);
                    float _529 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[4].z, _523);
                    float _531 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[6].z, _525);
                    float _533 = _527 * _527;
                    float _535 = fma(_529, _529, _533);
                    float _537 = fma(_531, _531, _535);
                    float _539 = rsqrt(_537);
                    float _541 = _539 * 9.9999999747524270787835121154785e-07;
                    float _543 = _529 * _541;
                    float _545 = _527 * _541;
                    float _547 = _531 * _541;
                    _417 = _545;
                    _419 = _543;
                    _421 = _547;
                    _461 = true;
                }
            }
            else
            {
                float _549 = _149 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _551 = _149 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _553 = _149 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _555 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[5].x, _549);
                float _557 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[4].x, _551);
                float _559 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[6].x, _553);
                float _561 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[5].z, _555);
                float _563 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[4].z, _557);
                float _565 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[6].z, _559);
                float _567 = _561 * _561;
                float _569 = fma(_563, _563, _567);
                float _571 = fma(_565, _565, _569);
                float _573 = rsqrt(_571);
                float _575 = _573 * 9.9999999747524270787835121154785e-07;
                float _577 = _563 * _575;
                float _579 = _561 * _575;
                float _581 = _565 * _575;
                _417 = _579;
                _419 = _577;
                _421 = _581;
            }
        }
    }
    _461 = false;
    float _583 = _417;
    float _585 = _419;
    float _587 = _421;
    bool _589 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _591 = !_589;
    float _609;
    if (!_591)
    {
        float _593 = in.m_53.x;
        float _595 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _597 = _593 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _599 = fma(_597, (*spvDescriptorSet0.vp_c9)._m0[12].x, _121);
        float _601 = _599 * _595;
        float _603 = floor(_601);
        float _605 = -_603;
        float _607 = _601 + _605;
        _609 = _607;
        _611 = true;
    }
    else
    {
        float _613 = float(_87);
        float _615 = 1.0 / _613;
        float _617 = _121 * _615;
        _609 = _617;
    }
    _611 = false;
    float _619 = _609;
    float _621 = _413 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _623 = _413 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _625 = _413 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _627 = as_type<float>(int(gl_VertexIndex));
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _631 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _629;
    float _633 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _635 = _633 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _637 = fma(_411, (*spvDescriptorSet0.vp_c10)._m0[5].x, _621);
    float _639 = fma(_411, (*spvDescriptorSet0.vp_c10)._m0[4].x, _623);
    float _641 = fma(_411, (*spvDescriptorSet0.vp_c10)._m0[6].x, _625);
    float _643 = 1.0 / _635;
    float _645 = fma(_415, (*spvDescriptorSet0.vp_c10)._m0[5].z, _637);
    float _647 = fma(_415, (*spvDescriptorSet0.vp_c10)._m0[4].z, _639);
    float _649 = fma(_415, (*spvDescriptorSet0.vp_c10)._m0[6].z, _641);
    float _651 = _583 * _583;
    float _653 = _645 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _655 = _647 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _657 = _649 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _659 = 1.0 / _631;
    float _661 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _663 = _653 + _661;
    float _665 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _667 = _619 + _665;
    float _669 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _671 = _655 + _669;
    float _673 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _675 = _657 + _673;
    float _677 = _663 * _663;
    float _679 = 0.0 + (*spvDescriptorSet0.vp_c7)._m0[0].x;
    float _681 = precise::clamp(_679, 0.0, 1.0);
    float _683 = _667 * _643;
    float _685 = fma(_671, _671, _677);
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _689 = _619 + _687;
    bool _691 = _619 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _693 = isnan(_619);
    bool _695 = _691 || _693;
    bool _697 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _699 = _695 || _697;
    float _701 = float(_699);
    bool _703 = _619 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _705 = isnan(_619);
    bool _707 = _703 || _705;
    bool _709 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _711 = _707 || _709;
    float _713 = float(_711);
    float _715 = fma(_675, _675, _685);
    bool _717 = _619 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _719 = isnan(_619);
    bool _721 = _717 || _719;
    bool _723 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _725 = _721 || _723;
    float _727 = float(_725);
    float _729 = fma(_585, _585, _651);
    float _731 = _689 * _659;
    float _733 = -_727;
    float _735 = _733 + 1.0;
    float _737 = fma(_587, _587, _729);
    float _739 = rsqrt(_715);
    float _741 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _743 = _741 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _745 = _713 * _735;
    float _747 = -_713;
    float _749 = _747 + 1.0;
    float _751 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _753 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _751;
    float _755 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _757 = _755 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _759 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _761 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _759;
    float _763 = fma(_743, _683, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _765 = rsqrt(_737);
    float _767 = fma(_681, -0.64999997615814208984375, 1.0);
    float _769 = fma(_753, _731, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _771 = _701 * _749;
    float _773 = fma(_757, _683, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _775 = fma(_761, _731, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    int _777 = as_type<int>(_627) & 1;
    bool _779 = _777 != 0;
    int _781 = as_type<int>(_627) & 2;
    bool _783 = _781 != 0;
    float _785 = _663 * _739;
    float _787 = _769 * _771;
    float _789 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _791 = (*spvDescriptorSet0.vp_c10)._m0[9].w + _789;
    float _793 = -_785;
    float _795 = fma(_793, (*spvDescriptorSet0.vp_c9)._m0[18].w, _663);
    float _797 = _775 * _771;
    float _799 = -_701;
    float _801 = _799 + 1.0;
    float _803 = _765 * _585;
    float _805 = _671 * _739;
    float _807 = _795 * _795;
    float _809 = _765 * _587;
    float _811 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _813 = (*spvDescriptorSet0.vp_c10)._m0[8].w + _811;
    float _815 = -_805;
    float _817 = fma(_815, (*spvDescriptorSet0.vp_c9)._m0[18].w, _671);
    float _819 = _791 * _791;
    float _821 = _765 * _583;
    float _823 = fma(_801, (*spvDescriptorSet0.vp_c9)._m0[143].x, _787);
    float _825 = fma(_801, (*spvDescriptorSet0.vp_c9)._m0[143].y, _797);
    float _827 = fma(_817, _817, _807);
    float _829 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _831 = _809 * _829;
    float _833 = _675 * _739;
    float _835 = in.m_51.x;
    float _837 = in.m_51.y;
    float _839 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _841 = (*spvDescriptorSet0.vp_c10)._m0[10].w + _839;
    float _843 = fma(_813, _813, _819);
    float _845 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _847 = _821 * _845;
    float _849 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _851 = -_831;
    float _853 = fma(_803, _849, _851);
    float _855 = -_833;
    float _857 = fma(_855, (*spvDescriptorSet0.vp_c9)._m0[18].w, _675);
    float _859 = fma(_841, _841, _843);
    float _861 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _863 = _803 * _861;
    float _865 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _867 = -_847;
    float _869 = fma(_809, _865, _867);
    float _871 = _853 * _853;
    float _873 = fma(_857, _857, _827);
    float _875 = rsqrt(_859);
    float _877 = fma(_763, _745, _823);
    float _879 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _881 = -_863;
    float _883 = fma(_821, _879, _881);
    float _885 = fma(_869, _869, _871);
    float _887 = fma(_773, _745, _825);
    float _889 = fma(_727, (*spvDescriptorSet0.vp_c9)._m0[145].x, _877);
    float _891 = fma(_883, _883, _885);
    float _893 = sqrt(_873);
    float _895 = fma(_727, (*spvDescriptorSet0.vp_c9)._m0[145].y, _887);
    float _897 = _895 * _837;
    float _899 = _889 * _835;
    float _901 = rsqrt(_891);
    float _903 = _875 * (-0.20000000298023223876953125);
    float _905 = _897 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _907 = _899 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _909 = !_783;
    float _911 = _909 ? (-0.5) : 0.5;
    float _913 = fma(_791, _903, (*spvDescriptorSet0.vp_c10)._m0[9].w);
    bool _915 = !_779;
    float _917 = _915 ? (-0.5) : 0.5;
    float _919 = sqrt(_859);
    float _921 = _739 * _893;
    float _923 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _911);
    float _925 = fma(_841, _903, (*spvDescriptorSet0.vp_c10)._m0[10].w);
    float _927 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _917);
    float _929 = _905 * _921;
    float _931 = _907 * _921;
    float _933 = fma(_813, _903, (*spvDescriptorSet0.vp_c10)._m0[8].w);
    float _935 = _869 * _901;
    float _937 = _929 * _923;
    float _939 = _853 * _901;
    float _941 = _883 * _901;
    float _943 = _931 * _927;
    float _945 = _809 * _935;
    float _947 = _937 * _821;
    float _949 = _821 * _941;
    float _951 = _919 * 0.066666670143604278564453125;
    float _953 = -_945;
    float _955 = fma(_803, _941, _953);
    float _957 = _921 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _959 = _957 * 0.5;
    float _961 = _937 * _803;
    float _963 = fma(_943, _939, _947);
    float _965 = precise::max(_951, 1.0);
    float _967 = _803 * _939;
    float _969 = -_949;
    float _971 = fma(_809, _939, _969);
    float _973 = _937 * _809;
    float _975 = fma(_943, _935, _961);
    float _977 = fma(_959, _955, _963);
    float _979 = precise::min(_965, 2.0);
    float _981 = -_967;
    float _983 = fma(_821, _935, _981);
    float _985 = fma(_943, _941, _973);
    float _987 = fma(_959, _971, _975);
    float _989 = _653 + _977;
    float _991 = -_913;
    float _993 = _991 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _995 = _979 * _767;
    float _997 = _655 + _987;
    float _999 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1001 = _989 + _999;
    float _1003 = fma(_959, _983, _985);
    float _1005 = _993 * _993;
    float _1007 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1009 = _997 + _1007;
    float _1011 = fma(_1001, _995, (*spvDescriptorSet0.vp_c10)._m0[9].w);
    float _1013 = _657 + _1003;
    float _1015 = -_933;
    float _1017 = _1015 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1019 = fma(_1009, _995, (*spvDescriptorSet0.vp_c10)._m0[8].w);
    float _1021 = -_1011;
    float _1023 = _1021 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1025 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1027 = _1013 + _1025;
    float _1029 = fma(_1017, _1017, _1005);
    float _1031 = -_925;
    float _1033 = _1031 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1035 = -_1019;
    float _1037 = _1035 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1039 = _1023 * _1023;
    float _1041 = fma(_1027, _995, (*spvDescriptorSet0.vp_c10)._m0[10].w);
    float _1043 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1045 = _913 + _1043;
    float _1047 = fma(_1033, _1033, _1029);
    float _1049 = fma(_1037, _1037, _1039);
    float _1051 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1053 = _933 + _1051;
    float _1055 = -_1041;
    float _1057 = _1055 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1059 = _1045 * _1045;
    float _1061 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1063 = _925 + _1061;
    float _1065 = sqrt(_1047);
    float _1067 = fma(_1057, _1057, _1049);
    float _1069 = fma(_1053, _1053, _1059);
    float _1071 = fma(_1063, _1063, _1069);
    int _1073 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1075 = _1073 != 0;
    float _1077 = sqrt(_1067);
    float _1079 = rsqrt(_1071);
    float _1081 = -_1065;
    float _1083 = _1077 + _1081;
    float _1085 = _1079 * _1083;
    float _1087 = -_1085;
    float _1089 = fma(_1053, _1087, _1019);
    float _1091 = -_1085;
    float _1093 = fma(_1063, _1091, _1041);
    float _1095 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1097 = in.m_53.x;
    float _1099 = in.m_53.y;
    float _1101 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1103 = _1089 + _1101;
    float _1105 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1107 = _1093 + _1105;
    float _1109 = _1103 * _1103;
    float _1111 = _1107 * _1107;
    float _1113 = _1109 + _1111;
    float _1115 = sqrt(_1113);
    bool _1117 = _1097 > 0.5;
    float _1119 = -_917;
    float _1121 = _1117 ? _1119 : _917;
    bool _1123 = _1115 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _1125 = _1099 > 0.5;
    float _1127 = -_1085;
    float _1129 = fma(_1045, _1127, _1011);
    bool _1131 = !_1075;
    float _1133 = _1131 ? _917 : _1121;
    float _1135 = _1121;
    float _1137 = _1045;
    float _1139 = _1093;
    float _1141 = _1109;
    float _1143 = _1111;
    float _1145 = _1107;
    if (!_1123)
    {
        _1135 = _1093;
    }
    float _1147 = _1135;
    float _1149 = _1147;
    if (!_1123)
    {
        _1137 = _1089;
    }
    float _1151 = _1137;
    float _1153 = _1151;
    if (!_1123)
    {
        _1139 = _1129;
    }
    float _1155 = _1139;
    bool _1157 = !_1123;
    float _1159 = _1155;
    if (!_1157)
    {
        float _1161 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1163 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1165 = _1115 + _1163;
        float _1167 = rsqrt(_1113);
        float _1169 = _1165 * _1161;
        float _1171 = _1129 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1173 = _1169 * 0.15915493667125701904296875;
        float _1175 = _1173 * 6.283185482025146484375;
        float _1177 = sin(_1175);
        float _1179 = _1173 * 6.283185482025146484375;
        float _1181 = cos(_1179);
        float _1183 = fma(_1177, _1171, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1185 = _1167 * _1183;
        float _1187 = _1181 + (-1.0);
        float _1189 = fma(_1103, _1185, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1191 = fma(_1107, _1185, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1193 = _1187 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1195 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1197 = _1189 + _1195;
        float _1199 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1201 = _1191 + _1199;
        float _1203 = fma(_1129, _1181, _1193);
        float _1205 = _1197 * _1197;
        float _1207 = _1201 * _1201;
        _1159 = _1203;
        _1141 = _1205;
        _1143 = _1207;
        _1153 = _1189;
        _1149 = _1191;
    }
    float _1209 = _1159;
    float _1211 = _1141;
    float _1213 = _1143;
    float _1215 = _1153;
    float _1217 = _1149;
    float _1219 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1221 = _1209 + _1219;
    float _1223 = _1133 + 0.5;
    int _1225 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1227 = _1225 != 0;
    float _1229 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1231 = -_911;
    int _1233 = _1125 ? as_type<int>(_1231) : as_type<int>(_911);
    float _1235 = fma(_1221, _1221, _1211);
    float _1237 = _1223 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1239 = !_1227;
    float _1241 = _1239 ? _911 : as_type<float>(_1233);
    float _1243 = _1235 + _1213;
    float _1245 = _1237 * _1095;
    float _1247 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1249 = -_1241;
    float _1251 = _1249 + 0.5;
    float _1253 = sqrt(_1243);
    float _1255 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1257 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1259 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1261 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1263 = _1251 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1265 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1267 = _1255 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1269 = _1257 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1271 = _1259 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1273 = _1247 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1275 = _1261 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1277 = _1265 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1279 = _1263 * _1229;
    out.m_58.x = _1267;
    out.m_58.y = _1269;
    out.m_58.z = _1271;
    bool _1281 = _1253 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1283 = isnan(_1253);
    bool _1285 = _1281 || _1283;
    bool _1287 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1289 = _1285 || _1287;
    out.m_60.x = _1273;
    out.m_60.y = _1275;
    out.m_60.z = _1277;
    out.m_62.x = _1245;
    out.m_62.y = _1279;
    float _1291 = _1263;
    float _1293 = _1279;
    float _1295 = _1273;
    if (!_1289)
    {
        _1291 = 1.0;
    }
    float _1297 = _1291;
    bool _1299 = !_1289;
    float _1301 = _1297;
    if (!_1299)
    {
        bool _1303 = _1253 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1305 = isnan(_1253);
        bool _1307 = _1303 || _1305;
        bool _1309 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1311 = _1307 || _1309;
        if (!_1311)
        {
            float _1313 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1315 = _1253 + _1313;
            float _1317 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1319 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1317;
            float _1321 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1323 = _1321 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1325 = 1.0 / _1319;
            float _1327 = _1315 * _1325;
            float _1329 = fma(_1327, _1323, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1301 = _1329;
            _1331 = true;
        }
        else
        {
            bool _1333 = _1253 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1335 = isnan(_1253);
            bool _1337 = _1333 || _1335;
            bool _1339 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1341 = _1337 || _1339;
            if (!_1341)
            {
                float _1343 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1345 = _1253 + _1343;
                float _1347 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1349 = _1347 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1351 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1353 = _1351 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1355 = 1.0 / _1349;
                float _1357 = _1345 * _1355;
                float _1359 = fma(_1357, _1353, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1301 = _1359;
                _1331 = true;
            }
            else
            {
                _1301 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1331 = false;
    float _1361 = _1301;
    float _1363 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1365 = _1209 + _1363;
    float _1367 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1369 = _1215 + _1367;
    float _1371 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1373 = _1217 + _1371;
    float _1375 = fma(_1365, _1361, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1377 = fma(_1369, _1361, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1379 = fma(_1373, _1361, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1381 = -_785;
    float _1383 = fma(_1381, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1375);
    float _1385 = -_805;
    float _1387 = fma(_1385, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1377);
    float _1389 = -_833;
    float _1391 = fma(_1389, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1379);
    float _1393 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1395 = _1383 + _1393;
    float _1397 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1399 = _1387 + _1397;
    float _1401 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1403 = _1391 + _1401;
    float _1405 = _1395 * _1395;
    float _1407 = fma(_1399, _1399, _1405);
    float _1409 = fma(_1403, _1403, _1407);
    float _1411 = rsqrt(_1409);
    float _1413 = _1411 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1415 = _1399 * _1413;
    float _1417 = _1403 * _1413;
    float _1419 = _1415 * _1415;
    float _1421 = _1417 * _1417;
    float _1423 = _1419 + _1421;
    float _1425 = sqrt(_1423);
    bool _1427 = _1425 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1429 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1431 = _1425 + _1429;
    float _1433 = _1403;
    float _1435 = _1423;
    float _1437 = _1431;
    float _1439 = _1395;
    if (_1427)
    {
        float _1441 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1433 = _1441;
    }
    float _1443 = _1433;
    if (_1427)
    {
        float _1445 = rsqrt(_1423);
        _1435 = _1445;
    }
    float _1447 = _1435;
    float _1449 = _1447;
    if (_1427)
    {
        float _1451 = _1431 * _1443;
        _1437 = _1451;
    }
    float _1453 = _1437;
    if (_1427)
    {
        float _1455 = _1453 * 0.15915493667125701904296875;
        _1293 = _1455;
    }
    float _1457 = _1293;
    float _1459 = _1443;
    if (_1427)
    {
        float _1461 = _1457 * 6.283185482025146484375;
        float _1463 = sin(_1461);
        _1459 = _1463;
    }
    float _1465 = _1459;
    float _1467 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1469 = precise::max(0.0, _1467);
    float _1471 = _1411;
    float _1473 = _1469;
    if (_1427)
    {
        float _1475 = _1457 * 6.283185482025146484375;
        float _1477 = cos(_1475);
        _1471 = _1477;
    }
    float _1479 = _1471;
    float _1481 = -_1413;
    float _1483 = -_1469;
    float _1485 = fma(_1395, _1481, _1483);
    if (!_1427)
    {
        _1439 = _1415;
    }
    float _1487 = _1439;
    float _1489 = _1487;
    if (_1427)
    {
        float _1491 = _1485 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1473 = _1491;
    }
    float _1493 = _1473;
    float _1495 = sqrt(_1409);
    float _1497 = _1465;
    float _1499 = _1493;
    if (_1427)
    {
        float _1501 = fma(_1465, _1493, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1497 = _1501;
    }
    float _1503 = _1497;
    float _1505 = _1503;
    float _1507 = _1479;
    if (_1427)
    {
        float _1509 = _1479 + (-1.0);
        _1499 = _1509;
    }
    float _1511 = _1499;
    float _1513 = _1511;
    if (_1427)
    {
        float _1515 = _1447 * _1503;
        _1145 = _1515;
    }
    float _1517 = _1145;
    if (!_1427)
    {
        _1505 = _1485;
    }
    float _1519 = _1505;
    float _1521 = _1519;
    if (_1427)
    {
        float _1523 = _1511 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1295 = _1523;
    }
    float _1525 = _1295;
    if (_1427)
    {
        float _1527 = _1415 * _1517;
        _1489 = _1527;
    }
    float _1529 = _1489;
    if (!_1427)
    {
        _1513 = _1417;
    }
    float _1531 = _1513;
    float _1533 = _1531;
    if (_1427)
    {
        float _1535 = _1417 * _1517;
        _1533 = _1535;
    }
    float _1537 = _1533;
    if (!_1427)
    {
        _1449 = _1419;
    }
    float _1539 = _1449;
    float _1541 = _1539;
    if (_1427)
    {
        float _1543 = fma(_1485, _1479, _1525);
        _1521 = _1543;
    }
    float _1545 = _1521;
    if (_1427)
    {
        float _1547 = _1529 * _1529;
        _1541 = _1547;
    }
    float _1549 = _1541;
    if (!_1427)
    {
        _1507 = _1421;
    }
    float _1551 = _1507;
    float _1553 = _1551;
    if (_1427)
    {
        float _1555 = _1537 * _1537;
        _1553 = _1555;
    }
    float _1557 = _1553;
    float _1559 = fma(_1545, _1545, _1549);
    float _1561 = _1559 + _1557;
    float _1563 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1565 = fma(_1495, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1563);
    float _1567 = precise::clamp(_1565, 0.0, 1.0);
    float _1569 = _1383 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1571 = _1383 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1573 = rsqrt(_1561);
    float _1575 = -_1567;
    float _1577 = _1575 + 1.0;
    float _1579 = fma(_1387, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1569);
    float _1581 = fma(_1387, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1571);
    float _1583 = _1383 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1585 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1587 = fma(_1391, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1579);
    float _1589 = _1383 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1591 = fma(_1391, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1581);
    float _1593 = abs(_1577);
    float _1595 = log2(_1593);
    float _1597 = fma(_1387, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1583);
    float _1599 = fma(_1387, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1589);
    float _1601 = _1591 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1603 = _1587 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1605 = fma(_1391, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1597);
    float _1607 = fma(_1391, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1599);
    float _1609 = _1573 * _1529;
    float _1611 = _1573 * _1545;
    float _1613 = _1573 * _1537;
    float _1615 = _1607 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1617 = _1609 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1619 = _1601 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1621 = _1603 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1623 = _1605 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1625 = -_1617;
    float _1627 = fma(_1611, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1625);
    float _1629 = fma(_1615, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1619);
    float _1631 = -_1621;
    float _1633 = fma(_1631, _1585, 1.0);
    float _1635 = _1595 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1637 = -_1613;
    float _1639 = fma(_1637, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1627);
    float _1641 = fma(_1603, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1629);
    float _1643 = _1601 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1645 = exp2(_1635);
    float _1647 = fma(_1639, -0.5, 0.5);
    float _1649 = fma(_1623, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1641);
    float _1651 = _1601 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1653 = fma(_1639, 0.5, 0.5);
    float _1655 = fma(_1615, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1643);
    float _1657 = _1611 + 1.0;
    float _1659 = fma(_1615, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1651);
    float _1661 = log2(_1633);
    float _1663 = fma(_1653, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1665 = fma(_1603, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1655);
    float _1667 = fma(_1603, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1659);
    float _1669 = fma(_1653, _1663, -0.212114393711090087890625);
    float _1671 = fma(_1623, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1665);
    float _1673 = fma(_1623, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1667);
    float _1675 = 1.0 / _1649;
    float _1677 = -_1611;
    float _1679 = fma(_1645, _1657, _1677);
    float _1681 = fma(_1653, _1669, 1.570728778839111328125);
    float _1683 = fma(_1679, 0.5, 0.5);
    float _1685 = sqrt(_1647);
    float _1687 = _1661 * 0.693147182464599609375;
    float _1689 = _1687 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1691 = _1671 * _1675;
    float _1693 = _1673 * _1675;
    float _1695 = fma(_1691, 0.5, 0.5);
    float _1697 = fma(_1693, -0.5, 0.5);
    float _1699 = _1685 * 0.636619746685028076171875;
    float _1701 = -_1681;
    float _1703 = fma(_1699, _1701, 1.0);
    float3 _4617 = float3(_1695, _1697, _1689);
    float _1705 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4617, float3(0.0), isnan(_4617)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4617, float3(0.0), isnan(_4617)), level(0.0)).x;
    float3 _4628 = float3(_1695, _1697, _1689);
    float4 _1708 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4628, float3(0.0), isnan(_4628)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4628, float3(0.0), isnan(_4628)), level(0.0)).xyzw;
    float _1710 = _1708.x;
    float _1712 = _1708.y;
    float _1714 = _1708.z;
    float _1716 = _1708.w;
    float2 _4645 = float2(_1703, _1683);
    float3 _1720 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4645, float2(0.0), isnan(_4645)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4645, float2(0.0), isnan(_4645)), level(0.0)).xyz;
    float _1722 = _1720.x;
    float _1724 = _1720.y;
    float _1726 = _1720.z;
    float _1728 = -_785;
    float _1730 = fma(_1728, (*spvDescriptorSet0.vp_c9)._m0[18].w, _653);
    float _1732 = -_805;
    float _1734 = fma(_1732, (*spvDescriptorSet0.vp_c9)._m0[18].w, _655);
    float _1736 = -_833;
    float _1738 = fma(_1736, (*spvDescriptorSet0.vp_c9)._m0[18].w, _657);
    float _1740 = _1595 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1742 = _1730 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1744 = fma(_1734, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1742);
    float _1746 = _1730 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1748 = exp2(_1740);
    float _1750 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1744);
    float _1752 = fma(_1734, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1746);
    bool _1754 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1756 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1758 = _1754 || _1756;
    bool _1760 = isnan(0.5);
    bool _1762 = _1758 || _1760;
    float _1764 = _1750 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1766 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1752);
    float _1768 = _1601 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1770 = 1.0 / _1764;
    float _1772 = _1766 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1774 = fma(_1615, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1768);
    float _1776 = _1772 + _1764;
    float _1778 = fma(_1603, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1774);
    float _1780 = _1774;
    if (_1762)
    {
        _1780 = 1.0;
    }
    float _1782 = _1780;
    float _1784 = fma(_1623, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1778);
    float _1786 = _1776 * _1770;
    float _1788 = _1786 * 0.5;
    float _1790 = _1782;
    if (!_1762)
    {
        float _1792 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1794 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1796 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1794);
        float _1798 = _1792 * 0.15915493667125701904296875;
        float _1800 = _1798 * 6.283185482025146484375;
        float _1802 = cos(_1800);
        float _1804 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1806 = _1804 * 0.15915493667125701904296875;
        float _1808 = _1798 * 6.283185482025146484375;
        float _1810 = sin(_1808);
        float _1812 = 1.0 / _1802;
        float _1814 = _1806 * 6.283185482025146484375;
        float _1816 = cos(_1814);
        float _1818 = _1810 * _1812;
        float _1820 = 1.0 / _1796;
        float _1822 = _1816 * _1818;
        float _1824 = _1806 * 6.283185482025146484375;
        float _1826 = sin(_1824);
        float _1828 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1830 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1828;
        float _1832 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1834 = _1820 * _1832;
        float _1836 = 1.0 / _1822;
        float _1838 = 1.0 / _1830;
        float _1840 = _1826 * _1836;
        float _1842 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1844 = fma(_1840, _1834, _1842);
        float _1846 = _1844 * _1838;
        float _1848 = precise::clamp(_1846, 0.0, 1.0);
        float _1850 = -_1848;
        float _1852 = _1850 + 1.0;
        _1790 = _1852;
    }
    float _1854 = _1790;
    float _1856 = -_1748;
    float _1858 = _1856 + 1.0;
    float _1860 = _1649 * 0.5;
    float _1862 = _1854 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1864 = _1854 > 0.0;
    bool _1866 = isnan(_1854);
    bool _1868 = _1864 || _1866;
    bool _1870 = isnan(0.0);
    bool _1872 = _1868 || _1870;
    float _1874 = _1858 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1876 = fma(_1673, -0.5, _1860);
    float _1878 = _1862 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1880 = _1784 + _1649;
    float _1882 = _1874 * _1705;
    float _1884 = _1671 + _1649;
    out.m_64.x = _1387;
    out.m_64.y = _1383;
    out.m_64.z = _1391;
    float _1886 = _1716 * _1882;
    float _1888 = _1726 * _1882;
    float _1890 = -_1874;
    float _1892 = _1890 + 1.0;
    out.gl_Position.x = _1671;
    out.gl_Position.y = _1673;
    out.gl_Position.z = _1784;
    out.gl_Position.w = _1649;
    float _1894 = _1880 * 0.5;
    float _1896 = _1884 * 0.5;
    float _1898 = _1716 * _1892;
    out.m_47.x = _1878;
    float _1900 = fma(_1722, _1886, _1710);
    float _1902 = fma(_1724, _1886, _1712);
    float _1904 = fma(_1716, _1888, _1714);
    out.m_66.x = _1896;
    out.m_66.y = _1876;
    out.m_66.z = _1894;
    out.m_66.w = _1649;
    out.m_68.x = _1900;
    out.m_68.y = _1902;
    out.m_68.z = _1904;
    out.m_68.w = _1898;
    if (_1872)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _1906 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1906;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1331 = false;
    bool _611 = false;
    bool _461 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _82 = in.m_44.w;
    float _84 = trunc(_82);
    int _87 = int(_84);
    bool _91 = _87 >= 1;
    float _93 = 0.0;
    if (!_91)
    {
        _93 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _95 = _93;
    float _97 = _95;
    if (!_91)
    {
        out.m_47.x = 0.0;
    }
    int _99 = 0;
    if (!_91)
    {
        float _101 = _95 * 5.0;
        _99 = as_type<int>(_101);
    }
    int _103 = _99;
    int _105 = _103;
    if (!_91)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1963 = as_type<float>(_103);
        out.gl_Position.z = _1963;
    }
    if (!_91)
    {
        return out;
    }
    float _107 = in.m_49.w;
    bool _109 = _107 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _111 = isnan(_107);
    bool _113 = _109 || _111;
    bool _115 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _117 = _113 || _115;
    float _119 = -_107;
    float _121 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _123 = 0.0;
    float _125 = 0.0;
    if (_117)
    {
        float _127 = float(_87);
        _97 = _127;
    }
    float _129 = _97;
    bool _131 = _121 >= _129;
    bool _133 = !_117;
    bool _135 = _131 || _133;
    float _137 = _129;
    if (_135)
    {
        _137 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _137;
    if (_135)
    {
        out.m_47.x = 0.0;
    }
    if (_135)
    {
        float _141 = _139 * 5.0;
        _105 = as_type<int>(_141);
    }
    int _143 = _105;
    float _145 = as_type<float>(_143);
    if (_135)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2034 = as_type<float>(_143);
        out.gl_Position.z = _2034;
    }
    if (_135)
    {
        return out;
    }
    float _147 = in.m_49.x;
    float _149 = in.m_49.y;
    float _151 = in.m_49.z;
    float _153 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _155 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _157 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _159 = _155 || _157;
    bool _161 = isnan(1.0);
    bool _163 = _159 || _161;
    float _165 = _153;
    if (!_163)
    {
        float _167 = _153 * _153;
        float _169 = _167 * 0.5;
        _145 = _169;
    }
    float _171 = _145;
    float _173 = 0.0;
    float _175 = _171;
    if (!_163)
    {
        float _177 = _121 * _121;
        float _179 = _177 * 0.5;
        _173 = _179;
    }
    float _181 = _173;
    if (!_163)
    {
        float _183 = _171 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _175 = _183;
    }
    float _185 = _175;
    bool _187 = !_163;
    float _189 = _185;
    if (!_187)
    {
        float _191 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _193 = log2(_191);
        float _195 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _197 = _195 + 1.0;
        float _199 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _201 = _153 * _193;
        float _203 = 1.0 / _197;
        float _205 = _199 * 0.693147182464599609375;
        float _207 = exp2(_201);
        float _209 = 1.0 / _205;
        float _211 = _207 + (-1.0);
        float _213 = -_211;
        float _215 = fma(_213, _209, _153);
        float _217 = _215 * _203;
        float _219 = _217 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _123 = _209;
        _189 = _219;
        _125 = _207;
    }
    float _221 = _123;
    float _223 = _189;
    float _225 = _125;
    bool _227 = !_163;
    float _229 = _221;
    float _231 = _225;
    if (!_227)
    {
        float _233 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _235 = log2(_233);
        float _237 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _239 = _237 + 1.0;
        float _241 = 1.0 / _239;
        float _243 = _153 * _235;
        float _245 = exp2(_243);
        float _247 = -_245;
        float _249 = _247 + 1.0;
        float _251 = _249 * _241;
        _229 = _245;
        _231 = _239;
        _165 = _251;
    }
    float _253 = _229;
    float _255 = _231;
    float _257 = _165;
    float _259 = _255;
    float _261 = _253;
    if (!_163)
    {
        _259 = _121;
    }
    float _263 = _259;
    float _265 = _223 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _267 = _263;
    if (!_163)
    {
        float _269 = _181 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _261 = _269;
    }
    float _271 = _261;
    bool _273 = !_163;
    float _275 = _271;
    if (!_273)
    {
        float _277 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _279 = log2(_277);
        float _281 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _283 = _281 + 1.0;
        float _285 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _287 = _121 * _279;
        float _289 = 1.0 / _283;
        float _291 = _285 * 0.693147182464599609375;
        float _293 = exp2(_287);
        float _295 = 1.0 / _291;
        float _297 = _293 + (-1.0);
        float _299 = -_297;
        float _301 = fma(_299, _295, _121);
        float _303 = _301 * _289;
        float _305 = _303 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _275 = _305;
    }
    float _307 = _275;
    bool _309 = !_163;
    if (!_309)
    {
        float _311 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _313 = log2(_311);
        float _315 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _317 = _315 + 1.0;
        float _319 = 1.0 / _317;
        float _321 = _121 * _313;
        float _323 = exp2(_321);
        float _325 = -_323;
        float _327 = _325 + 1.0;
        float _329 = _327 * _319;
        _267 = _329;
    }
    float _331 = _267;
    float _333 = _307 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _335 = fma(_257, _149, _265);
    float _337 = _223 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _339 = _307 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _341 = fma(_331, _149, _333);
    float _343 = _223 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _345 = _307 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _347 = fma(_257, _147, _337);
    float _349 = fma(_331, _147, _339);
    float _351 = -_341;
    float _353 = _335 + _351;
    float _355 = fma(_257, _151, _343);
    float _357 = fma(_331, _151, _345);
    float _359 = -_349;
    float _361 = _347 + _359;
    float _363 = _353 * _353;
    float _365 = in.m_51.w;
    float _367 = -_357;
    float _369 = _355 + _367;
    float _371 = _353 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _373 = fma(_361, _361, _363);
    float _375 = _353 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _377 = _353 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _379 = fma(_361, (*spvDescriptorSet0.vp_c10)._m0[4].x, _371);
    float _381 = fma(_369, _369, _373);
    float _383 = fma(_361, (*spvDescriptorSet0.vp_c10)._m0[5].x, _375);
    float _385 = in.m_44.x;
    float _387 = in.m_44.y;
    float _389 = in.m_44.z;
    float _391 = fma(_361, (*spvDescriptorSet0.vp_c10)._m0[6].x, _377);
    float _393 = fma(_369, (*spvDescriptorSet0.vp_c10)._m0[4].z, _379);
    float _395 = sqrt(_381);
    float _397 = fma(_369, (*spvDescriptorSet0.vp_c10)._m0[5].z, _383);
    float _399 = fma(_369, (*spvDescriptorSet0.vp_c10)._m0[6].z, _391);
    bool _401 = _395 >= 9.9999999747524270787835121154785e-07;
    bool _403 = isnan(_395);
    bool _405 = _401 || _403;
    bool _407 = isnan(9.9999999747524270787835121154785e-07);
    bool _409 = _405 || _407;
    float _411 = fma(_347, _365, _385);
    float _413 = fma(_335, _365, _387);
    float _415 = fma(_355, _365, _389);
    float _417 = _397;
    float _419 = _393;
    float _421 = _399;
    if (!_409)
    {
        bool _423 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _425 = !_423;
        if (!_425)
        {
            float _427 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _429 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _431 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _433 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _427);
            float _435 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _429);
            float _437 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _431);
            float _439 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _433);
            float _441 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _435);
            float _443 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _437);
            float _445 = _439 * _439;
            float _447 = fma(_441, _441, _445);
            float _449 = fma(_443, _443, _447);
            float _451 = rsqrt(_449);
            float _453 = _451 * 9.9999999747524270787835121154785e-07;
            float _455 = _441 * _453;
            float _457 = _439 * _453;
            float _459 = _443 * _453;
            _417 = _457;
            _419 = _455;
            _421 = _459;
            _461 = true;
        }
        else
        {
            float _463 = _149 * _149;
            float _465 = fma(_147, _147, _463);
            float _467 = fma(_151, _151, _465);
            float _469 = sqrt(_467);
            bool _471 = _469 >= 9.9999999747524270787835121154785e-07;
            bool _473 = isnan(_469);
            bool _475 = _471 || _473;
            bool _477 = isnan(9.9999999747524270787835121154785e-07);
            bool _479 = _475 || _477;
            if (!_479)
            {
                float _481 = _387 * _387;
                float _483 = fma(_385, _385, _481);
                float _485 = fma(_389, _389, _483);
                float _487 = sqrt(_485);
                bool _489 = _487 >= 9.9999999747524270787835121154785e-07;
                bool _491 = isnan(_487);
                bool _493 = _489 || _491;
                bool _495 = isnan(9.9999999747524270787835121154785e-07);
                bool _497 = _493 || _495;
                if (!_497)
                {
                    float _499 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _501 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _499);
                    float _503 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _501);
                    float _505 = rsqrt(_503);
                    float _507 = _505 * 9.9999999747524270787835121154785e-07;
                    float _509 = _507 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _511 = _507 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _513 = _507 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _417 = _511;
                    _419 = _509;
                    _421 = _513;
                    _461 = true;
                }
                else
                {
                    float _515 = _387 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _517 = _387 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _519 = _387 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _521 = fma(_385, (*spvDescriptorSet0.vp_c10)._m0[5].x, _515);
                    float _523 = fma(_385, (*spvDescriptorSet0.vp_c10)._m0[4].x, _517);
                    float _525 = fma(_385, (*spvDescriptorSet0.vp_c10)._m0[6].x, _519);
                    float _527 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[5].z, _521);
                    float _529 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[4].z, _523);
                    float _531 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[6].z, _525);
                    float _533 = _527 * _527;
                    float _535 = fma(_529, _529, _533);
                    float _537 = fma(_531, _531, _535);
                    float _539 = rsqrt(_537);
                    float _541 = _539 * 9.9999999747524270787835121154785e-07;
                    float _543 = _529 * _541;
                    float _545 = _527 * _541;
                    float _547 = _531 * _541;
                    _417 = _545;
                    _419 = _543;
                    _421 = _547;
                    _461 = true;
                }
            }
            else
            {
                float _549 = _149 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _551 = _149 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _553 = _149 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _555 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[5].x, _549);
                float _557 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[4].x, _551);
                float _559 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[6].x, _553);
                float _561 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[5].z, _555);
                float _563 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[4].z, _557);
                float _565 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[6].z, _559);
                float _567 = _561 * _561;
                float _569 = fma(_563, _563, _567);
                float _571 = fma(_565, _565, _569);
                float _573 = rsqrt(_571);
                float _575 = _573 * 9.9999999747524270787835121154785e-07;
                float _577 = _563 * _575;
                float _579 = _561 * _575;
                float _581 = _565 * _575;
                _417 = _579;
                _419 = _577;
                _421 = _581;
            }
        }
    }
    _461 = false;
    float _583 = _417;
    float _585 = _419;
    float _587 = _421;
    bool _589 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _591 = !_589;
    float _609;
    if (!_591)
    {
        float _593 = in.m_53.x;
        float _595 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _597 = _593 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _599 = fma(_597, (*spvDescriptorSet0.vp_c9)._m0[12].x, _121);
        float _601 = _599 * _595;
        float _603 = floor(_601);
        float _605 = -_603;
        float _607 = _601 + _605;
        _609 = _607;
        _611 = true;
    }
    else
    {
        float _613 = float(_87);
        float _615 = 1.0 / _613;
        float _617 = _121 * _615;
        _609 = _617;
    }
    _611 = false;
    float _619 = _609;
    float _621 = _413 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _623 = _413 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _625 = _413 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _627 = as_type<float>(int(gl_VertexIndex));
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _631 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _629;
    float _633 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _635 = _633 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _637 = fma(_411, (*spvDescriptorSet0.vp_c10)._m0[5].x, _621);
    float _639 = fma(_411, (*spvDescriptorSet0.vp_c10)._m0[4].x, _623);
    float _641 = fma(_411, (*spvDescriptorSet0.vp_c10)._m0[6].x, _625);
    float _643 = 1.0 / _635;
    float _645 = fma(_415, (*spvDescriptorSet0.vp_c10)._m0[5].z, _637);
    float _647 = fma(_415, (*spvDescriptorSet0.vp_c10)._m0[4].z, _639);
    float _649 = fma(_415, (*spvDescriptorSet0.vp_c10)._m0[6].z, _641);
    float _651 = _583 * _583;
    float _653 = _645 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _655 = _647 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _657 = _649 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _659 = 1.0 / _631;
    float _661 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _663 = _653 + _661;
    float _665 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _667 = _619 + _665;
    float _669 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _671 = _655 + _669;
    float _673 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _675 = _657 + _673;
    float _677 = _663 * _663;
    float _679 = 0.0 + (*spvDescriptorSet0.vp_c7)._m0[0].x;
    float _681 = precise::clamp(_679, 0.0, 1.0);
    float _683 = _667 * _643;
    float _685 = fma(_671, _671, _677);
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _689 = _619 + _687;
    bool _691 = _619 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _693 = isnan(_619);
    bool _695 = _691 || _693;
    bool _697 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _699 = _695 || _697;
    float _701 = float(_699);
    bool _703 = _619 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _705 = isnan(_619);
    bool _707 = _703 || _705;
    bool _709 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _711 = _707 || _709;
    float _713 = float(_711);
    float _715 = fma(_675, _675, _685);
    bool _717 = _619 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _719 = isnan(_619);
    bool _721 = _717 || _719;
    bool _723 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _725 = _721 || _723;
    float _727 = float(_725);
    float _729 = fma(_585, _585, _651);
    float _731 = _689 * _659;
    float _733 = -_727;
    float _735 = _733 + 1.0;
    float _737 = fma(_587, _587, _729);
    float _739 = rsqrt(_715);
    float _741 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _743 = _741 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _745 = _713 * _735;
    float _747 = -_713;
    float _749 = _747 + 1.0;
    float _751 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _753 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _751;
    float _755 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _757 = _755 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _759 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _761 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _759;
    float _763 = fma(_743, _683, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _765 = rsqrt(_737);
    float _767 = fma(_681, -0.64999997615814208984375, 1.0);
    float _769 = fma(_753, _731, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _771 = _701 * _749;
    float _773 = fma(_757, _683, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _775 = fma(_761, _731, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    int _777 = as_type<int>(_627) & 1;
    bool _779 = _777 != 0;
    int _781 = as_type<int>(_627) & 2;
    bool _783 = _781 != 0;
    float _785 = _663 * _739;
    float _787 = _769 * _771;
    float _789 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _791 = (*spvDescriptorSet0.vp_c10)._m0[9].w + _789;
    float _793 = -_785;
    float _795 = fma(_793, (*spvDescriptorSet0.vp_c9)._m0[18].w, _663);
    float _797 = _775 * _771;
    float _799 = -_701;
    float _801 = _799 + 1.0;
    float _803 = _765 * _585;
    float _805 = _671 * _739;
    float _807 = _795 * _795;
    float _809 = _765 * _587;
    float _811 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _813 = (*spvDescriptorSet0.vp_c10)._m0[8].w + _811;
    float _815 = -_805;
    float _817 = fma(_815, (*spvDescriptorSet0.vp_c9)._m0[18].w, _671);
    float _819 = _791 * _791;
    float _821 = _765 * _583;
    float _823 = fma(_801, (*spvDescriptorSet0.vp_c9)._m0[143].x, _787);
    float _825 = fma(_801, (*spvDescriptorSet0.vp_c9)._m0[143].y, _797);
    float _827 = fma(_817, _817, _807);
    float _829 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _831 = _809 * _829;
    float _833 = _675 * _739;
    float _835 = in.m_51.x;
    float _837 = in.m_51.y;
    float _839 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _841 = (*spvDescriptorSet0.vp_c10)._m0[10].w + _839;
    float _843 = fma(_813, _813, _819);
    float _845 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _847 = _821 * _845;
    float _849 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _851 = -_831;
    float _853 = fma(_803, _849, _851);
    float _855 = -_833;
    float _857 = fma(_855, (*spvDescriptorSet0.vp_c9)._m0[18].w, _675);
    float _859 = fma(_841, _841, _843);
    float _861 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _863 = _803 * _861;
    float _865 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _867 = -_847;
    float _869 = fma(_809, _865, _867);
    float _871 = _853 * _853;
    float _873 = fma(_857, _857, _827);
    float _875 = rsqrt(_859);
    float _877 = fma(_763, _745, _823);
    float _879 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _881 = -_863;
    float _883 = fma(_821, _879, _881);
    float _885 = fma(_869, _869, _871);
    float _887 = fma(_773, _745, _825);
    float _889 = fma(_727, (*spvDescriptorSet0.vp_c9)._m0[145].x, _877);
    float _891 = fma(_883, _883, _885);
    float _893 = sqrt(_873);
    float _895 = fma(_727, (*spvDescriptorSet0.vp_c9)._m0[145].y, _887);
    float _897 = _895 * _837;
    float _899 = _889 * _835;
    float _901 = rsqrt(_891);
    float _903 = _875 * (-0.20000000298023223876953125);
    float _905 = _897 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _907 = _899 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _909 = !_783;
    float _911 = _909 ? (-0.5) : 0.5;
    float _913 = fma(_791, _903, (*spvDescriptorSet0.vp_c10)._m0[9].w);
    bool _915 = !_779;
    float _917 = _915 ? (-0.5) : 0.5;
    float _919 = sqrt(_859);
    float _921 = _739 * _893;
    float _923 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _911);
    float _925 = fma(_841, _903, (*spvDescriptorSet0.vp_c10)._m0[10].w);
    float _927 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _917);
    float _929 = _905 * _921;
    float _931 = _907 * _921;
    float _933 = fma(_813, _903, (*spvDescriptorSet0.vp_c10)._m0[8].w);
    float _935 = _869 * _901;
    float _937 = _929 * _923;
    float _939 = _853 * _901;
    float _941 = _883 * _901;
    float _943 = _931 * _927;
    float _945 = _809 * _935;
    float _947 = _937 * _821;
    float _949 = _821 * _941;
    float _951 = _919 * 0.066666670143604278564453125;
    float _953 = -_945;
    float _955 = fma(_803, _941, _953);
    float _957 = _921 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _959 = _957 * 0.5;
    float _961 = _937 * _803;
    float _963 = fma(_943, _939, _947);
    float _965 = precise::max(_951, 1.0);
    float _967 = _803 * _939;
    float _969 = -_949;
    float _971 = fma(_809, _939, _969);
    float _973 = _937 * _809;
    float _975 = fma(_943, _935, _961);
    float _977 = fma(_959, _955, _963);
    float _979 = precise::min(_965, 2.0);
    float _981 = -_967;
    float _983 = fma(_821, _935, _981);
    float _985 = fma(_943, _941, _973);
    float _987 = fma(_959, _971, _975);
    float _989 = _653 + _977;
    float _991 = -_913;
    float _993 = _991 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _995 = _979 * _767;
    float _997 = _655 + _987;
    float _999 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1001 = _989 + _999;
    float _1003 = fma(_959, _983, _985);
    float _1005 = _993 * _993;
    float _1007 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1009 = _997 + _1007;
    float _1011 = fma(_1001, _995, (*spvDescriptorSet0.vp_c10)._m0[9].w);
    float _1013 = _657 + _1003;
    float _1015 = -_933;
    float _1017 = _1015 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1019 = fma(_1009, _995, (*spvDescriptorSet0.vp_c10)._m0[8].w);
    float _1021 = -_1011;
    float _1023 = _1021 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1025 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1027 = _1013 + _1025;
    float _1029 = fma(_1017, _1017, _1005);
    float _1031 = -_925;
    float _1033 = _1031 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1035 = -_1019;
    float _1037 = _1035 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1039 = _1023 * _1023;
    float _1041 = fma(_1027, _995, (*spvDescriptorSet0.vp_c10)._m0[10].w);
    float _1043 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1045 = _913 + _1043;
    float _1047 = fma(_1033, _1033, _1029);
    float _1049 = fma(_1037, _1037, _1039);
    float _1051 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1053 = _933 + _1051;
    float _1055 = -_1041;
    float _1057 = _1055 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1059 = _1045 * _1045;
    float _1061 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1063 = _925 + _1061;
    float _1065 = sqrt(_1047);
    float _1067 = fma(_1057, _1057, _1049);
    float _1069 = fma(_1053, _1053, _1059);
    float _1071 = fma(_1063, _1063, _1069);
    int _1073 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1075 = _1073 != 0;
    float _1077 = sqrt(_1067);
    float _1079 = rsqrt(_1071);
    float _1081 = -_1065;
    float _1083 = _1077 + _1081;
    float _1085 = _1079 * _1083;
    float _1087 = -_1085;
    float _1089 = fma(_1053, _1087, _1019);
    float _1091 = -_1085;
    float _1093 = fma(_1063, _1091, _1041);
    float _1095 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1097 = in.m_53.x;
    float _1099 = in.m_53.y;
    float _1101 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1103 = _1089 + _1101;
    float _1105 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1107 = _1093 + _1105;
    float _1109 = _1103 * _1103;
    float _1111 = _1107 * _1107;
    float _1113 = _1109 + _1111;
    float _1115 = sqrt(_1113);
    bool _1117 = _1097 > 0.5;
    float _1119 = -_917;
    float _1121 = _1117 ? _1119 : _917;
    bool _1123 = _1115 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _1125 = _1099 > 0.5;
    float _1127 = -_1085;
    float _1129 = fma(_1045, _1127, _1011);
    bool _1131 = !_1075;
    float _1133 = _1131 ? _917 : _1121;
    float _1135 = _1121;
    float _1137 = _1045;
    float _1139 = _1093;
    float _1141 = _1109;
    float _1143 = _1111;
    float _1145 = _1107;
    if (!_1123)
    {
        _1135 = _1093;
    }
    float _1147 = _1135;
    float _1149 = _1147;
    if (!_1123)
    {
        _1137 = _1089;
    }
    float _1151 = _1137;
    float _1153 = _1151;
    if (!_1123)
    {
        _1139 = _1129;
    }
    float _1155 = _1139;
    bool _1157 = !_1123;
    float _1159 = _1155;
    if (!_1157)
    {
        float _1161 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1163 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1165 = _1115 + _1163;
        float _1167 = rsqrt(_1113);
        float _1169 = _1165 * _1161;
        float _1171 = _1129 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1173 = _1169 * 0.15915493667125701904296875;
        float _1175 = _1173 * 6.283185482025146484375;
        float _1177 = sin(_1175);
        float _1179 = _1173 * 6.283185482025146484375;
        float _1181 = cos(_1179);
        float _1183 = fma(_1177, _1171, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1185 = _1167 * _1183;
        float _1187 = _1181 + (-1.0);
        float _1189 = fma(_1103, _1185, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1191 = fma(_1107, _1185, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1193 = _1187 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1195 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1197 = _1189 + _1195;
        float _1199 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1201 = _1191 + _1199;
        float _1203 = fma(_1129, _1181, _1193);
        float _1205 = _1197 * _1197;
        float _1207 = _1201 * _1201;
        _1159 = _1203;
        _1141 = _1205;
        _1143 = _1207;
        _1153 = _1189;
        _1149 = _1191;
    }
    float _1209 = _1159;
    float _1211 = _1141;
    float _1213 = _1143;
    float _1215 = _1153;
    float _1217 = _1149;
    float _1219 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1221 = _1209 + _1219;
    float _1223 = _1133 + 0.5;
    int _1225 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1227 = _1225 != 0;
    float _1229 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1231 = -_911;
    int _1233 = _1125 ? as_type<int>(_1231) : as_type<int>(_911);
    float _1235 = fma(_1221, _1221, _1211);
    float _1237 = _1223 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1239 = !_1227;
    float _1241 = _1239 ? _911 : as_type<float>(_1233);
    float _1243 = _1235 + _1213;
    float _1245 = _1237 * _1095;
    float _1247 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1249 = -_1241;
    float _1251 = _1249 + 0.5;
    float _1253 = sqrt(_1243);
    float _1255 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1257 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1259 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1261 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1263 = _1251 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1265 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1267 = _1255 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1269 = _1257 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1271 = _1259 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1273 = _1247 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1275 = _1261 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1277 = _1265 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1279 = _1263 * _1229;
    out.m_58.x = _1267;
    out.m_58.y = _1269;
    out.m_58.z = _1271;
    bool _1281 = _1253 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1283 = isnan(_1253);
    bool _1285 = _1281 || _1283;
    bool _1287 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1289 = _1285 || _1287;
    out.m_60.x = _1273;
    out.m_60.y = _1275;
    out.m_60.z = _1277;
    out.m_62.x = _1245;
    out.m_62.y = _1279;
    float _1291 = _1263;
    float _1293 = _1279;
    float _1295 = _1273;
    if (!_1289)
    {
        _1291 = 1.0;
    }
    float _1297 = _1291;
    bool _1299 = !_1289;
    float _1301 = _1297;
    if (!_1299)
    {
        bool _1303 = _1253 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1305 = isnan(_1253);
        bool _1307 = _1303 || _1305;
        bool _1309 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1311 = _1307 || _1309;
        if (!_1311)
        {
            float _1313 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1315 = _1253 + _1313;
            float _1317 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1319 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1317;
            float _1321 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1323 = _1321 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1325 = 1.0 / _1319;
            float _1327 = _1315 * _1325;
            float _1329 = fma(_1327, _1323, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1301 = _1329;
            _1331 = true;
        }
        else
        {
            bool _1333 = _1253 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1335 = isnan(_1253);
            bool _1337 = _1333 || _1335;
            bool _1339 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1341 = _1337 || _1339;
            if (!_1341)
            {
                float _1343 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1345 = _1253 + _1343;
                float _1347 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1349 = _1347 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1351 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1353 = _1351 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1355 = 1.0 / _1349;
                float _1357 = _1345 * _1355;
                float _1359 = fma(_1357, _1353, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1301 = _1359;
                _1331 = true;
            }
            else
            {
                _1301 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1331 = false;
    float _1361 = _1301;
    float _1363 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1365 = _1209 + _1363;
    float _1367 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1369 = _1215 + _1367;
    float _1371 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1373 = _1217 + _1371;
    float _1375 = fma(_1365, _1361, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1377 = fma(_1369, _1361, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1379 = fma(_1373, _1361, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1381 = -_785;
    float _1383 = fma(_1381, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1375);
    float _1385 = -_805;
    float _1387 = fma(_1385, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1377);
    float _1389 = -_833;
    float _1391 = fma(_1389, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1379);
    float _1393 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1395 = _1383 + _1393;
    float _1397 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1399 = _1387 + _1397;
    float _1401 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1403 = _1391 + _1401;
    float _1405 = _1395 * _1395;
    float _1407 = fma(_1399, _1399, _1405);
    float _1409 = fma(_1403, _1403, _1407);
    float _1411 = rsqrt(_1409);
    float _1413 = _1411 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1415 = _1399 * _1413;
    float _1417 = _1403 * _1413;
    float _1419 = _1415 * _1415;
    float _1421 = _1417 * _1417;
    float _1423 = _1419 + _1421;
    float _1425 = sqrt(_1423);
    bool _1427 = _1425 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1429 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1431 = _1425 + _1429;
    float _1433 = _1403;
    float _1435 = _1423;
    float _1437 = _1431;
    float _1439 = _1395;
    if (_1427)
    {
        float _1441 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1433 = _1441;
    }
    float _1443 = _1433;
    if (_1427)
    {
        float _1445 = rsqrt(_1423);
        _1435 = _1445;
    }
    float _1447 = _1435;
    float _1449 = _1447;
    if (_1427)
    {
        float _1451 = _1431 * _1443;
        _1437 = _1451;
    }
    float _1453 = _1437;
    if (_1427)
    {
        float _1455 = _1453 * 0.15915493667125701904296875;
        _1293 = _1455;
    }
    float _1457 = _1293;
    float _1459 = _1443;
    if (_1427)
    {
        float _1461 = _1457 * 6.283185482025146484375;
        float _1463 = sin(_1461);
        _1459 = _1463;
    }
    float _1465 = _1459;
    float _1467 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1469 = precise::max(0.0, _1467);
    float _1471 = _1411;
    float _1473 = _1469;
    if (_1427)
    {
        float _1475 = _1457 * 6.283185482025146484375;
        float _1477 = cos(_1475);
        _1471 = _1477;
    }
    float _1479 = _1471;
    float _1481 = -_1413;
    float _1483 = -_1469;
    float _1485 = fma(_1395, _1481, _1483);
    if (!_1427)
    {
        _1439 = _1415;
    }
    float _1487 = _1439;
    float _1489 = _1487;
    if (_1427)
    {
        float _1491 = _1485 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1473 = _1491;
    }
    float _1493 = _1473;
    float _1495 = sqrt(_1409);
    float _1497 = _1465;
    float _1499 = _1493;
    if (_1427)
    {
        float _1501 = fma(_1465, _1493, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1497 = _1501;
    }
    float _1503 = _1497;
    float _1505 = _1503;
    float _1507 = _1479;
    if (_1427)
    {
        float _1509 = _1479 + (-1.0);
        _1499 = _1509;
    }
    float _1511 = _1499;
    float _1513 = _1511;
    if (_1427)
    {
        float _1515 = _1447 * _1503;
        _1145 = _1515;
    }
    float _1517 = _1145;
    if (!_1427)
    {
        _1505 = _1485;
    }
    float _1519 = _1505;
    float _1521 = _1519;
    if (_1427)
    {
        float _1523 = _1511 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1295 = _1523;
    }
    float _1525 = _1295;
    if (_1427)
    {
        float _1527 = _1415 * _1517;
        _1489 = _1527;
    }
    float _1529 = _1489;
    if (!_1427)
    {
        _1513 = _1417;
    }
    float _1531 = _1513;
    float _1533 = _1531;
    if (_1427)
    {
        float _1535 = _1417 * _1517;
        _1533 = _1535;
    }
    float _1537 = _1533;
    if (!_1427)
    {
        _1449 = _1419;
    }
    float _1539 = _1449;
    float _1541 = _1539;
    if (_1427)
    {
        float _1543 = fma(_1485, _1479, _1525);
        _1521 = _1543;
    }
    float _1545 = _1521;
    if (_1427)
    {
        float _1547 = _1529 * _1529;
        _1541 = _1547;
    }
    float _1549 = _1541;
    if (!_1427)
    {
        _1507 = _1421;
    }
    float _1551 = _1507;
    float _1553 = _1551;
    if (_1427)
    {
        float _1555 = _1537 * _1537;
        _1553 = _1555;
    }
    float _1557 = _1553;
    float _1559 = fma(_1545, _1545, _1549);
    float _1561 = _1559 + _1557;
    float _1563 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1565 = fma(_1495, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1563);
    float _1567 = precise::clamp(_1565, 0.0, 1.0);
    float _1569 = _1383 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1571 = _1383 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1573 = rsqrt(_1561);
    float _1575 = -_1567;
    float _1577 = _1575 + 1.0;
    float _1579 = fma(_1387, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1569);
    float _1581 = fma(_1387, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1571);
    float _1583 = _1383 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1585 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1587 = fma(_1391, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1579);
    float _1589 = _1383 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1591 = fma(_1391, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1581);
    float _1593 = abs(_1577);
    float _1595 = log2(_1593);
    float _1597 = fma(_1387, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1583);
    float _1599 = fma(_1387, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1589);
    float _1601 = _1591 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1603 = _1587 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1605 = fma(_1391, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1597);
    float _1607 = fma(_1391, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1599);
    float _1609 = _1573 * _1529;
    float _1611 = _1573 * _1545;
    float _1613 = _1573 * _1537;
    float _1615 = _1607 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1617 = _1609 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1619 = _1601 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1621 = _1603 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1623 = _1605 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1625 = -_1617;
    float _1627 = fma(_1611, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1625);
    float _1629 = fma(_1615, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1619);
    float _1631 = -_1621;
    float _1633 = fma(_1631, _1585, 1.0);
    float _1635 = _1595 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1637 = -_1613;
    float _1639 = fma(_1637, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1627);
    float _1641 = fma(_1603, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1629);
    float _1643 = _1601 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1645 = exp2(_1635);
    float _1647 = fma(_1639, -0.5, 0.5);
    float _1649 = fma(_1623, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1641);
    float _1651 = _1601 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1653 = fma(_1639, 0.5, 0.5);
    float _1655 = fma(_1615, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1643);
    float _1657 = _1611 + 1.0;
    float _1659 = fma(_1615, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1651);
    float _1661 = log2(_1633);
    float _1663 = fma(_1653, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1665 = fma(_1603, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1655);
    float _1667 = fma(_1603, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1659);
    float _1669 = fma(_1653, _1663, -0.212114393711090087890625);
    float _1671 = fma(_1623, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1665);
    float _1673 = fma(_1623, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1667);
    float _1675 = 1.0 / _1649;
    float _1677 = -_1611;
    float _1679 = fma(_1645, _1657, _1677);
    float _1681 = fma(_1653, _1669, 1.570728778839111328125);
    float _1683 = fma(_1679, 0.5, 0.5);
    float _1685 = sqrt(_1647);
    float _1687 = _1661 * 0.693147182464599609375;
    float _1689 = _1687 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1691 = _1671 * _1675;
    float _1693 = _1673 * _1675;
    float _1695 = fma(_1691, 0.5, 0.5);
    float _1697 = fma(_1693, -0.5, 0.5);
    float _1699 = _1685 * 0.636619746685028076171875;
    float _1701 = -_1681;
    float _1703 = fma(_1699, _1701, 1.0);
    float3 _4617 = float3(_1695, _1697, _1689);
    float _1705 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4617, float3(0.0), isnan(_4617)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4617, float3(0.0), isnan(_4617)), level(0.0)).x;
    float3 _4628 = float3(_1695, _1697, _1689);
    float4 _1708 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4628, float3(0.0), isnan(_4628)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4628, float3(0.0), isnan(_4628)), level(0.0)).xyzw;
    float _1710 = _1708.x;
    float _1712 = _1708.y;
    float _1714 = _1708.z;
    float _1716 = _1708.w;
    float2 _4645 = float2(_1703, _1683);
    float3 _1720 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4645, float2(0.0), isnan(_4645)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4645, float2(0.0), isnan(_4645)), level(0.0)).xyz;
    float _1722 = _1720.x;
    float _1724 = _1720.y;
    float _1726 = _1720.z;
    float _1728 = -_785;
    float _1730 = fma(_1728, (*spvDescriptorSet0.vp_c9)._m0[18].w, _653);
    float _1732 = -_805;
    float _1734 = fma(_1732, (*spvDescriptorSet0.vp_c9)._m0[18].w, _655);
    float _1736 = -_833;
    float _1738 = fma(_1736, (*spvDescriptorSet0.vp_c9)._m0[18].w, _657);
    float _1740 = _1595 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1742 = _1730 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1744 = fma(_1734, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1742);
    float _1746 = _1730 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1748 = exp2(_1740);
    float _1750 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1744);
    float _1752 = fma(_1734, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1746);
    bool _1754 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1756 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1758 = _1754 || _1756;
    bool _1760 = isnan(0.5);
    bool _1762 = _1758 || _1760;
    float _1764 = _1750 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1766 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1752);
    float _1768 = _1601 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1770 = 1.0 / _1764;
    float _1772 = _1766 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1774 = fma(_1615, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1768);
    float _1776 = _1772 + _1764;
    float _1778 = fma(_1603, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1774);
    float _1780 = _1774;
    if (_1762)
    {
        _1780 = 1.0;
    }
    float _1782 = _1780;
    float _1784 = fma(_1623, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1778);
    float _1786 = _1776 * _1770;
    float _1788 = _1786 * 0.5;
    float _1790 = _1782;
    if (!_1762)
    {
        float _1792 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1794 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1796 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1794);
        float _1798 = _1792 * 0.15915493667125701904296875;
        float _1800 = _1798 * 6.283185482025146484375;
        float _1802 = cos(_1800);
        float _1804 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1806 = _1804 * 0.15915493667125701904296875;
        float _1808 = _1798 * 6.283185482025146484375;
        float _1810 = sin(_1808);
        float _1812 = 1.0 / _1802;
        float _1814 = _1806 * 6.283185482025146484375;
        float _1816 = cos(_1814);
        float _1818 = _1810 * _1812;
        float _1820 = 1.0 / _1796;
        float _1822 = _1816 * _1818;
        float _1824 = _1806 * 6.283185482025146484375;
        float _1826 = sin(_1824);
        float _1828 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1830 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1828;
        float _1832 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1834 = _1820 * _1832;
        float _1836 = 1.0 / _1822;
        float _1838 = 1.0 / _1830;
        float _1840 = _1826 * _1836;
        float _1842 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1844 = fma(_1840, _1834, _1842);
        float _1846 = _1844 * _1838;
        float _1848 = precise::clamp(_1846, 0.0, 1.0);
        float _1850 = -_1848;
        float _1852 = _1850 + 1.0;
        _1790 = _1852;
    }
    float _1854 = _1790;
    float _1856 = -_1748;
    float _1858 = _1856 + 1.0;
    float _1860 = _1649 * 0.5;
    float _1862 = _1854 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1864 = _1854 > 0.0;
    bool _1866 = isnan(_1854);
    bool _1868 = _1864 || _1866;
    bool _1870 = isnan(0.0);
    bool _1872 = _1868 || _1870;
    float _1874 = _1858 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1876 = fma(_1673, -0.5, _1860);
    float _1878 = _1862 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1880 = _1784 + _1649;
    float _1882 = _1874 * _1705;
    float _1884 = _1671 + _1649;
    out.m_64.x = _1387;
    out.m_64.y = _1383;
    out.m_64.z = _1391;
    float _1886 = _1716 * _1882;
    float _1888 = _1726 * _1882;
    float _1890 = -_1874;
    float _1892 = _1890 + 1.0;
    out.gl_Position.x = _1671;
    out.gl_Position.y = _1673;
    out.gl_Position.z = _1784;
    out.gl_Position.w = _1649;
    float _1894 = _1880 * 0.5;
    float _1896 = _1884 * 0.5;
    float _1898 = _1716 * _1892;
    out.m_47.x = _1878;
    float _1900 = fma(_1722, _1886, _1710);
    float _1902 = fma(_1724, _1886, _1712);
    float _1904 = fma(_1716, _1888, _1714);
    out.m_66.x = _1896;
    out.m_66.y = _1876;
    out.m_66.z = _1894;
    out.m_66.w = _1649;
    out.m_68.x = _1900;
    out.m_68.y = _1902;
    out.m_68.z = _1904;
    out.m_68.w = _1898;
    if (_1872)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _1906 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1906;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint dm_vid = gl_VertexIndex;
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1331 = false;
    bool _611 = false;
    bool _461 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _82 = in.m_44.w;
    float _84 = trunc(_82);
    int _87 = int(_84);
    bool _91 = _87 >= 1;
    float _93 = 0.0;
    if (!_91)
    {
        _93 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _95 = _93;
    float _97 = _95;
    if (!_91)
    {
        out.m_47.x = 0.0;
    }
    int _99 = 0;
    if (!_91)
    {
        float _101 = _95 * 5.0;
        _99 = as_type<int>(_101);
    }
    int _103 = _99;
    int _105 = _103;
    if (!_91)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1963 = as_type<float>(_103);
        out.gl_Position.z = _1963;
    }
    if (!_91)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _107 = in.m_49.w;
    bool _109 = _107 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _111 = isnan(_107);
    bool _113 = _109 || _111;
    bool _115 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _117 = _113 || _115;
    float _119 = -_107;
    float _121 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _123 = 0.0;
    float _125 = 0.0;
    if (_117)
    {
        float _127 = float(_87);
        _97 = _127;
    }
    float _129 = _97;
    bool _131 = _121 >= _129;
    bool _133 = !_117;
    bool _135 = _131 || _133;
    float _137 = _129;
    if (_135)
    {
        _137 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _137;
    if (_135)
    {
        out.m_47.x = 0.0;
    }
    if (_135)
    {
        float _141 = _139 * 5.0;
        _105 = as_type<int>(_141);
    }
    int _143 = _105;
    float _145 = as_type<float>(_143);
    if (_135)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2034 = as_type<float>(_143);
        out.gl_Position.z = _2034;
    }
    if (_135)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _147 = in.m_49.x;
    float _149 = in.m_49.y;
    float _151 = in.m_49.z;
    float _153 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _155 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _157 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _159 = _155 || _157;
    bool _161 = isnan(1.0);
    bool _163 = _159 || _161;
    float _165 = _153;
    if (!_163)
    {
        float _167 = _153 * _153;
        float _169 = _167 * 0.5;
        _145 = _169;
    }
    float _171 = _145;
    float _173 = 0.0;
    float _175 = _171;
    if (!_163)
    {
        float _177 = _121 * _121;
        float _179 = _177 * 0.5;
        _173 = _179;
    }
    float _181 = _173;
    if (!_163)
    {
        float _183 = _171 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _175 = _183;
    }
    float _185 = _175;
    bool _187 = !_163;
    float _189 = _185;
    if (!_187)
    {
        float _191 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _193 = log2(_191);
        float _195 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _197 = _195 + 1.0;
        float _199 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _201 = _153 * _193;
        float _203 = 1.0 / _197;
        float _205 = _199 * 0.693147182464599609375;
        float _207 = exp2(_201);
        float _209 = 1.0 / _205;
        float _211 = _207 + (-1.0);
        float _213 = -_211;
        float _215 = fma(_213, _209, _153);
        float _217 = _215 * _203;
        float _219 = _217 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _123 = _209;
        _189 = _219;
        _125 = _207;
    }
    float _221 = _123;
    float _223 = _189;
    float _225 = _125;
    bool _227 = !_163;
    float _229 = _221;
    float _231 = _225;
    if (!_227)
    {
        float _233 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _235 = log2(_233);
        float _237 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _239 = _237 + 1.0;
        float _241 = 1.0 / _239;
        float _243 = _153 * _235;
        float _245 = exp2(_243);
        float _247 = -_245;
        float _249 = _247 + 1.0;
        float _251 = _249 * _241;
        _229 = _245;
        _231 = _239;
        _165 = _251;
    }
    float _253 = _229;
    float _255 = _231;
    float _257 = _165;
    float _259 = _255;
    float _261 = _253;
    if (!_163)
    {
        _259 = _121;
    }
    float _263 = _259;
    float _265 = _223 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _267 = _263;
    if (!_163)
    {
        float _269 = _181 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _261 = _269;
    }
    float _271 = _261;
    bool _273 = !_163;
    float _275 = _271;
    if (!_273)
    {
        float _277 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _279 = log2(_277);
        float _281 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _283 = _281 + 1.0;
        float _285 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _287 = _121 * _279;
        float _289 = 1.0 / _283;
        float _291 = _285 * 0.693147182464599609375;
        float _293 = exp2(_287);
        float _295 = 1.0 / _291;
        float _297 = _293 + (-1.0);
        float _299 = -_297;
        float _301 = fma(_299, _295, _121);
        float _303 = _301 * _289;
        float _305 = _303 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _275 = _305;
    }
    float _307 = _275;
    bool _309 = !_163;
    if (!_309)
    {
        float _311 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _313 = log2(_311);
        float _315 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _317 = _315 + 1.0;
        float _319 = 1.0 / _317;
        float _321 = _121 * _313;
        float _323 = exp2(_321);
        float _325 = -_323;
        float _327 = _325 + 1.0;
        float _329 = _327 * _319;
        _267 = _329;
    }
    float _331 = _267;
    float _333 = _307 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _335 = fma(_257, _149, _265);
    float _337 = _223 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _339 = _307 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _341 = fma(_331, _149, _333);
    float _343 = _223 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _345 = _307 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _347 = fma(_257, _147, _337);
    float _349 = fma(_331, _147, _339);
    float _351 = -_341;
    float _353 = _335 + _351;
    float _355 = fma(_257, _151, _343);
    float _357 = fma(_331, _151, _345);
    float _359 = -_349;
    float _361 = _347 + _359;
    float _363 = _353 * _353;
    float _365 = in.m_51.w;
    float _367 = -_357;
    float _369 = _355 + _367;
    float _371 = _353 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _373 = fma(_361, _361, _363);
    float _375 = _353 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _377 = _353 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _379 = fma(_361, (*spvDescriptorSet0.vp_c10)._m0[4].x, _371);
    float _381 = fma(_369, _369, _373);
    float _383 = fma(_361, (*spvDescriptorSet0.vp_c10)._m0[5].x, _375);
    float _385 = in.m_44.x;
    float _387 = in.m_44.y;
    float _389 = in.m_44.z;
    float _391 = fma(_361, (*spvDescriptorSet0.vp_c10)._m0[6].x, _377);
    float _393 = fma(_369, (*spvDescriptorSet0.vp_c10)._m0[4].z, _379);
    float _395 = sqrt(_381);
    float _397 = fma(_369, (*spvDescriptorSet0.vp_c10)._m0[5].z, _383);
    float _399 = fma(_369, (*spvDescriptorSet0.vp_c10)._m0[6].z, _391);
    bool _401 = _395 >= 9.9999999747524270787835121154785e-07;
    bool _403 = isnan(_395);
    bool _405 = _401 || _403;
    bool _407 = isnan(9.9999999747524270787835121154785e-07);
    bool _409 = _405 || _407;
    float _411 = fma(_347, _365, _385);
    float _413 = fma(_335, _365, _387);
    float _415 = fma(_355, _365, _389);
    float _417 = _397;
    float _419 = _393;
    float _421 = _399;
    if (!_409)
    {
        bool _423 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _425 = !_423;
        if (!_425)
        {
            float _427 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _429 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _431 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _433 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _427);
            float _435 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _429);
            float _437 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _431);
            float _439 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _433);
            float _441 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _435);
            float _443 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _437);
            float _445 = _439 * _439;
            float _447 = fma(_441, _441, _445);
            float _449 = fma(_443, _443, _447);
            float _451 = rsqrt(_449);
            float _453 = _451 * 9.9999999747524270787835121154785e-07;
            float _455 = _441 * _453;
            float _457 = _439 * _453;
            float _459 = _443 * _453;
            _417 = _457;
            _419 = _455;
            _421 = _459;
            _461 = true;
        }
        else
        {
            float _463 = _149 * _149;
            float _465 = fma(_147, _147, _463);
            float _467 = fma(_151, _151, _465);
            float _469 = sqrt(_467);
            bool _471 = _469 >= 9.9999999747524270787835121154785e-07;
            bool _473 = isnan(_469);
            bool _475 = _471 || _473;
            bool _477 = isnan(9.9999999747524270787835121154785e-07);
            bool _479 = _475 || _477;
            if (!_479)
            {
                float _481 = _387 * _387;
                float _483 = fma(_385, _385, _481);
                float _485 = fma(_389, _389, _483);
                float _487 = sqrt(_485);
                bool _489 = _487 >= 9.9999999747524270787835121154785e-07;
                bool _491 = isnan(_487);
                bool _493 = _489 || _491;
                bool _495 = isnan(9.9999999747524270787835121154785e-07);
                bool _497 = _493 || _495;
                if (!_497)
                {
                    float _499 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _501 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _499);
                    float _503 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _501);
                    float _505 = rsqrt(_503);
                    float _507 = _505 * 9.9999999747524270787835121154785e-07;
                    float _509 = _507 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _511 = _507 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _513 = _507 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _417 = _511;
                    _419 = _509;
                    _421 = _513;
                    _461 = true;
                }
                else
                {
                    float _515 = _387 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _517 = _387 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _519 = _387 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _521 = fma(_385, (*spvDescriptorSet0.vp_c10)._m0[5].x, _515);
                    float _523 = fma(_385, (*spvDescriptorSet0.vp_c10)._m0[4].x, _517);
                    float _525 = fma(_385, (*spvDescriptorSet0.vp_c10)._m0[6].x, _519);
                    float _527 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[5].z, _521);
                    float _529 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[4].z, _523);
                    float _531 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[6].z, _525);
                    float _533 = _527 * _527;
                    float _535 = fma(_529, _529, _533);
                    float _537 = fma(_531, _531, _535);
                    float _539 = rsqrt(_537);
                    float _541 = _539 * 9.9999999747524270787835121154785e-07;
                    float _543 = _529 * _541;
                    float _545 = _527 * _541;
                    float _547 = _531 * _541;
                    _417 = _545;
                    _419 = _543;
                    _421 = _547;
                    _461 = true;
                }
            }
            else
            {
                float _549 = _149 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _551 = _149 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _553 = _149 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _555 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[5].x, _549);
                float _557 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[4].x, _551);
                float _559 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[6].x, _553);
                float _561 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[5].z, _555);
                float _563 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[4].z, _557);
                float _565 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[6].z, _559);
                float _567 = _561 * _561;
                float _569 = fma(_563, _563, _567);
                float _571 = fma(_565, _565, _569);
                float _573 = rsqrt(_571);
                float _575 = _573 * 9.9999999747524270787835121154785e-07;
                float _577 = _563 * _575;
                float _579 = _561 * _575;
                float _581 = _565 * _575;
                _417 = _579;
                _419 = _577;
                _421 = _581;
            }
        }
    }
    _461 = false;
    float _583 = _417;
    float _585 = _419;
    float _587 = _421;
    bool _589 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _591 = !_589;
    float _609;
    if (!_591)
    {
        float _593 = in.m_53.x;
        float _595 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _597 = _593 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _599 = fma(_597, (*spvDescriptorSet0.vp_c9)._m0[12].x, _121);
        float _601 = _599 * _595;
        float _603 = floor(_601);
        float _605 = -_603;
        float _607 = _601 + _605;
        _609 = _607;
        _611 = true;
    }
    else
    {
        float _613 = float(_87);
        float _615 = 1.0 / _613;
        float _617 = _121 * _615;
        _609 = _617;
    }
    _611 = false;
    float _619 = _609;
    float _621 = _413 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _623 = _413 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _625 = _413 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _627 = as_type<float>(int(gl_VertexIndex));
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _631 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _629;
    float _633 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _635 = _633 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _637 = fma(_411, (*spvDescriptorSet0.vp_c10)._m0[5].x, _621);
    float _639 = fma(_411, (*spvDescriptorSet0.vp_c10)._m0[4].x, _623);
    float _641 = fma(_411, (*spvDescriptorSet0.vp_c10)._m0[6].x, _625);
    float _643 = 1.0 / _635;
    float _645 = fma(_415, (*spvDescriptorSet0.vp_c10)._m0[5].z, _637);
    float _647 = fma(_415, (*spvDescriptorSet0.vp_c10)._m0[4].z, _639);
    float _649 = fma(_415, (*spvDescriptorSet0.vp_c10)._m0[6].z, _641);
    float _651 = _583 * _583;
    float _653 = _645 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _655 = _647 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _657 = _649 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _659 = 1.0 / _631;
    float _661 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _663 = _653 + _661;
    float _665 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _667 = _619 + _665;
    float _669 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _671 = _655 + _669;
    float _673 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _675 = _657 + _673;
    float _677 = _663 * _663;
    float _679 = 0.0 + (*spvDescriptorSet0.vp_c7)._m0[0].x;
    float _681 = precise::clamp(_679, 0.0, 1.0);
    float _683 = _667 * _643;
    float _685 = fma(_671, _671, _677);
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _689 = _619 + _687;
    bool _691 = _619 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _693 = isnan(_619);
    bool _695 = _691 || _693;
    bool _697 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _699 = _695 || _697;
    float _701 = float(_699);
    bool _703 = _619 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _705 = isnan(_619);
    bool _707 = _703 || _705;
    bool _709 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _711 = _707 || _709;
    float _713 = float(_711);
    float _715 = fma(_675, _675, _685);
    bool _717 = _619 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _719 = isnan(_619);
    bool _721 = _717 || _719;
    bool _723 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _725 = _721 || _723;
    float _727 = float(_725);
    float _729 = fma(_585, _585, _651);
    float _731 = _689 * _659;
    float _733 = -_727;
    float _735 = _733 + 1.0;
    float _737 = fma(_587, _587, _729);
    float _739 = rsqrt(_715);
    float _741 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _743 = _741 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _745 = _713 * _735;
    float _747 = -_713;
    float _749 = _747 + 1.0;
    float _751 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _753 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _751;
    float _755 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _757 = _755 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _759 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _761 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _759;
    float _763 = fma(_743, _683, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _765 = rsqrt(_737);
    float _767 = fma(_681, -0.64999997615814208984375, 1.0);
    float _769 = fma(_753, _731, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _771 = _701 * _749;
    float _773 = fma(_757, _683, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _775 = fma(_761, _731, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    int _777 = as_type<int>(_627) & 1;
    bool _779 = _777 != 0;
    int _781 = as_type<int>(_627) & 2;
    bool _783 = _781 != 0;
    float _785 = _663 * _739;
    float _787 = _769 * _771;
    float _789 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _791 = (*spvDescriptorSet0.vp_c10)._m0[9].w + _789;
    float _793 = -_785;
    float _795 = fma(_793, (*spvDescriptorSet0.vp_c9)._m0[18].w, _663);
    float _797 = _775 * _771;
    float _799 = -_701;
    float _801 = _799 + 1.0;
    float _803 = _765 * _585;
    float _805 = _671 * _739;
    float _807 = _795 * _795;
    float _809 = _765 * _587;
    float _811 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _813 = (*spvDescriptorSet0.vp_c10)._m0[8].w + _811;
    float _815 = -_805;
    float _817 = fma(_815, (*spvDescriptorSet0.vp_c9)._m0[18].w, _671);
    float _819 = _791 * _791;
    float _821 = _765 * _583;
    float _823 = fma(_801, (*spvDescriptorSet0.vp_c9)._m0[143].x, _787);
    float _825 = fma(_801, (*spvDescriptorSet0.vp_c9)._m0[143].y, _797);
    float _827 = fma(_817, _817, _807);
    float _829 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _831 = _809 * _829;
    float _833 = _675 * _739;
    float _835 = in.m_51.x;
    float _837 = in.m_51.y;
    float _839 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _841 = (*spvDescriptorSet0.vp_c10)._m0[10].w + _839;
    float _843 = fma(_813, _813, _819);
    float _845 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _847 = _821 * _845;
    float _849 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _851 = -_831;
    float _853 = fma(_803, _849, _851);
    float _855 = -_833;
    float _857 = fma(_855, (*spvDescriptorSet0.vp_c9)._m0[18].w, _675);
    float _859 = fma(_841, _841, _843);
    float _861 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _863 = _803 * _861;
    float _865 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _867 = -_847;
    float _869 = fma(_809, _865, _867);
    float _871 = _853 * _853;
    float _873 = fma(_857, _857, _827);
    float _875 = rsqrt(_859);
    float _877 = fma(_763, _745, _823);
    float _879 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _881 = -_863;
    float _883 = fma(_821, _879, _881);
    float _885 = fma(_869, _869, _871);
    float _887 = fma(_773, _745, _825);
    float _889 = fma(_727, (*spvDescriptorSet0.vp_c9)._m0[145].x, _877);
    float _891 = fma(_883, _883, _885);
    float _893 = sqrt(_873);
    float _895 = fma(_727, (*spvDescriptorSet0.vp_c9)._m0[145].y, _887);
    float _897 = _895 * _837;
    float _899 = _889 * _835;
    float _901 = rsqrt(_891);
    float _903 = _875 * (-0.20000000298023223876953125);
    float _905 = _897 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _907 = _899 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _909 = !_783;
    float _911 = _909 ? (-0.5) : 0.5;
    float _913 = fma(_791, _903, (*spvDescriptorSet0.vp_c10)._m0[9].w);
    bool _915 = !_779;
    float _917 = _915 ? (-0.5) : 0.5;
    float _919 = sqrt(_859);
    float _921 = _739 * _893;
    float _923 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _911);
    float _925 = fma(_841, _903, (*spvDescriptorSet0.vp_c10)._m0[10].w);
    float _927 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _917);
    float _929 = _905 * _921;
    float _931 = _907 * _921;
    float _933 = fma(_813, _903, (*spvDescriptorSet0.vp_c10)._m0[8].w);
    float _935 = _869 * _901;
    float _937 = _929 * _923;
    float _939 = _853 * _901;
    float _941 = _883 * _901;
    float _943 = _931 * _927;
    float _945 = _809 * _935;
    float _947 = _937 * _821;
    float _949 = _821 * _941;
    float _951 = _919 * 0.066666670143604278564453125;
    float _953 = -_945;
    float _955 = fma(_803, _941, _953);
    float _957 = _921 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _959 = _957 * 0.5;
    float _961 = _937 * _803;
    float _963 = fma(_943, _939, _947);
    float _965 = precise::max(_951, 1.0);
    float _967 = _803 * _939;
    float _969 = -_949;
    float _971 = fma(_809, _939, _969);
    float _973 = _937 * _809;
    float _975 = fma(_943, _935, _961);
    float _977 = fma(_959, _955, _963);
    float _979 = precise::min(_965, 2.0);
    float _981 = -_967;
    float _983 = fma(_821, _935, _981);
    float _985 = fma(_943, _941, _973);
    float _987 = fma(_959, _971, _975);
    float _989 = _653 + _977;
    float _991 = -_913;
    float _993 = _991 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _995 = _979 * _767;
    float _997 = _655 + _987;
    float _999 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1001 = _989 + _999;
    float _1003 = fma(_959, _983, _985);
    float _1005 = _993 * _993;
    float _1007 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1009 = _997 + _1007;
    float _1011 = fma(_1001, _995, (*spvDescriptorSet0.vp_c10)._m0[9].w);
    float _1013 = _657 + _1003;
    float _1015 = -_933;
    float _1017 = _1015 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1019 = fma(_1009, _995, (*spvDescriptorSet0.vp_c10)._m0[8].w);
    float _1021 = -_1011;
    float _1023 = _1021 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1025 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1027 = _1013 + _1025;
    float _1029 = fma(_1017, _1017, _1005);
    float _1031 = -_925;
    float _1033 = _1031 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1035 = -_1019;
    float _1037 = _1035 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1039 = _1023 * _1023;
    float _1041 = fma(_1027, _995, (*spvDescriptorSet0.vp_c10)._m0[10].w);
    float _1043 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1045 = _913 + _1043;
    float _1047 = fma(_1033, _1033, _1029);
    float _1049 = fma(_1037, _1037, _1039);
    float _1051 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1053 = _933 + _1051;
    float _1055 = -_1041;
    float _1057 = _1055 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1059 = _1045 * _1045;
    float _1061 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1063 = _925 + _1061;
    float _1065 = sqrt(_1047);
    float _1067 = fma(_1057, _1057, _1049);
    float _1069 = fma(_1053, _1053, _1059);
    float _1071 = fma(_1063, _1063, _1069);
    int _1073 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1075 = _1073 != 0;
    float _1077 = sqrt(_1067);
    float _1079 = rsqrt(_1071);
    float _1081 = -_1065;
    float _1083 = _1077 + _1081;
    float _1085 = _1079 * _1083;
    float _1087 = -_1085;
    float _1089 = fma(_1053, _1087, _1019);
    float _1091 = -_1085;
    float _1093 = fma(_1063, _1091, _1041);
    float _1095 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1097 = in.m_53.x;
    float _1099 = in.m_53.y;
    float _1101 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1103 = _1089 + _1101;
    float _1105 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1107 = _1093 + _1105;
    float _1109 = _1103 * _1103;
    float _1111 = _1107 * _1107;
    float _1113 = _1109 + _1111;
    float _1115 = sqrt(_1113);
    bool _1117 = _1097 > 0.5;
    float _1119 = -_917;
    float _1121 = _1117 ? _1119 : _917;
    bool _1123 = _1115 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _1125 = _1099 > 0.5;
    float _1127 = -_1085;
    float _1129 = fma(_1045, _1127, _1011);
    bool _1131 = !_1075;
    float _1133 = _1131 ? _917 : _1121;
    float _1135 = _1121;
    float _1137 = _1045;
    float _1139 = _1093;
    float _1141 = _1109;
    float _1143 = _1111;
    float _1145 = _1107;
    if (!_1123)
    {
        _1135 = _1093;
    }
    float _1147 = _1135;
    float _1149 = _1147;
    if (!_1123)
    {
        _1137 = _1089;
    }
    float _1151 = _1137;
    float _1153 = _1151;
    if (!_1123)
    {
        _1139 = _1129;
    }
    float _1155 = _1139;
    bool _1157 = !_1123;
    float _1159 = _1155;
    if (!_1157)
    {
        float _1161 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1163 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1165 = _1115 + _1163;
        float _1167 = rsqrt(_1113);
        float _1169 = _1165 * _1161;
        float _1171 = _1129 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1173 = _1169 * 0.15915493667125701904296875;
        float _1175 = _1173 * 6.283185482025146484375;
        float _1177 = sin(_1175);
        float _1179 = _1173 * 6.283185482025146484375;
        float _1181 = cos(_1179);
        float _1183 = fma(_1177, _1171, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1185 = _1167 * _1183;
        float _1187 = _1181 + (-1.0);
        float _1189 = fma(_1103, _1185, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1191 = fma(_1107, _1185, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1193 = _1187 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1195 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1197 = _1189 + _1195;
        float _1199 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1201 = _1191 + _1199;
        float _1203 = fma(_1129, _1181, _1193);
        float _1205 = _1197 * _1197;
        float _1207 = _1201 * _1201;
        _1159 = _1203;
        _1141 = _1205;
        _1143 = _1207;
        _1153 = _1189;
        _1149 = _1191;
    }
    float _1209 = _1159;
    float _1211 = _1141;
    float _1213 = _1143;
    float _1215 = _1153;
    float _1217 = _1149;
    float _1219 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1221 = _1209 + _1219;
    float _1223 = _1133 + 0.5;
    int _1225 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1227 = _1225 != 0;
    float _1229 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1231 = -_911;
    int _1233 = _1125 ? as_type<int>(_1231) : as_type<int>(_911);
    float _1235 = fma(_1221, _1221, _1211);
    float _1237 = _1223 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1239 = !_1227;
    float _1241 = _1239 ? _911 : as_type<float>(_1233);
    float _1243 = _1235 + _1213;
    float _1245 = _1237 * _1095;
    float _1247 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1249 = -_1241;
    float _1251 = _1249 + 0.5;
    float _1253 = sqrt(_1243);
    float _1255 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1257 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1259 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1261 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1263 = _1251 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1265 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1267 = _1255 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1269 = _1257 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1271 = _1259 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1273 = _1247 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1275 = _1261 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1277 = _1265 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1279 = _1263 * _1229;
    out.m_58.x = _1267;
    out.m_58.y = _1269;
    out.m_58.z = _1271;
    bool _1281 = _1253 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1283 = isnan(_1253);
    bool _1285 = _1281 || _1283;
    bool _1287 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1289 = _1285 || _1287;
    out.m_60.x = _1273;
    out.m_60.y = _1275;
    out.m_60.z = _1277;
    out.m_62.x = _1245;
    out.m_62.y = _1279;
    float _1291 = _1263;
    float _1293 = _1279;
    float _1295 = _1273;
    if (!_1289)
    {
        _1291 = 1.0;
    }
    float _1297 = _1291;
    bool _1299 = !_1289;
    float _1301 = _1297;
    if (!_1299)
    {
        bool _1303 = _1253 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1305 = isnan(_1253);
        bool _1307 = _1303 || _1305;
        bool _1309 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1311 = _1307 || _1309;
        if (!_1311)
        {
            float _1313 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1315 = _1253 + _1313;
            float _1317 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1319 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1317;
            float _1321 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1323 = _1321 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1325 = 1.0 / _1319;
            float _1327 = _1315 * _1325;
            float _1329 = fma(_1327, _1323, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1301 = _1329;
            _1331 = true;
        }
        else
        {
            bool _1333 = _1253 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1335 = isnan(_1253);
            bool _1337 = _1333 || _1335;
            bool _1339 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1341 = _1337 || _1339;
            if (!_1341)
            {
                float _1343 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1345 = _1253 + _1343;
                float _1347 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1349 = _1347 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1351 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1353 = _1351 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1355 = 1.0 / _1349;
                float _1357 = _1345 * _1355;
                float _1359 = fma(_1357, _1353, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1301 = _1359;
                _1331 = true;
            }
            else
            {
                _1301 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1331 = false;
    float _1361 = _1301;
    float _1363 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1365 = _1209 + _1363;
    float _1367 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1369 = _1215 + _1367;
    float _1371 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1373 = _1217 + _1371;
    float _1375 = fma(_1365, _1361, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1377 = fma(_1369, _1361, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1379 = fma(_1373, _1361, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1381 = -_785;
    float _1383 = fma(_1381, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1375);
    float _1385 = -_805;
    float _1387 = fma(_1385, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1377);
    float _1389 = -_833;
    float _1391 = fma(_1389, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1379);
    float _1393 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1395 = _1383 + _1393;
    float _1397 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1399 = _1387 + _1397;
    float _1401 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1403 = _1391 + _1401;
    float _1405 = _1395 * _1395;
    float _1407 = fma(_1399, _1399, _1405);
    float _1409 = fma(_1403, _1403, _1407);
    float _1411 = rsqrt(_1409);
    float _1413 = _1411 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1415 = _1399 * _1413;
    float _1417 = _1403 * _1413;
    float _1419 = _1415 * _1415;
    float _1421 = _1417 * _1417;
    float _1423 = _1419 + _1421;
    float _1425 = sqrt(_1423);
    bool _1427 = _1425 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1429 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1431 = _1425 + _1429;
    float _1433 = _1403;
    float _1435 = _1423;
    float _1437 = _1431;
    float _1439 = _1395;
    if (_1427)
    {
        float _1441 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1433 = _1441;
    }
    float _1443 = _1433;
    if (_1427)
    {
        float _1445 = rsqrt(_1423);
        _1435 = _1445;
    }
    float _1447 = _1435;
    float _1449 = _1447;
    if (_1427)
    {
        float _1451 = _1431 * _1443;
        _1437 = _1451;
    }
    float _1453 = _1437;
    if (_1427)
    {
        float _1455 = _1453 * 0.15915493667125701904296875;
        _1293 = _1455;
    }
    float _1457 = _1293;
    float _1459 = _1443;
    if (_1427)
    {
        float _1461 = _1457 * 6.283185482025146484375;
        float _1463 = sin(_1461);
        _1459 = _1463;
    }
    float _1465 = _1459;
    float _1467 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1469 = precise::max(0.0, _1467);
    float _1471 = _1411;
    float _1473 = _1469;
    if (_1427)
    {
        float _1475 = _1457 * 6.283185482025146484375;
        float _1477 = cos(_1475);
        _1471 = _1477;
    }
    float _1479 = _1471;
    float _1481 = -_1413;
    float _1483 = -_1469;
    float _1485 = fma(_1395, _1481, _1483);
    if (!_1427)
    {
        _1439 = _1415;
    }
    float _1487 = _1439;
    float _1489 = _1487;
    if (_1427)
    {
        float _1491 = _1485 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1473 = _1491;
    }
    float _1493 = _1473;
    float _1495 = sqrt(_1409);
    float _1497 = _1465;
    float _1499 = _1493;
    if (_1427)
    {
        float _1501 = fma(_1465, _1493, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1497 = _1501;
    }
    float _1503 = _1497;
    float _1505 = _1503;
    float _1507 = _1479;
    if (_1427)
    {
        float _1509 = _1479 + (-1.0);
        _1499 = _1509;
    }
    float _1511 = _1499;
    float _1513 = _1511;
    if (_1427)
    {
        float _1515 = _1447 * _1503;
        _1145 = _1515;
    }
    float _1517 = _1145;
    if (!_1427)
    {
        _1505 = _1485;
    }
    float _1519 = _1505;
    float _1521 = _1519;
    if (_1427)
    {
        float _1523 = _1511 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1295 = _1523;
    }
    float _1525 = _1295;
    if (_1427)
    {
        float _1527 = _1415 * _1517;
        _1489 = _1527;
    }
    float _1529 = _1489;
    if (!_1427)
    {
        _1513 = _1417;
    }
    float _1531 = _1513;
    float _1533 = _1531;
    if (_1427)
    {
        float _1535 = _1417 * _1517;
        _1533 = _1535;
    }
    float _1537 = _1533;
    if (!_1427)
    {
        _1449 = _1419;
    }
    float _1539 = _1449;
    float _1541 = _1539;
    if (_1427)
    {
        float _1543 = fma(_1485, _1479, _1525);
        _1521 = _1543;
    }
    float _1545 = _1521;
    if (_1427)
    {
        float _1547 = _1529 * _1529;
        _1541 = _1547;
    }
    float _1549 = _1541;
    if (!_1427)
    {
        _1507 = _1421;
    }
    float _1551 = _1507;
    float _1553 = _1551;
    if (_1427)
    {
        float _1555 = _1537 * _1537;
        _1553 = _1555;
    }
    float _1557 = _1553;
    float _1559 = fma(_1545, _1545, _1549);
    float _1561 = _1559 + _1557;
    float _1563 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1565 = fma(_1495, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1563);
    float _1567 = precise::clamp(_1565, 0.0, 1.0);
    float _1569 = _1383 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1571 = _1383 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1573 = rsqrt(_1561);
    float _1575 = -_1567;
    float _1577 = _1575 + 1.0;
    float _1579 = fma(_1387, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1569);
    float _1581 = fma(_1387, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1571);
    float _1583 = _1383 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1585 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1587 = fma(_1391, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1579);
    float _1589 = _1383 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1591 = fma(_1391, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1581);
    float _1593 = abs(_1577);
    float _1595 = log2(_1593);
    float _1597 = fma(_1387, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1583);
    float _1599 = fma(_1387, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1589);
    float _1601 = _1591 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1603 = _1587 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1605 = fma(_1391, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1597);
    float _1607 = fma(_1391, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1599);
    float _1609 = _1573 * _1529;
    float _1611 = _1573 * _1545;
    float _1613 = _1573 * _1537;
    float _1615 = _1607 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1617 = _1609 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1619 = _1601 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1621 = _1603 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1623 = _1605 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1625 = -_1617;
    float _1627 = fma(_1611, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1625);
    float _1629 = fma(_1615, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1619);
    float _1631 = -_1621;
    float _1633 = fma(_1631, _1585, 1.0);
    float _1635 = _1595 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1637 = -_1613;
    float _1639 = fma(_1637, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1627);
    float _1641 = fma(_1603, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1629);
    float _1643 = _1601 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1645 = exp2(_1635);
    float _1647 = fma(_1639, -0.5, 0.5);
    float _1649 = fma(_1623, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1641);
    float _1651 = _1601 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1653 = fma(_1639, 0.5, 0.5);
    float _1655 = fma(_1615, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1643);
    float _1657 = _1611 + 1.0;
    float _1659 = fma(_1615, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1651);
    float _1661 = log2(_1633);
    float _1663 = fma(_1653, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1665 = fma(_1603, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1655);
    float _1667 = fma(_1603, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1659);
    float _1669 = fma(_1653, _1663, -0.212114393711090087890625);
    float _1671 = fma(_1623, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1665);
    float _1673 = fma(_1623, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1667);
    float _1675 = 1.0 / _1649;
    float _1677 = -_1611;
    float _1679 = fma(_1645, _1657, _1677);
    float _1681 = fma(_1653, _1669, 1.570728778839111328125);
    float _1683 = fma(_1679, 0.5, 0.5);
    float _1685 = sqrt(_1647);
    float _1687 = _1661 * 0.693147182464599609375;
    float _1689 = _1687 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1691 = _1671 * _1675;
    float _1693 = _1673 * _1675;
    float _1695 = fma(_1691, 0.5, 0.5);
    float _1697 = fma(_1693, -0.5, 0.5);
    float _1699 = _1685 * 0.636619746685028076171875;
    float _1701 = -_1681;
    float _1703 = fma(_1699, _1701, 1.0);
    float3 _4617 = float3(_1695, _1697, _1689);
    float _1705 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4617, float3(0.0), isnan(_4617)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4617, float3(0.0), isnan(_4617)), level(0.0)).x;
    float3 _4628 = float3(_1695, _1697, _1689);
    float4 _1708 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4628, float3(0.0), isnan(_4628)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4628, float3(0.0), isnan(_4628)), level(0.0)).xyzw;
    float _1710 = _1708.x;
    float _1712 = _1708.y;
    float _1714 = _1708.z;
    float _1716 = _1708.w;
    float2 _4645 = float2(_1703, _1683);
    float3 _1720 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4645, float2(0.0), isnan(_4645)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4645, float2(0.0), isnan(_4645)), level(0.0)).xyz;
    float _1722 = _1720.x;
    float _1724 = _1720.y;
    float _1726 = _1720.z;
    float _1728 = -_785;
    float _1730 = fma(_1728, (*spvDescriptorSet0.vp_c9)._m0[18].w, _653);
    float _1732 = -_805;
    float _1734 = fma(_1732, (*spvDescriptorSet0.vp_c9)._m0[18].w, _655);
    float _1736 = -_833;
    float _1738 = fma(_1736, (*spvDescriptorSet0.vp_c9)._m0[18].w, _657);
    float _1740 = _1595 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1742 = _1730 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1744 = fma(_1734, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1742);
    float _1746 = _1730 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1748 = exp2(_1740);
    float _1750 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1744);
    float _1752 = fma(_1734, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1746);
    bool _1754 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1756 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1758 = _1754 || _1756;
    bool _1760 = isnan(0.5);
    bool _1762 = _1758 || _1760;
    float _1764 = _1750 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1766 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1752);
    float _1768 = _1601 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1770 = 1.0 / _1764;
    float _1772 = _1766 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1774 = fma(_1615, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1768);
    float _1776 = _1772 + _1764;
    float _1778 = fma(_1603, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1774);
    float _1780 = _1774;
    if (_1762)
    {
        _1780 = 1.0;
    }
    float _1782 = _1780;
    float _1784 = fma(_1623, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1778);
    float _1786 = _1776 * _1770;
    float _1788 = _1786 * 0.5;
    float _1790 = _1782;
    if (!_1762)
    {
        float _1792 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1794 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1796 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1794);
        float _1798 = _1792 * 0.15915493667125701904296875;
        float _1800 = _1798 * 6.283185482025146484375;
        float _1802 = cos(_1800);
        float _1804 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1806 = _1804 * 0.15915493667125701904296875;
        float _1808 = _1798 * 6.283185482025146484375;
        float _1810 = sin(_1808);
        float _1812 = 1.0 / _1802;
        float _1814 = _1806 * 6.283185482025146484375;
        float _1816 = cos(_1814);
        float _1818 = _1810 * _1812;
        float _1820 = 1.0 / _1796;
        float _1822 = _1816 * _1818;
        float _1824 = _1806 * 6.283185482025146484375;
        float _1826 = sin(_1824);
        float _1828 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1830 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1828;
        float _1832 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1834 = _1820 * _1832;
        float _1836 = 1.0 / _1822;
        float _1838 = 1.0 / _1830;
        float _1840 = _1826 * _1836;
        float _1842 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1844 = fma(_1840, _1834, _1842);
        float _1846 = _1844 * _1838;
        float _1848 = precise::clamp(_1846, 0.0, 1.0);
        float _1850 = -_1848;
        float _1852 = _1850 + 1.0;
        _1790 = _1852;
    }
    float _1854 = _1790;
    float _1856 = -_1748;
    float _1858 = _1856 + 1.0;
    float _1860 = _1649 * 0.5;
    float _1862 = _1854 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1864 = _1854 > 0.0;
    bool _1866 = isnan(_1854);
    bool _1868 = _1864 || _1866;
    bool _1870 = isnan(0.0);
    bool _1872 = _1868 || _1870;
    float _1874 = _1858 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1876 = fma(_1673, -0.5, _1860);
    float _1878 = _1862 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1880 = _1784 + _1649;
    float _1882 = _1874 * _1705;
    float _1884 = _1671 + _1649;
    out.m_64.x = _1387;
    out.m_64.y = _1383;
    out.m_64.z = _1391;
    float _1886 = _1716 * _1882;
    float _1888 = _1726 * _1882;
    float _1890 = -_1874;
    float _1892 = _1890 + 1.0;
    out.gl_Position.x = _1671;
    out.gl_Position.y = _1673;
    out.gl_Position.z = _1784;
    out.gl_Position.w = _1649;
    float _1894 = _1880 * 0.5;
    float _1896 = _1884 * 0.5;
    float _1898 = _1716 * _1892;
    out.m_47.x = _1878;
    float _1900 = fma(_1722, _1886, _1710);
    float _1902 = fma(_1724, _1886, _1712);
    float _1904 = fma(_1716, _1888, _1714);
    out.m_66.x = _1896;
    out.m_66.y = _1876;
    out.m_66.z = _1894;
    out.m_66.w = _1649;
    out.m_68.x = _1900;
    out.m_68.y = _1902;
    out.m_68.z = _1904;
    out.m_68.w = _1898;
    if (_1872)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _1906 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1906;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

