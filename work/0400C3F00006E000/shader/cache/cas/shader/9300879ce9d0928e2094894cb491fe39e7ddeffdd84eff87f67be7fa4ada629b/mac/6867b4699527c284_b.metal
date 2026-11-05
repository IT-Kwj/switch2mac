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
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
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
    float4 m_64 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_62 [[user(locn4)]];
    float4 m_66 [[user(locn6)]];
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
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1501 = false;
    bool _621 = false;
    bool _471 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _80 = in.m_44.w;
    float _82 = trunc(_80);
    int _85 = int(_82);
    bool _89 = _85 >= 1;
    float _91 = 0.0;
    if (!_89)
    {
        _91 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _93 = _91;
    if (!_89)
    {
        out.m_47.x = 0.0;
    }
    int _95 = 0;
    if (!_89)
    {
        float _97 = _93 * 5.0;
        _95 = as_type<int>(_97);
    }
    int _99 = _95;
    int _101 = _99;
    if (!_89)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2246 = as_type<float>(_99);
        out.gl_Position.z = _2246;
    }
    if (!_89)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _103 = in.m_49.w;
    bool _105 = _103 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _107 = isnan(_103);
    bool _109 = _105 || _107;
    bool _111 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _113 = _109 || _111;
    float _115 = -_103;
    float _117 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _119 = 0.0;
    if (_113)
    {
        float _121 = float(_85);
        _119 = _121;
    }
    float _123 = _119;
    bool _125 = _117 >= _123;
    bool _127 = !_113;
    bool _129 = _125 || _127;
    float _131 = 0.0;
    float _133 = _123;
    if (_129)
    {
        _131 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _135 = _131;
    float _137 = _135;
    if (_129)
    {
        out.m_47.x = 0.0;
    }
    if (_129)
    {
        float _139 = _135 * 5.0;
        _101 = as_type<int>(_139);
    }
    int _141 = _101;
    if (_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2316 = as_type<float>(_141);
        out.gl_Position.z = _2316;
    }
    if (_129)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _143 = in.m_49.x;
    float _145 = in.m_49.y;
    float _147 = in.m_49.z;
    float _149 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _151 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _153 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _155 = _151 || _153;
    bool _157 = isnan(1.0);
    bool _159 = _155 || _157;
    float _161 = 0.0;
    float _163 = _149;
    if (!_159)
    {
        float _165 = _149 * _149;
        float _167 = _165 * 0.5;
        _161 = _167;
    }
    float _169 = _161;
    float _171 = 0.0;
    float _173 = _169;
    if (!_159)
    {
        float _175 = _117 * _117;
        float _177 = _175 * 0.5;
        _171 = _177;
    }
    float _179 = _171;
    if (!_159)
    {
        float _181 = _169 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _173 = _181;
    }
    float _183 = _173;
    bool _185 = !_159;
    float _187 = _183;
    if (!_185)
    {
        float _189 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _191 = log2(_189);
        float _193 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _195 = _193 + 1.0;
        float _197 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _199 = _149 * _191;
        float _201 = 1.0 / _195;
        float _203 = _197 * 0.693147182464599609375;
        float _205 = exp2(_199);
        float _207 = 1.0 / _203;
        float _209 = _205 + (-1.0);
        float _211 = -_209;
        float _213 = fma(_211, _207, _149);
        float _215 = _213 * _201;
        float _217 = _215 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _137 = _207;
        _187 = _217;
        _133 = _205;
    }
    float _219 = _137;
    float _221 = _187;
    float _223 = _133;
    bool _225 = !_159;
    float _227 = _219;
    float _229 = _223;
    if (!_225)
    {
        float _231 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _233 = log2(_231);
        float _235 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _237 = _235 + 1.0;
        float _239 = 1.0 / _237;
        float _241 = _149 * _233;
        float _243 = exp2(_241);
        float _245 = -_243;
        float _247 = _245 + 1.0;
        float _249 = _247 * _239;
        _227 = _243;
        _229 = _237;
        _163 = _249;
    }
    float _251 = _227;
    float _253 = _229;
    float _255 = _163;
    float _257 = _253;
    float _259 = _251;
    if (!_159)
    {
        _257 = _117;
    }
    float _261 = _257;
    float _263 = _221 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _265 = _261;
    if (!_159)
    {
        float _267 = _179 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _259 = _267;
    }
    float _269 = _259;
    bool _271 = !_159;
    float _273 = _269;
    if (!_271)
    {
        float _275 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _277 = log2(_275);
        float _279 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _281 = _279 + 1.0;
        float _283 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _285 = _117 * _277;
        float _287 = 1.0 / _281;
        float _289 = _283 * 0.693147182464599609375;
        float _291 = exp2(_285);
        float _293 = 1.0 / _289;
        float _295 = _291 + (-1.0);
        float _297 = -_295;
        float _299 = fma(_297, _293, _117);
        float _301 = _299 * _287;
        float _303 = _301 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _273 = _303;
    }
    float _305 = _273;
    bool _307 = !_159;
    if (!_307)
    {
        float _309 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _311 = log2(_309);
        float _313 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _315 = _313 + 1.0;
        float _317 = 1.0 / _315;
        float _319 = _117 * _311;
        float _321 = exp2(_319);
        float _323 = -_321;
        float _325 = _323 + 1.0;
        float _327 = _325 * _317;
        _265 = _327;
    }
    float _329 = _265;
    float _331 = _305 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _333 = fma(_255, _145, _263);
    float _335 = _221 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _337 = _305 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _339 = fma(_329, _145, _331);
    float _341 = _221 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _343 = _305 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _345 = fma(_255, _143, _335);
    float _347 = fma(_329, _143, _337);
    float _349 = -_339;
    float _351 = _333 + _349;
    float _353 = fma(_255, _147, _341);
    float _355 = fma(_329, _147, _343);
    float _357 = -_347;
    float _359 = _345 + _357;
    float _361 = _351 * _351;
    float _363 = in.m_51.w;
    float _365 = -_355;
    float _367 = _353 + _365;
    float _369 = _351 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _371 = fma(_359, _359, _361);
    float _373 = _351 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _375 = in.m_44.x;
    float _377 = in.m_44.y;
    float _379 = in.m_44.z;
    float _381 = _351 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _383 = fma(_367, _367, _371);
    float _385 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[4].x, _369);
    float _387 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[5].x, _373);
    float _389 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[6].x, _381);
    float _391 = fma(_367, (*spvDescriptorSet0.vp_c10)._m0[4].z, _385);
    float _393 = sqrt(_383);
    float _395 = fma(_367, (*spvDescriptorSet0.vp_c10)._m0[6].z, _389);
    bool _397 = _393 >= 9.9999999747524270787835121154785e-07;
    bool _399 = isnan(_393);
    bool _401 = _397 || _399;
    bool _403 = isnan(9.9999999747524270787835121154785e-07);
    bool _405 = _401 || _403;
    float _407 = fma(_367, (*spvDescriptorSet0.vp_c10)._m0[5].z, _387);
    float _409 = fma(_345, _363, _375);
    float _411 = fma(_333, _363, _377);
    float _413 = fma(_353, _363, _379);
    float _415 = _389;
    float _417 = _367;
    float _419 = _407;
    if (_405)
    {
        _415 = _407;
    }
    float _421 = _415;
    float _423 = _421;
    if (_405)
    {
        _417 = _391;
    }
    float _425 = _417;
    float _427 = _425;
    if (_405)
    {
        _419 = _395;
    }
    float _429 = _419;
    float _431 = _429;
    if (!_405)
    {
        bool _433 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _435 = !_433;
        if (!_435)
        {
            float _437 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _439 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _441 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _443 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _437);
            float _445 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _439);
            float _447 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _441);
            float _449 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _443);
            float _451 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _445);
            float _453 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _447);
            float _455 = _449 * _449;
            float _457 = fma(_451, _451, _455);
            float _459 = fma(_453, _453, _457);
            float _461 = rsqrt(_459);
            float _463 = _461 * 9.9999999747524270787835121154785e-07;
            float _465 = _451 * _463;
            float _467 = _449 * _463;
            float _469 = _453 * _463;
            _423 = _467;
            _427 = _465;
            _431 = _469;
            _471 = true;
        }
        else
        {
            float _473 = _145 * _145;
            float _475 = fma(_143, _143, _473);
            float _477 = fma(_147, _147, _475);
            float _479 = sqrt(_477);
            bool _481 = _479 >= 9.9999999747524270787835121154785e-07;
            bool _483 = isnan(_479);
            bool _485 = _481 || _483;
            bool _487 = isnan(9.9999999747524270787835121154785e-07);
            bool _489 = _485 || _487;
            if (!_489)
            {
                float _491 = _377 * _377;
                float _493 = fma(_375, _375, _491);
                float _495 = fma(_379, _379, _493);
                float _497 = sqrt(_495);
                bool _499 = _497 >= 9.9999999747524270787835121154785e-07;
                bool _501 = isnan(_497);
                bool _503 = _499 || _501;
                bool _505 = isnan(9.9999999747524270787835121154785e-07);
                bool _507 = _503 || _505;
                if (!_507)
                {
                    float _509 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _511 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _509);
                    float _513 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _511);
                    float _515 = rsqrt(_513);
                    float _517 = _515 * 9.9999999747524270787835121154785e-07;
                    float _519 = _517 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _521 = _517 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _523 = _517 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _423 = _521;
                    _427 = _519;
                    _431 = _523;
                    _471 = true;
                }
                else
                {
                    float _525 = _377 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _527 = _377 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _529 = _377 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _531 = fma(_375, (*spvDescriptorSet0.vp_c10)._m0[5].x, _525);
                    float _533 = fma(_375, (*spvDescriptorSet0.vp_c10)._m0[4].x, _527);
                    float _535 = fma(_375, (*spvDescriptorSet0.vp_c10)._m0[6].x, _529);
                    float _537 = fma(_379, (*spvDescriptorSet0.vp_c10)._m0[5].z, _531);
                    float _539 = fma(_379, (*spvDescriptorSet0.vp_c10)._m0[4].z, _533);
                    float _541 = fma(_379, (*spvDescriptorSet0.vp_c10)._m0[6].z, _535);
                    float _543 = _537 * _537;
                    float _545 = fma(_539, _539, _543);
                    float _547 = fma(_541, _541, _545);
                    float _549 = rsqrt(_547);
                    float _551 = _549 * 9.9999999747524270787835121154785e-07;
                    float _553 = _539 * _551;
                    float _555 = _537 * _551;
                    float _557 = _541 * _551;
                    _423 = _555;
                    _427 = _553;
                    _431 = _557;
                    _471 = true;
                }
            }
            else
            {
                float _559 = _145 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _561 = _145 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _563 = _145 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _565 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[5].x, _559);
                float _567 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[4].x, _561);
                float _569 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[6].x, _563);
                float _571 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[5].z, _565);
                float _573 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[4].z, _567);
                float _575 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[6].z, _569);
                float _577 = _571 * _571;
                float _579 = fma(_573, _573, _577);
                float _581 = fma(_575, _575, _579);
                float _583 = rsqrt(_581);
                float _585 = _583 * 9.9999999747524270787835121154785e-07;
                float _587 = _573 * _585;
                float _589 = _571 * _585;
                float _591 = _575 * _585;
                _423 = _589;
                _427 = _587;
                _431 = _591;
            }
        }
    }
    _471 = false;
    float _593 = _423;
    float _595 = _427;
    float _597 = _431;
    bool _599 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _601 = !_599;
    float _619;
    if (!_601)
    {
        float _603 = in.m_53.x;
        float _605 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _607 = _603 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _609 = fma(_607, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _611 = _609 * _605;
        float _613 = floor(_611);
        float _615 = -_613;
        float _617 = _611 + _615;
        _619 = _617;
        _621 = true;
    }
    else
    {
        float _623 = float(_85);
        float _625 = 1.0 / _623;
        float _627 = _117 * _625;
        _619 = _627;
    }
    _621 = false;
    float _629 = _619;
    float _631 = as_type<float>(int(gl_VertexIndex));
    float _633 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _635 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _633;
    float _637 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _639 = _637 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _641 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _643 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _641;
    float _645 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _647 = _645 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _649 = 1.0 / _635;
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _653 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _651;
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _657 = _655 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _659 = 1.0 / _647;
    float _661 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _663 = _629 + _661;
    float _665 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _667 = (*spvDescriptorSet0.vp_c9)._m0[150].w + _665;
    bool _669 = _629 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _671 = isnan(_629);
    bool _673 = _669 || _671;
    bool _675 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _677 = _673 || _675;
    float _679 = float(_677);
    bool _681 = _629 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _683 = isnan(_629);
    bool _685 = _681 || _683;
    bool _687 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _689 = _685 || _687;
    float _691 = float(_689);
    float _693 = 1.0 / _639;
    float _695 = _663 * _649;
    float _697 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _699 = _629 + _697;
    float _701 = -_679;
    float _703 = _701 + 1.0;
    float _705 = 1.0 / _657;
    float _707 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _709 = _629 + _707;
    float _711 = _699 * _659;
    bool _713 = _629 >= (*spvDescriptorSet0.vp_c9)._m0[150].w;
    bool _715 = isnan(_629);
    bool _717 = _713 || _715;
    bool _719 = isnan((*spvDescriptorSet0.vp_c9)._m0[150].w);
    bool _721 = _717 || _719;
    float _723 = float(_721);
    float _725 = 1.0 / _643;
    float _727 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _729 = _629 + _727;
    float _731 = _709 * _693;
    float _733 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _735 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _733;
    float _737 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _739 = _737 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _741 = _629 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _743 = isnan(_629);
    bool _745 = _741 || _743;
    bool _747 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _749 = _745 || _747;
    float _751 = float(_749);
    float _753 = 1.0 / _653;
    float _755 = _729 * _705;
    float _757 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _759 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _757;
    float _761 = fma(_739, _711, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    int _763 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _765 = _763 != 0;
    float _767 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _769 = _629 + _767;
    int _771 = as_type<int>(_631) & 1;
    bool _773 = _771 != 0;
    int _775 = as_type<int>(_631) & 2;
    bool _777 = _775 != 0;
    float _779 = _769 * _725;
    float _781 = 1.0 / _667;
    float _783 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _785 = _629 + _783;
    float _787 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _789 = _629 + _787;
    float _791 = fma(_735, _779, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _793 = fma(_759, _779, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _795 = _629 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _797 = isnan(_629);
    bool _799 = _795 || _797;
    bool _801 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _803 = _799 || _801;
    float _805 = float(_803);
    float _807 = _785 * _753;
    bool _809 = _629 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _811 = isnan(_629);
    bool _813 = _809 || _811;
    bool _815 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _817 = _813 || _815;
    float _819 = float(_817);
    float _821 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _823 = _821 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _825 = -_723;
    float _827 = _825 + 1.0;
    float _829 = -_819;
    float _831 = _829 + 1.0;
    float _833 = fma(_823, _711, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _835 = -_751;
    float _837 = _835 + 1.0;
    float _839 = _751 * _827;
    float _841 = _789 * _781;
    float _843 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _845 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _843;
    float _847 = _805 * _837;
    float _849 = -_805;
    float _851 = _849 + 1.0;
    float _853 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _855 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _853;
    float _857 = fma(_845, _695, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _859 = _819 * _851;
    float _861 = fma(_855, _695, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    bool _863 = _629 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _865 = isnan(_629);
    bool _867 = _863 || _865;
    bool _869 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _871 = _867 || _869;
    float _873 = float(_871);
    float _875 = _679 * _831;
    float _877 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _879 = _877 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _881 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _883 = _881 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    bool _885 = _629 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _887 = isnan(_629);
    bool _889 = _885 || _887;
    bool _891 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _893 = _889 || _891;
    float _895 = float(_893);
    float _897 = _873 * _703;
    float _899 = -_873;
    float _901 = _899 + 1.0;
    float _903 = fma(_879, _731, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _905 = _593 * _593;
    float _907 = fma(_883, _731, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _909 = _691 * _901;
    float _911 = -_691;
    float _913 = _911 + 1.0;
    float _915 = fma(_595, _595, _905);
    float _917 = _895 * _913;
    float _919 = fma(_597, _597, _915);
    float _921 = -_895;
    float _923 = _921 + 1.0;
    float _925 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _927 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _925;
    float _929 = _791 * _917;
    float _931 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _933 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _931;
    float _935 = _793 * _917;
    float _937 = rsqrt(_919);
    float _939 = fma(_923, (*spvDescriptorSet0.vp_c9)._m0[143].x, _929);
    float _941 = fma(_927, _807, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _943 = fma(_933, _807, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _945 = fma(_923, (*spvDescriptorSet0.vp_c9)._m0[143].y, _935);
    float _947 = fma(_761, _909, _939);
    float _949 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _951 = _949 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _953 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _955 = _953 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _957 = fma(_833, _909, _945);
    float _959 = fma(_861, _897, _947);
    float _961 = fma(_951, _755, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _963 = fma(_955, _755, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _965 = fma(_857, _897, _957);
    float _967 = fma(_907, _875, _959);
    float _969 = _937 * _597;
    float _971 = _937 * _595;
    float _973 = _937 * _593;
    float _975 = fma(_903, _875, _965);
    float _977 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _979 = _969 * _977;
    float _981 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _983 = _971 * _981;
    float _985 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _987 = _973 * _985;
    float _989 = in.m_51.x;
    float _991 = in.m_51.y;
    float _993 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _995 = -_979;
    float _997 = fma(_971, _993, _995);
    float _999 = fma(_941, _859, _967);
    float _1001 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1003 = -_987;
    float _1005 = fma(_969, _1001, _1003);
    float _1007 = -(*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _1009 = (*spvDescriptorSet0.vp_c9)._m0[150].x + _1007;
    float _1011 = _997 * _997;
    float _1013 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1015 = -_983;
    float _1017 = fma(_973, _1013, _1015);
    float _1019 = fma(_943, _859, _975);
    float _1021 = fma(_1005, _1005, _1011);
    float _1023 = fma(_1009, _841, (*spvDescriptorSet0.vp_c9)._m0[149].x);
    float _1025 = -(*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _1027 = (*spvDescriptorSet0.vp_c9)._m0[150].y + _1025;
    float _1029 = fma(_961, _847, _999);
    float _1031 = fma(_1017, _1017, _1021);
    float _1033 = fma(_963, _847, _1019);
    float _1035 = fma(_1027, _841, (*spvDescriptorSet0.vp_c9)._m0[149].y);
    float _1037 = fma(_1023, _839, _1029);
    float _1039 = rsqrt(_1031);
    float _1041 = fma(_1035, _839, _1033);
    float _1043 = fma(_723, (*spvDescriptorSet0.vp_c9)._m0[150].x, _1037);
    bool _1045 = !_773;
    float _1047 = _1045 ? (-0.5) : 0.5;
    float _1049 = fma(_723, (*spvDescriptorSet0.vp_c9)._m0[150].y, _1041);
    int _1051 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1053 = _1051 != 0;
    float _1055 = _1043 * _989;
    int _1057 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1059 = _1057 != 0;
    float _1061 = _1049 * _991;
    int _1063 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1065 = _1063 != 0;
    float _1067 = _1031;
    float _1069 = _969;
    if (!_765)
    {
        float _1071 = in.m_53.y;
        _1067 = _1071;
    }
    float _1073 = _1067;
    int _1075 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1077 = _1075 != 0;
    float _1079 = _1061 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _1081 = !_777;
    float _1083 = _1081 ? (-0.5) : 0.5;
    float _1085 = _1005 * _1039;
    float _1087 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1047);
    float _1089 = _1055 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1091 = _1017 * _1039;
    float _1093 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1083);
    float _1095 = _997 * _1039;
    float _1097 = _1089 * _1087;
    float _1099 = _411 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1101 = _1079 * _1093;
    float _1103 = _973 * _1091;
    float _1105 = _411 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1107 = fma(_409, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1099);
    float _1109 = _1101 * _971;
    float _1111 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1113 = -_1103;
    float _1115 = fma(_969, _1095, _1113);
    float _1117 = _971 * _1095;
    float _1119 = fma(_1097, _1085, _1109);
    float _1121 = _1101 * _969;
    float _1123 = fma(_409, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1105);
    float _1125 = in.m_53.z;
    float _1127 = fma(_1111, _1115, _1119);
    float _1129 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1107);
    float _1131 = -_1117;
    float _1133 = fma(_973, _1085, _1131);
    float _1135 = fma(_1097, _1091, _1121);
    float _1137 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1123);
    float _1139 = _411 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1141 = in.m_53.x;
    float _1143 = _1129 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1145 = fma(_1111, _1133, _1135);
    float _1147 = _1137 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1149 = fma(_409, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1139);
    float _1151 = _1143 + _1127;
    float _1153 = _1117;
    float _1155 = _1083;
    float _1157 = _1151;
    if (!_765)
    {
        _1153 = _1073;
    }
    float _1159 = _1153;
    float _1161 = _1147 + _1145;
    float _1163 = in.m_53.w;
    float _1165 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1167 = _1151 + _1165;
    float _1169 = _969 * _1085;
    float _1171 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1173 = _1161 + _1171;
    float _1175 = _1159;
    float _1177 = _1073;
    if (_765)
    {
        float _1179 = in.m_53.x;
        float _1181 = in.m_53.y;
        _1175 = _1179;
        _1177 = _1181;
    }
    float _1183 = _1175;
    float _1185 = _1177;
    float _1187 = _1167 * _1167;
    float _1189 = _1101 * _973;
    float _1191 = _1173 * _1173;
    float _1193 = -_1169;
    float _1195 = fma(_971, _1091, _1193);
    bool _1197 = _1125 > 0.5;
    float _1199 = fma(_1097, _1095, _1189);
    float _1201 = _1187 + _1191;
    if (!_765)
    {
        _1069 = _1125;
    }
    float _1203 = _1069;
    float _1205 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1207 = -_1047;
    float _1209 = _1197 ? _1207 : _1047;
    float _1211 = fma(_1111, _1195, _1199);
    bool _1213 = _1141 > 0.5;
    float _1215 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1149);
    bool _1217 = !_1053;
    float _1219 = _1217 ? _1047 : _1209;
    float _1221 = _1209;
    float _1223 = _1203;
    if (!_765)
    {
        _1221 = _1125;
    }
    float _1225 = _1221;
    float _1227 = sqrt(_1201);
    float _1229 = -_1047;
    int _1231 = _1213 ? as_type<int>(_1229) : as_type<int>(_1047);
    float _1233 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1235 = _1225;
    if (_765)
    {
        _1235 = _1185;
    }
    float _1237 = _1235;
    float _1239 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    if (_765)
    {
        _1223 = _1185;
    }
    float _1241 = _1223;
    float _1243 = fma(_1183, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1233);
    bool _1245 = _1185 > 0.5;
    float _1247 = _1183 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1249 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _1251 = _1163 > 0.5;
    float _1253 = _1241 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _1255 = _1227 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1257 = -_1249;
    float _1259 = fma(_1247, 2.0, _1257);
    float _1261 = _1215 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1263 = !_1065;
    float _1265 = _1263 ? _1047 : as_type<float>(_1231);
    float _1267 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1269 = -_1083;
    int _1271 = _1251 ? as_type<int>(_1269) : as_type<int>(_1083);
    float _1273 = _1261 + _1211;
    float _1275 = -_1083;
    int _1277 = _1245 ? as_type<int>(_1275) : as_type<int>(_1083);
    float _1279 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1281 = fma(_1253, -2.0, _1267);
    bool _1283 = !_1059;
    float _1285 = _1283 ? _1083 : as_type<float>(_1271);
    bool _1287 = !_1077;
    float _1289 = _1287 ? _1083 : as_type<float>(_1277);
    float _1291 = fma(_1237, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1279);
    float _1293 = _1267;
    float _1295 = _1253;
    float _1297 = (*spvDescriptorSet0.vp_c9)._m0[82].y;
    if (!_1255)
    {
        _1293 = _1151;
    }
    float _1299 = _1293;
    float _1301 = _1299;
    if (!_1255)
    {
        _1295 = _1191;
    }
    float _1303 = _1295;
    float _1305 = _1303;
    if (!_1255)
    {
        _1297 = _1187;
    }
    float _1307 = _1297;
    float _1309 = _1307;
    if (!_1255)
    {
        _1155 = _1161;
    }
    float _1311 = _1155;
    float _1313 = _1311;
    if (!_1255)
    {
        _1157 = _1273;
    }
    float _1315 = _1157;
    bool _1317 = !_1255;
    float _1319 = _1315;
    if (!_1317)
    {
        float _1321 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1323 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1325 = _1227 + _1323;
        float _1327 = _1273 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1329 = rsqrt(_1201);
        float _1331 = _1325 * _1321;
        float _1333 = _1331 * 0.15915493667125701904296875;
        float _1335 = _1333 * 6.283185482025146484375;
        float _1337 = sin(_1335);
        float _1339 = _1333 * 6.283185482025146484375;
        float _1341 = cos(_1339);
        float _1343 = fma(_1337, _1327, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1345 = _1329 * _1343;
        float _1347 = _1341 + (-1.0);
        float _1349 = fma(_1167, _1345, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1351 = fma(_1173, _1345, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1353 = _1347 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1355 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1357 = _1349 + _1355;
        float _1359 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1361 = _1351 + _1359;
        float _1363 = fma(_1273, _1341, _1353);
        float _1365 = _1357 * _1357;
        float _1367 = _1361 * _1361;
        _1319 = _1363;
        _1309 = _1365;
        _1305 = _1367;
        _1301 = _1349;
        _1313 = _1351;
    }
    float _1369 = _1319;
    float _1371 = _1309;
    float _1373 = _1305;
    float _1375 = _1301;
    float _1377 = _1313;
    float _1379 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1381 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1383 = _1369 + _1381;
    float _1385 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1243);
    float _1387 = -_117;
    float _1389 = fma(_1387, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1259);
    float _1391 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1291);
    float _1393 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1281);
    float _1395 = _1239 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1397 = fma(_1383, _1383, _1371);
    float _1399 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1401 = _1265 + 0.5;
    float _1403 = _1205 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1405 = _1397 + _1373;
    float _1407 = _1219 + 0.5;
    float _1409 = _1285 + (-0.5);
    float _1411 = _1401 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1413 = -_1289;
    float _1415 = _1413 + 0.5;
    float _1417 = fma(_1403, _1407, _1389);
    float _1419 = -_1395;
    float _1421 = -_1393;
    float _1423 = fma(_1419, _1409, _1421);
    float _1425 = _1411 * _1379;
    float _1427 = -_1385;
    float _1429 = _1427 + 1.0;
    float _1431 = sqrt(_1405);
    float _1433 = -_1391;
    float _1435 = _1433 + 1.0;
    float _1437 = _1415 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1439 = -_1429;
    float _1441 = fma(_1219, _1439, _1417);
    float _1443 = fma(_1285, _1435, _1423);
    float _1445 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1447 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1449 = _1437 * _1399;
    out.m_58.w = _1445;
    out.m_60.w = _1447;
    bool _1451 = _1431 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1453 = isnan(_1431);
    bool _1455 = _1451 || _1453;
    bool _1457 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1459 = _1455 || _1457;
    out.m_62.x = _1425;
    out.m_62.y = _1449;
    out.m_62.z = _1441;
    out.m_62.w = _1443;
    float _1461 = _1423;
    float _1463 = _1377;
    float _1465 = _1397;
    if (!_1459)
    {
        _1461 = 1.0;
    }
    float _1467 = _1461;
    bool _1469 = !_1459;
    float _1471 = _1467;
    if (!_1469)
    {
        bool _1473 = _1431 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1475 = isnan(_1431);
        bool _1477 = _1473 || _1475;
        bool _1479 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1481 = _1477 || _1479;
        if (!_1481)
        {
            float _1483 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1485 = _1431 + _1483;
            float _1487 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1489 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1487;
            float _1491 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1493 = _1491 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1495 = 1.0 / _1489;
            float _1497 = _1485 * _1495;
            float _1499 = fma(_1497, _1493, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1471 = _1499;
            _1501 = true;
        }
        else
        {
            bool _1503 = _1431 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1505 = isnan(_1431);
            bool _1507 = _1503 || _1505;
            bool _1509 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1511 = _1507 || _1509;
            if (!_1511)
            {
                float _1513 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1515 = _1431 + _1513;
                float _1517 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1519 = _1517 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1521 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1523 = _1521 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1525 = 1.0 / _1519;
                float _1527 = _1515 * _1525;
                float _1529 = fma(_1527, _1523, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1471 = _1529;
                _1501 = true;
            }
            else
            {
                _1471 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1501 = false;
    float _1531 = _1471;
    float _1533 = _1261 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1535 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1537 = _1375 + _1535;
    float _1539 = fma(_1143, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1533);
    bool _1541 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1543 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1545 = _1541 || _1543;
    bool _1547 = isnan(0.5);
    bool _1549 = _1545 || _1547;
    float _1551 = _1261 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1553 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1555 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1557 = _1553 || _1555;
    bool _1559 = isnan(0.5);
    bool _1561 = _1557 || _1559;
    float _1563 = fma(_1147, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1539);
    float _1565 = fma(_1537, _1531, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1567 = fma(_1143, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1551);
    float _1569 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1571 = _1369 + _1569;
    float _1573 = _1563 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1575 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1577 = _1377 + _1575;
    float _1579 = fma(_1147, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1567);
    float _1581 = fma(_1571, _1531, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1583 = 1.0 / _1573;
    float _1585 = fma(_1577, _1531, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1587 = _1579 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1589 = _1571;
    float _1591 = _1537;
    float _1593 = _1585;
    float _1595 = _1531;
    float _1597 = _1573;
    if (_1561)
    {
        _1463 = _1565;
    }
    float _1599 = _1463;
    float _1601 = _1587 + _1573;
    float _1603 = _1599;
    if (_1561)
    {
        _1589 = _1581;
    }
    float _1605 = _1589;
    float _1607 = _1605;
    if (_1561)
    {
        _1591 = _1585;
    }
    float _1609 = _1591;
    float _1611 = _1609;
    if (!_1561)
    {
        float _1613 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1615 = _1261 + _1613;
        float _1617 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1619 = _1143 + _1617;
        float _1621 = -_1143;
        float _1623 = _1621 + _1565;
        float _1625 = -_1261;
        float _1627 = _1625 + _1581;
        float _1629 = _1615 * _1615;
        float _1631 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1633 = _1147 + _1631;
        float _1635 = -_1147;
        float _1637 = _1635 + _1585;
        float _1639 = fma(_1619, _1619, _1629);
        float _1641 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1643 = fma(_1633, _1633, _1639);
        float _1645 = sqrt(_1643);
        float _1647 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        bool _1649 = _1645 > (*spvDescriptorSet0.vp_c9)._m0[199].x;
        bool _1651 = isnan(_1645);
        bool _1653 = _1649 || _1651;
        bool _1655 = isnan((*spvDescriptorSet0.vp_c9)._m0[199].x);
        bool _1657 = _1653 || _1655;
        float _1659 = precise::min(_1645, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1661 = _1659 * _1641;
        float _1663 = _1647 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1665 = _1663 * _1661;
        float _1667 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
        float _1669 = _1641;
        float _1671 = _1645;
        float _1673 = _1663;
        _1593 = _1637;
        if (_1657)
        {
            float _1675 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].y;
            _1667 = _1675;
        }
        float _1677 = _1667;
        if (_1657)
        {
            float _1679 = precise::max(_1645, (*spvDescriptorSet0.vp_c9)._m0[199].y);
            _1669 = _1679;
        }
        float _1681 = _1669;
        float _1683 = fma(_1623, _1665, _1143);
        float _1685 = _1683;
        if (_1657)
        {
            float _1687 = _1681 * _1677;
            _1671 = _1687;
        }
        float _1689 = _1671;
        float _1691 = fma(_1627, _1665, _1261);
        float _1693 = fma(_1637, _1665, _1147);
        float _1695 = _1689;
        float _1697 = _1691;
        if (_1657)
        {
            float _1699 = _1663 * _1689;
            _1695 = _1699;
        }
        float _1701 = _1695;
        _1595 = _1701;
        if (!_1657)
        {
            _1673 = _1693;
        }
        float _1703 = _1673;
        _1611 = _1703;
        if (_1657)
        {
            float _1705 = fma(_1623, _1701, _1143);
            _1685 = _1705;
        }
        float _1707 = _1685;
        _1603 = _1707;
        if (_1657)
        {
            float _1709 = fma(_1627, _1701, _1261);
            _1697 = _1709;
        }
        float _1711 = _1697;
        _1607 = _1711;
        if (_1657)
        {
            float _1713 = fma(_1637, _1701, _1147);
            _1611 = _1713;
        }
    }
    float _1715 = _1607;
    float _1717 = _1603;
    float _1719 = _1611;
    float _1721 = _1593;
    float _1723 = _1595;
    float _1725 = _1723;
    float _1727 = _1721;
    if (_1549)
    {
        _1725 = 1.0;
    }
    float _1729 = _1725;
    float _1731 = _1601 * _1583;
    float _1733 = _1731 * 0.5;
    float _1735 = _1729;
    if (!_1549)
    {
        float _1737 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1739 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1741 = fma(_1733, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1739);
        float _1743 = _1737 * 0.15915493667125701904296875;
        float _1745 = _1743 * 6.283185482025146484375;
        float _1747 = cos(_1745);
        float _1749 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1751 = _1749 * 0.15915493667125701904296875;
        float _1753 = _1743 * 6.283185482025146484375;
        float _1755 = sin(_1753);
        float _1757 = 1.0 / _1747;
        float _1759 = _1751 * 6.283185482025146484375;
        float _1761 = cos(_1759);
        float _1763 = _1755 * _1757;
        float _1765 = 1.0 / _1741;
        float _1767 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1769 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1767;
        float _1771 = _1761 * _1763;
        float _1773 = _1751 * 6.283185482025146484375;
        float _1775 = sin(_1773);
        float _1777 = 1.0 / _1771;
        float _1779 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1781 = _1765 * _1779;
        float _1783 = 1.0 / _1769;
        float _1785 = _1775 * _1777;
        float _1787 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1789 = fma(_1785, _1781, _1787);
        float _1791 = _1789 * _1783;
        float _1793 = precise::clamp(_1791, 0.0, 1.0);
        float _1795 = -_1793;
        float _1797 = _1795 + 1.0;
        _1597 = _1783;
        _1735 = _1797;
    }
    float _1799 = _1597;
    float _1801 = _1735;
    float _1803 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1805 = _1715 + _1803;
    float _1807 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1809 = _1717 + _1807;
    float _1811 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1813 = _1719 + _1811;
    float _1815 = _1805 * _1805;
    float _1817 = fma(_1809, _1809, _1815);
    float _1819 = fma(_1813, _1813, _1817);
    float _1821 = rsqrt(_1819);
    float _1823 = _1821 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1825 = _1809 * _1823;
    float _1827 = _1813 * _1823;
    float _1829 = _1825 * _1825;
    float _1831 = _1827 * _1827;
    float _1833 = _1829 + _1831;
    float _1835 = sqrt(_1833);
    bool _1837 = _1835 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1839 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1841 = _1835 + _1839;
    float _1843 = _1813;
    float _1845 = _1799;
    float _1847 = _1841;
    float _1849 = _1805;
    float _1851 = _1825;
    if (_1837)
    {
        float _1853 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1843 = _1853;
    }
    float _1855 = _1843;
    if (_1837)
    {
        float _1857 = rsqrt(_1833);
        _1845 = _1857;
    }
    float _1859 = _1845;
    float _1861 = _1859;
    if (_1837)
    {
        float _1863 = _1841 * _1855;
        _1847 = _1863;
    }
    float _1865 = _1847;
    if (_1837)
    {
        float _1867 = _1865 * 0.15915493667125701904296875;
        _1727 = _1867;
    }
    float _1869 = _1727;
    float _1871 = _1815;
    if (_1837)
    {
        float _1873 = _1869 * 6.283185482025146484375;
        float _1875 = sin(_1873);
        _1871 = _1875;
    }
    float _1877 = _1871;
    float _1879 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1881 = precise::max(0.0, _1879);
    float _1883 = _1821;
    float _1885 = _1881;
    float _1887 = _1879;
    if (_1837)
    {
        float _1889 = _1869 * 6.283185482025146484375;
        float _1891 = cos(_1889);
        _1883 = _1891;
    }
    float _1893 = _1883;
    float _1895 = -_1823;
    float _1897 = -_1881;
    float _1899 = fma(_1805, _1895, _1897);
    if (!_1837)
    {
        _1885 = _1827;
    }
    float _1901 = _1885;
    float _1903 = _1901;
    if (_1837)
    {
        float _1905 = _1899 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1887 = _1905;
    }
    float _1907 = _1887;
    float _1909 = sqrt(_1819);
    float _1911 = _1877;
    float _1913 = _1907;
    if (_1837)
    {
        float _1915 = fma(_1877, _1907, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1849 = _1915;
    }
    float _1917 = _1849;
    float _1919 = _1917;
    if (!_1837)
    {
        _1911 = _1899;
    }
    float _1921 = _1911;
    float _1923 = _1921;
    if (_1837)
    {
        float _1925 = _1893 + (-1.0);
        _1913 = _1925;
    }
    float _1927 = _1913;
    float _1929 = _1927;
    if (_1837)
    {
        float _1931 = _1859 * _1917;
        _1465 = _1931;
    }
    float _1933 = _1465;
    if (!_1837)
    {
        _1919 = _1831;
    }
    float _1935 = _1919;
    float _1937 = _1935;
    if (_1837)
    {
        float _1939 = _1927 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1861 = _1939;
    }
    float _1941 = _1861;
    if (_1837)
    {
        float _1943 = _1825 * _1933;
        _1851 = _1943;
    }
    float _1945 = _1851;
    if (!_1837)
    {
        _1929 = _1829;
    }
    float _1947 = _1929;
    float _1949 = _1947;
    if (_1837)
    {
        float _1951 = _1827 * _1933;
        _1903 = _1951;
    }
    float _1953 = _1903;
    if (_1837)
    {
        float _1955 = fma(_1899, _1893, _1941);
        _1923 = _1955;
    }
    float _1957 = _1923;
    if (_1837)
    {
        float _1959 = _1945 * _1945;
        _1949 = _1959;
    }
    float _1961 = _1949;
    if (_1837)
    {
        float _1963 = _1953 * _1953;
        _1937 = _1963;
    }
    float _1965 = _1937;
    float _1967 = fma(_1957, _1957, _1961);
    float _1969 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1971 = fma(_1909, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1969);
    float _1973 = precise::clamp(_1971, 0.0, 1.0);
    float _1975 = _1715 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1977 = _1967 + _1965;
    float _1979 = _1715 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1981 = -_1973;
    float _1983 = _1981 + 1.0;
    float _1985 = fma(_1717, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1975);
    float _1987 = rsqrt(_1977);
    float _1989 = fma(_1717, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1979);
    float _1991 = _1715 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1993 = _1715 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1995 = fma(_1719, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1985);
    float _1997 = fma(_1719, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1989);
    float _1999 = fma(_1717, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1991);
    float _2001 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2003 = abs(_1983);
    float _2005 = log2(_2003);
    float _2007 = fma(_1717, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1993);
    float _2009 = fma(_1719, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1999);
    float _2011 = _1995 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2013 = _1997 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2015 = fma(_1719, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2007);
    float _2017 = _2009 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2019 = _2011 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2021 = _1987 * _1945;
    float _2023 = _1987 * _1957;
    float _2025 = _1987 * _1953;
    float _2027 = fma(_2017, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2019);
    float _2029 = _2021 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2031 = _2013 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2033 = _2015 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2035 = fma(_2013, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2027);
    float _2037 = -_2029;
    float _2039 = fma(_2023, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2037);
    float _2041 = -_2031;
    float _2043 = fma(_2041, _2001, 1.0);
    float _2045 = _2005 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2047 = fma(_2033, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2035);
    float _2049 = -_2025;
    float _2051 = fma(_2049, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2039);
    float _2053 = _2011 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2055 = exp2(_2045);
    float _2057 = _2011 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2059 = fma(_2051, -0.5, 0.5);
    float _2061 = fma(_2017, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2053);
    float _2063 = fma(_2051, 0.5, 0.5);
    float _2065 = fma(_2017, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2057);
    float _2067 = _2023 + 1.0;
    float _2069 = fma(_2013, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2061);
    float _2071 = log2(_2043);
    float _2073 = fma(_2013, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2065);
    float _2075 = fma(_2063, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2077 = fma(_2033, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2069);
    float _2079 = fma(_2033, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2073);
    float _2081 = fma(_2063, _2075, -0.212114393711090087890625);
    float _2083 = 1.0 / _2047;
    float _2085 = -_2023;
    float _2087 = fma(_2055, _2067, _2085);
    float _2089 = fma(_2063, _2081, 1.570728778839111328125);
    float _2091 = fma(_2087, 0.5, 0.5);
    float _2093 = sqrt(_2059);
    float _2095 = _2071 * 0.693147182464599609375;
    float _2097 = _2095 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2099 = _2077 * _2083;
    float _2101 = _2079 * _2083;
    float _2103 = fma(_2099, 0.5, 0.5);
    float _2105 = fma(_2101, -0.5, 0.5);
    float _2107 = _2093 * 0.636619746685028076171875;
    float3 _5520 = float3(_2103, _2105, _2097);
    float _2109 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5520, float3(0.0), isnan(_5520)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5520, float3(0.0), isnan(_5520)), level(0.0)).x;
    float3 _5531 = float3(_2103, _2105, _2097);
    float4 _2112 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5531, float3(0.0), isnan(_5531)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5531, float3(0.0), isnan(_5531)), level(0.0)).xyzw;
    float _2114 = _2112.x;
    float _2116 = _2112.y;
    float _2118 = _2112.z;
    float _2120 = _2112.w;
    float _2122 = -_2089;
    float _2124 = fma(_2107, _2122, 1.0);
    float2 _5553 = float2(_2124, _2091);
    float3 _2128 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5553, float2(0.0), isnan(_5553)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5553, float2(0.0), isnan(_5553)), level(0.0)).xyz;
    float _2130 = _2128.x;
    float _2132 = _2128.y;
    float _2134 = _2128.z;
    float _2136 = _2005 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2138 = _2011 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2140 = _1801 > 0.0;
    bool _2142 = isnan(_1801);
    bool _2144 = _2140 || _2142;
    bool _2146 = isnan(0.0);
    bool _2148 = _2144 || _2146;
    float _2150 = _1801 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2152 = fma(_2017, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2138);
    float _2154 = exp2(_2136);
    float _2156 = fma(_2013, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2152);
    float _2158 = fma(_2033, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2156);
    float _2160 = _2158 + _2047;
    out.gl_Position.x = _2077;
    out.gl_Position.y = _2079;
    out.gl_Position.z = _2158;
    out.gl_Position.w = _2047;
    float _2162 = _2160 * 0.5;
    float _2164 = -_2154;
    float _2166 = _2164 + 1.0;
    float _2168 = _2150 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2170 = _2166 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_64.z = _2162;
    out.m_64.w = _2047;
    out.m_47.x = _2168;
    float _2172 = _2170 * _2109;
    float _2174 = -_2170;
    float _2176 = _2174 + 1.0;
    float _2178 = _2120 * _2172;
    float _2180 = _2120 * _2176;
    float _2182 = _2134 * _2172;
    float _2184 = fma(_2130, _2178, _2114);
    float _2186 = fma(_2132, _2178, _2116);
    float _2188 = fma(_2120, _2182, _2118);
    out.m_66.x = _2184;
    out.m_66.y = _2186;
    out.m_66.z = _2188;
    out.m_66.w = _2180;
    if (_2148)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _2190 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2190;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1501 = false;
    bool _621 = false;
    bool _471 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _80 = in.m_44.w;
    float _82 = trunc(_80);
    int _85 = int(_82);
    bool _89 = _85 >= 1;
    float _91 = 0.0;
    if (!_89)
    {
        _91 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _93 = _91;
    if (!_89)
    {
        out.m_47.x = 0.0;
    }
    int _95 = 0;
    if (!_89)
    {
        float _97 = _93 * 5.0;
        _95 = as_type<int>(_97);
    }
    int _99 = _95;
    int _101 = _99;
    if (!_89)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2246 = as_type<float>(_99);
        out.gl_Position.z = _2246;
    }
    if (!_89)
    {
        return out;
    }
    float _103 = in.m_49.w;
    bool _105 = _103 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _107 = isnan(_103);
    bool _109 = _105 || _107;
    bool _111 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _113 = _109 || _111;
    float _115 = -_103;
    float _117 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _119 = 0.0;
    if (_113)
    {
        float _121 = float(_85);
        _119 = _121;
    }
    float _123 = _119;
    bool _125 = _117 >= _123;
    bool _127 = !_113;
    bool _129 = _125 || _127;
    float _131 = 0.0;
    float _133 = _123;
    if (_129)
    {
        _131 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _135 = _131;
    float _137 = _135;
    if (_129)
    {
        out.m_47.x = 0.0;
    }
    if (_129)
    {
        float _139 = _135 * 5.0;
        _101 = as_type<int>(_139);
    }
    int _141 = _101;
    if (_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2316 = as_type<float>(_141);
        out.gl_Position.z = _2316;
    }
    if (_129)
    {
        return out;
    }
    float _143 = in.m_49.x;
    float _145 = in.m_49.y;
    float _147 = in.m_49.z;
    float _149 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _151 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _153 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _155 = _151 || _153;
    bool _157 = isnan(1.0);
    bool _159 = _155 || _157;
    float _161 = 0.0;
    float _163 = _149;
    if (!_159)
    {
        float _165 = _149 * _149;
        float _167 = _165 * 0.5;
        _161 = _167;
    }
    float _169 = _161;
    float _171 = 0.0;
    float _173 = _169;
    if (!_159)
    {
        float _175 = _117 * _117;
        float _177 = _175 * 0.5;
        _171 = _177;
    }
    float _179 = _171;
    if (!_159)
    {
        float _181 = _169 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _173 = _181;
    }
    float _183 = _173;
    bool _185 = !_159;
    float _187 = _183;
    if (!_185)
    {
        float _189 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _191 = log2(_189);
        float _193 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _195 = _193 + 1.0;
        float _197 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _199 = _149 * _191;
        float _201 = 1.0 / _195;
        float _203 = _197 * 0.693147182464599609375;
        float _205 = exp2(_199);
        float _207 = 1.0 / _203;
        float _209 = _205 + (-1.0);
        float _211 = -_209;
        float _213 = fma(_211, _207, _149);
        float _215 = _213 * _201;
        float _217 = _215 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _137 = _207;
        _187 = _217;
        _133 = _205;
    }
    float _219 = _137;
    float _221 = _187;
    float _223 = _133;
    bool _225 = !_159;
    float _227 = _219;
    float _229 = _223;
    if (!_225)
    {
        float _231 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _233 = log2(_231);
        float _235 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _237 = _235 + 1.0;
        float _239 = 1.0 / _237;
        float _241 = _149 * _233;
        float _243 = exp2(_241);
        float _245 = -_243;
        float _247 = _245 + 1.0;
        float _249 = _247 * _239;
        _227 = _243;
        _229 = _237;
        _163 = _249;
    }
    float _251 = _227;
    float _253 = _229;
    float _255 = _163;
    float _257 = _253;
    float _259 = _251;
    if (!_159)
    {
        _257 = _117;
    }
    float _261 = _257;
    float _263 = _221 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _265 = _261;
    if (!_159)
    {
        float _267 = _179 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _259 = _267;
    }
    float _269 = _259;
    bool _271 = !_159;
    float _273 = _269;
    if (!_271)
    {
        float _275 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _277 = log2(_275);
        float _279 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _281 = _279 + 1.0;
        float _283 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _285 = _117 * _277;
        float _287 = 1.0 / _281;
        float _289 = _283 * 0.693147182464599609375;
        float _291 = exp2(_285);
        float _293 = 1.0 / _289;
        float _295 = _291 + (-1.0);
        float _297 = -_295;
        float _299 = fma(_297, _293, _117);
        float _301 = _299 * _287;
        float _303 = _301 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _273 = _303;
    }
    float _305 = _273;
    bool _307 = !_159;
    if (!_307)
    {
        float _309 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _311 = log2(_309);
        float _313 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _315 = _313 + 1.0;
        float _317 = 1.0 / _315;
        float _319 = _117 * _311;
        float _321 = exp2(_319);
        float _323 = -_321;
        float _325 = _323 + 1.0;
        float _327 = _325 * _317;
        _265 = _327;
    }
    float _329 = _265;
    float _331 = _305 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _333 = fma(_255, _145, _263);
    float _335 = _221 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _337 = _305 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _339 = fma(_329, _145, _331);
    float _341 = _221 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _343 = _305 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _345 = fma(_255, _143, _335);
    float _347 = fma(_329, _143, _337);
    float _349 = -_339;
    float _351 = _333 + _349;
    float _353 = fma(_255, _147, _341);
    float _355 = fma(_329, _147, _343);
    float _357 = -_347;
    float _359 = _345 + _357;
    float _361 = _351 * _351;
    float _363 = in.m_51.w;
    float _365 = -_355;
    float _367 = _353 + _365;
    float _369 = _351 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _371 = fma(_359, _359, _361);
    float _373 = _351 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _375 = in.m_44.x;
    float _377 = in.m_44.y;
    float _379 = in.m_44.z;
    float _381 = _351 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _383 = fma(_367, _367, _371);
    float _385 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[4].x, _369);
    float _387 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[5].x, _373);
    float _389 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[6].x, _381);
    float _391 = fma(_367, (*spvDescriptorSet0.vp_c10)._m0[4].z, _385);
    float _393 = sqrt(_383);
    float _395 = fma(_367, (*spvDescriptorSet0.vp_c10)._m0[6].z, _389);
    bool _397 = _393 >= 9.9999999747524270787835121154785e-07;
    bool _399 = isnan(_393);
    bool _401 = _397 || _399;
    bool _403 = isnan(9.9999999747524270787835121154785e-07);
    bool _405 = _401 || _403;
    float _407 = fma(_367, (*spvDescriptorSet0.vp_c10)._m0[5].z, _387);
    float _409 = fma(_345, _363, _375);
    float _411 = fma(_333, _363, _377);
    float _413 = fma(_353, _363, _379);
    float _415 = _389;
    float _417 = _367;
    float _419 = _407;
    if (_405)
    {
        _415 = _407;
    }
    float _421 = _415;
    float _423 = _421;
    if (_405)
    {
        _417 = _391;
    }
    float _425 = _417;
    float _427 = _425;
    if (_405)
    {
        _419 = _395;
    }
    float _429 = _419;
    float _431 = _429;
    if (!_405)
    {
        bool _433 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _435 = !_433;
        if (!_435)
        {
            float _437 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _439 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _441 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _443 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _437);
            float _445 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _439);
            float _447 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _441);
            float _449 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _443);
            float _451 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _445);
            float _453 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _447);
            float _455 = _449 * _449;
            float _457 = fma(_451, _451, _455);
            float _459 = fma(_453, _453, _457);
            float _461 = rsqrt(_459);
            float _463 = _461 * 9.9999999747524270787835121154785e-07;
            float _465 = _451 * _463;
            float _467 = _449 * _463;
            float _469 = _453 * _463;
            _423 = _467;
            _427 = _465;
            _431 = _469;
            _471 = true;
        }
        else
        {
            float _473 = _145 * _145;
            float _475 = fma(_143, _143, _473);
            float _477 = fma(_147, _147, _475);
            float _479 = sqrt(_477);
            bool _481 = _479 >= 9.9999999747524270787835121154785e-07;
            bool _483 = isnan(_479);
            bool _485 = _481 || _483;
            bool _487 = isnan(9.9999999747524270787835121154785e-07);
            bool _489 = _485 || _487;
            if (!_489)
            {
                float _491 = _377 * _377;
                float _493 = fma(_375, _375, _491);
                float _495 = fma(_379, _379, _493);
                float _497 = sqrt(_495);
                bool _499 = _497 >= 9.9999999747524270787835121154785e-07;
                bool _501 = isnan(_497);
                bool _503 = _499 || _501;
                bool _505 = isnan(9.9999999747524270787835121154785e-07);
                bool _507 = _503 || _505;
                if (!_507)
                {
                    float _509 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _511 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _509);
                    float _513 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _511);
                    float _515 = rsqrt(_513);
                    float _517 = _515 * 9.9999999747524270787835121154785e-07;
                    float _519 = _517 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _521 = _517 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _523 = _517 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _423 = _521;
                    _427 = _519;
                    _431 = _523;
                    _471 = true;
                }
                else
                {
                    float _525 = _377 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _527 = _377 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _529 = _377 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _531 = fma(_375, (*spvDescriptorSet0.vp_c10)._m0[5].x, _525);
                    float _533 = fma(_375, (*spvDescriptorSet0.vp_c10)._m0[4].x, _527);
                    float _535 = fma(_375, (*spvDescriptorSet0.vp_c10)._m0[6].x, _529);
                    float _537 = fma(_379, (*spvDescriptorSet0.vp_c10)._m0[5].z, _531);
                    float _539 = fma(_379, (*spvDescriptorSet0.vp_c10)._m0[4].z, _533);
                    float _541 = fma(_379, (*spvDescriptorSet0.vp_c10)._m0[6].z, _535);
                    float _543 = _537 * _537;
                    float _545 = fma(_539, _539, _543);
                    float _547 = fma(_541, _541, _545);
                    float _549 = rsqrt(_547);
                    float _551 = _549 * 9.9999999747524270787835121154785e-07;
                    float _553 = _539 * _551;
                    float _555 = _537 * _551;
                    float _557 = _541 * _551;
                    _423 = _555;
                    _427 = _553;
                    _431 = _557;
                    _471 = true;
                }
            }
            else
            {
                float _559 = _145 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _561 = _145 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _563 = _145 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _565 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[5].x, _559);
                float _567 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[4].x, _561);
                float _569 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[6].x, _563);
                float _571 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[5].z, _565);
                float _573 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[4].z, _567);
                float _575 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[6].z, _569);
                float _577 = _571 * _571;
                float _579 = fma(_573, _573, _577);
                float _581 = fma(_575, _575, _579);
                float _583 = rsqrt(_581);
                float _585 = _583 * 9.9999999747524270787835121154785e-07;
                float _587 = _573 * _585;
                float _589 = _571 * _585;
                float _591 = _575 * _585;
                _423 = _589;
                _427 = _587;
                _431 = _591;
            }
        }
    }
    _471 = false;
    float _593 = _423;
    float _595 = _427;
    float _597 = _431;
    bool _599 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _601 = !_599;
    float _619;
    if (!_601)
    {
        float _603 = in.m_53.x;
        float _605 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _607 = _603 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _609 = fma(_607, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _611 = _609 * _605;
        float _613 = floor(_611);
        float _615 = -_613;
        float _617 = _611 + _615;
        _619 = _617;
        _621 = true;
    }
    else
    {
        float _623 = float(_85);
        float _625 = 1.0 / _623;
        float _627 = _117 * _625;
        _619 = _627;
    }
    _621 = false;
    float _629 = _619;
    float _631 = as_type<float>(int(gl_VertexIndex));
    float _633 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _635 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _633;
    float _637 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _639 = _637 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _641 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _643 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _641;
    float _645 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _647 = _645 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _649 = 1.0 / _635;
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _653 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _651;
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _657 = _655 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _659 = 1.0 / _647;
    float _661 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _663 = _629 + _661;
    float _665 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _667 = (*spvDescriptorSet0.vp_c9)._m0[150].w + _665;
    bool _669 = _629 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _671 = isnan(_629);
    bool _673 = _669 || _671;
    bool _675 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _677 = _673 || _675;
    float _679 = float(_677);
    bool _681 = _629 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _683 = isnan(_629);
    bool _685 = _681 || _683;
    bool _687 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _689 = _685 || _687;
    float _691 = float(_689);
    float _693 = 1.0 / _639;
    float _695 = _663 * _649;
    float _697 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _699 = _629 + _697;
    float _701 = -_679;
    float _703 = _701 + 1.0;
    float _705 = 1.0 / _657;
    float _707 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _709 = _629 + _707;
    float _711 = _699 * _659;
    bool _713 = _629 >= (*spvDescriptorSet0.vp_c9)._m0[150].w;
    bool _715 = isnan(_629);
    bool _717 = _713 || _715;
    bool _719 = isnan((*spvDescriptorSet0.vp_c9)._m0[150].w);
    bool _721 = _717 || _719;
    float _723 = float(_721);
    float _725 = 1.0 / _643;
    float _727 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _729 = _629 + _727;
    float _731 = _709 * _693;
    float _733 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _735 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _733;
    float _737 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _739 = _737 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _741 = _629 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _743 = isnan(_629);
    bool _745 = _741 || _743;
    bool _747 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _749 = _745 || _747;
    float _751 = float(_749);
    float _753 = 1.0 / _653;
    float _755 = _729 * _705;
    float _757 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _759 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _757;
    float _761 = fma(_739, _711, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    int _763 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _765 = _763 != 0;
    float _767 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _769 = _629 + _767;
    int _771 = as_type<int>(_631) & 1;
    bool _773 = _771 != 0;
    int _775 = as_type<int>(_631) & 2;
    bool _777 = _775 != 0;
    float _779 = _769 * _725;
    float _781 = 1.0 / _667;
    float _783 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _785 = _629 + _783;
    float _787 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _789 = _629 + _787;
    float _791 = fma(_735, _779, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _793 = fma(_759, _779, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _795 = _629 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _797 = isnan(_629);
    bool _799 = _795 || _797;
    bool _801 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _803 = _799 || _801;
    float _805 = float(_803);
    float _807 = _785 * _753;
    bool _809 = _629 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _811 = isnan(_629);
    bool _813 = _809 || _811;
    bool _815 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _817 = _813 || _815;
    float _819 = float(_817);
    float _821 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _823 = _821 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _825 = -_723;
    float _827 = _825 + 1.0;
    float _829 = -_819;
    float _831 = _829 + 1.0;
    float _833 = fma(_823, _711, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _835 = -_751;
    float _837 = _835 + 1.0;
    float _839 = _751 * _827;
    float _841 = _789 * _781;
    float _843 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _845 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _843;
    float _847 = _805 * _837;
    float _849 = -_805;
    float _851 = _849 + 1.0;
    float _853 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _855 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _853;
    float _857 = fma(_845, _695, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _859 = _819 * _851;
    float _861 = fma(_855, _695, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    bool _863 = _629 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _865 = isnan(_629);
    bool _867 = _863 || _865;
    bool _869 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _871 = _867 || _869;
    float _873 = float(_871);
    float _875 = _679 * _831;
    float _877 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _879 = _877 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _881 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _883 = _881 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    bool _885 = _629 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _887 = isnan(_629);
    bool _889 = _885 || _887;
    bool _891 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _893 = _889 || _891;
    float _895 = float(_893);
    float _897 = _873 * _703;
    float _899 = -_873;
    float _901 = _899 + 1.0;
    float _903 = fma(_879, _731, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _905 = _593 * _593;
    float _907 = fma(_883, _731, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _909 = _691 * _901;
    float _911 = -_691;
    float _913 = _911 + 1.0;
    float _915 = fma(_595, _595, _905);
    float _917 = _895 * _913;
    float _919 = fma(_597, _597, _915);
    float _921 = -_895;
    float _923 = _921 + 1.0;
    float _925 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _927 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _925;
    float _929 = _791 * _917;
    float _931 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _933 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _931;
    float _935 = _793 * _917;
    float _937 = rsqrt(_919);
    float _939 = fma(_923, (*spvDescriptorSet0.vp_c9)._m0[143].x, _929);
    float _941 = fma(_927, _807, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _943 = fma(_933, _807, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _945 = fma(_923, (*spvDescriptorSet0.vp_c9)._m0[143].y, _935);
    float _947 = fma(_761, _909, _939);
    float _949 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _951 = _949 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _953 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _955 = _953 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _957 = fma(_833, _909, _945);
    float _959 = fma(_861, _897, _947);
    float _961 = fma(_951, _755, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _963 = fma(_955, _755, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _965 = fma(_857, _897, _957);
    float _967 = fma(_907, _875, _959);
    float _969 = _937 * _597;
    float _971 = _937 * _595;
    float _973 = _937 * _593;
    float _975 = fma(_903, _875, _965);
    float _977 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _979 = _969 * _977;
    float _981 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _983 = _971 * _981;
    float _985 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _987 = _973 * _985;
    float _989 = in.m_51.x;
    float _991 = in.m_51.y;
    float _993 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _995 = -_979;
    float _997 = fma(_971, _993, _995);
    float _999 = fma(_941, _859, _967);
    float _1001 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1003 = -_987;
    float _1005 = fma(_969, _1001, _1003);
    float _1007 = -(*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _1009 = (*spvDescriptorSet0.vp_c9)._m0[150].x + _1007;
    float _1011 = _997 * _997;
    float _1013 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1015 = -_983;
    float _1017 = fma(_973, _1013, _1015);
    float _1019 = fma(_943, _859, _975);
    float _1021 = fma(_1005, _1005, _1011);
    float _1023 = fma(_1009, _841, (*spvDescriptorSet0.vp_c9)._m0[149].x);
    float _1025 = -(*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _1027 = (*spvDescriptorSet0.vp_c9)._m0[150].y + _1025;
    float _1029 = fma(_961, _847, _999);
    float _1031 = fma(_1017, _1017, _1021);
    float _1033 = fma(_963, _847, _1019);
    float _1035 = fma(_1027, _841, (*spvDescriptorSet0.vp_c9)._m0[149].y);
    float _1037 = fma(_1023, _839, _1029);
    float _1039 = rsqrt(_1031);
    float _1041 = fma(_1035, _839, _1033);
    float _1043 = fma(_723, (*spvDescriptorSet0.vp_c9)._m0[150].x, _1037);
    bool _1045 = !_773;
    float _1047 = _1045 ? (-0.5) : 0.5;
    float _1049 = fma(_723, (*spvDescriptorSet0.vp_c9)._m0[150].y, _1041);
    int _1051 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1053 = _1051 != 0;
    float _1055 = _1043 * _989;
    int _1057 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1059 = _1057 != 0;
    float _1061 = _1049 * _991;
    int _1063 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1065 = _1063 != 0;
    float _1067 = _1031;
    float _1069 = _969;
    if (!_765)
    {
        float _1071 = in.m_53.y;
        _1067 = _1071;
    }
    float _1073 = _1067;
    int _1075 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1077 = _1075 != 0;
    float _1079 = _1061 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _1081 = !_777;
    float _1083 = _1081 ? (-0.5) : 0.5;
    float _1085 = _1005 * _1039;
    float _1087 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1047);
    float _1089 = _1055 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1091 = _1017 * _1039;
    float _1093 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1083);
    float _1095 = _997 * _1039;
    float _1097 = _1089 * _1087;
    float _1099 = _411 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1101 = _1079 * _1093;
    float _1103 = _973 * _1091;
    float _1105 = _411 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1107 = fma(_409, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1099);
    float _1109 = _1101 * _971;
    float _1111 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1113 = -_1103;
    float _1115 = fma(_969, _1095, _1113);
    float _1117 = _971 * _1095;
    float _1119 = fma(_1097, _1085, _1109);
    float _1121 = _1101 * _969;
    float _1123 = fma(_409, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1105);
    float _1125 = in.m_53.z;
    float _1127 = fma(_1111, _1115, _1119);
    float _1129 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1107);
    float _1131 = -_1117;
    float _1133 = fma(_973, _1085, _1131);
    float _1135 = fma(_1097, _1091, _1121);
    float _1137 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1123);
    float _1139 = _411 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1141 = in.m_53.x;
    float _1143 = _1129 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1145 = fma(_1111, _1133, _1135);
    float _1147 = _1137 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1149 = fma(_409, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1139);
    float _1151 = _1143 + _1127;
    float _1153 = _1117;
    float _1155 = _1083;
    float _1157 = _1151;
    if (!_765)
    {
        _1153 = _1073;
    }
    float _1159 = _1153;
    float _1161 = _1147 + _1145;
    float _1163 = in.m_53.w;
    float _1165 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1167 = _1151 + _1165;
    float _1169 = _969 * _1085;
    float _1171 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1173 = _1161 + _1171;
    float _1175 = _1159;
    float _1177 = _1073;
    if (_765)
    {
        float _1179 = in.m_53.x;
        float _1181 = in.m_53.y;
        _1175 = _1179;
        _1177 = _1181;
    }
    float _1183 = _1175;
    float _1185 = _1177;
    float _1187 = _1167 * _1167;
    float _1189 = _1101 * _973;
    float _1191 = _1173 * _1173;
    float _1193 = -_1169;
    float _1195 = fma(_971, _1091, _1193);
    bool _1197 = _1125 > 0.5;
    float _1199 = fma(_1097, _1095, _1189);
    float _1201 = _1187 + _1191;
    if (!_765)
    {
        _1069 = _1125;
    }
    float _1203 = _1069;
    float _1205 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1207 = -_1047;
    float _1209 = _1197 ? _1207 : _1047;
    float _1211 = fma(_1111, _1195, _1199);
    bool _1213 = _1141 > 0.5;
    float _1215 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1149);
    bool _1217 = !_1053;
    float _1219 = _1217 ? _1047 : _1209;
    float _1221 = _1209;
    float _1223 = _1203;
    if (!_765)
    {
        _1221 = _1125;
    }
    float _1225 = _1221;
    float _1227 = sqrt(_1201);
    float _1229 = -_1047;
    int _1231 = _1213 ? as_type<int>(_1229) : as_type<int>(_1047);
    float _1233 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1235 = _1225;
    if (_765)
    {
        _1235 = _1185;
    }
    float _1237 = _1235;
    float _1239 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    if (_765)
    {
        _1223 = _1185;
    }
    float _1241 = _1223;
    float _1243 = fma(_1183, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1233);
    bool _1245 = _1185 > 0.5;
    float _1247 = _1183 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1249 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _1251 = _1163 > 0.5;
    float _1253 = _1241 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _1255 = _1227 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1257 = -_1249;
    float _1259 = fma(_1247, 2.0, _1257);
    float _1261 = _1215 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1263 = !_1065;
    float _1265 = _1263 ? _1047 : as_type<float>(_1231);
    float _1267 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1269 = -_1083;
    int _1271 = _1251 ? as_type<int>(_1269) : as_type<int>(_1083);
    float _1273 = _1261 + _1211;
    float _1275 = -_1083;
    int _1277 = _1245 ? as_type<int>(_1275) : as_type<int>(_1083);
    float _1279 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1281 = fma(_1253, -2.0, _1267);
    bool _1283 = !_1059;
    float _1285 = _1283 ? _1083 : as_type<float>(_1271);
    bool _1287 = !_1077;
    float _1289 = _1287 ? _1083 : as_type<float>(_1277);
    float _1291 = fma(_1237, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1279);
    float _1293 = _1267;
    float _1295 = _1253;
    float _1297 = (*spvDescriptorSet0.vp_c9)._m0[82].y;
    if (!_1255)
    {
        _1293 = _1151;
    }
    float _1299 = _1293;
    float _1301 = _1299;
    if (!_1255)
    {
        _1295 = _1191;
    }
    float _1303 = _1295;
    float _1305 = _1303;
    if (!_1255)
    {
        _1297 = _1187;
    }
    float _1307 = _1297;
    float _1309 = _1307;
    if (!_1255)
    {
        _1155 = _1161;
    }
    float _1311 = _1155;
    float _1313 = _1311;
    if (!_1255)
    {
        _1157 = _1273;
    }
    float _1315 = _1157;
    bool _1317 = !_1255;
    float _1319 = _1315;
    if (!_1317)
    {
        float _1321 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1323 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1325 = _1227 + _1323;
        float _1327 = _1273 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1329 = rsqrt(_1201);
        float _1331 = _1325 * _1321;
        float _1333 = _1331 * 0.15915493667125701904296875;
        float _1335 = _1333 * 6.283185482025146484375;
        float _1337 = sin(_1335);
        float _1339 = _1333 * 6.283185482025146484375;
        float _1341 = cos(_1339);
        float _1343 = fma(_1337, _1327, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1345 = _1329 * _1343;
        float _1347 = _1341 + (-1.0);
        float _1349 = fma(_1167, _1345, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1351 = fma(_1173, _1345, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1353 = _1347 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1355 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1357 = _1349 + _1355;
        float _1359 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1361 = _1351 + _1359;
        float _1363 = fma(_1273, _1341, _1353);
        float _1365 = _1357 * _1357;
        float _1367 = _1361 * _1361;
        _1319 = _1363;
        _1309 = _1365;
        _1305 = _1367;
        _1301 = _1349;
        _1313 = _1351;
    }
    float _1369 = _1319;
    float _1371 = _1309;
    float _1373 = _1305;
    float _1375 = _1301;
    float _1377 = _1313;
    float _1379 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1381 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1383 = _1369 + _1381;
    float _1385 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1243);
    float _1387 = -_117;
    float _1389 = fma(_1387, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1259);
    float _1391 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1291);
    float _1393 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1281);
    float _1395 = _1239 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1397 = fma(_1383, _1383, _1371);
    float _1399 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1401 = _1265 + 0.5;
    float _1403 = _1205 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1405 = _1397 + _1373;
    float _1407 = _1219 + 0.5;
    float _1409 = _1285 + (-0.5);
    float _1411 = _1401 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1413 = -_1289;
    float _1415 = _1413 + 0.5;
    float _1417 = fma(_1403, _1407, _1389);
    float _1419 = -_1395;
    float _1421 = -_1393;
    float _1423 = fma(_1419, _1409, _1421);
    float _1425 = _1411 * _1379;
    float _1427 = -_1385;
    float _1429 = _1427 + 1.0;
    float _1431 = sqrt(_1405);
    float _1433 = -_1391;
    float _1435 = _1433 + 1.0;
    float _1437 = _1415 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1439 = -_1429;
    float _1441 = fma(_1219, _1439, _1417);
    float _1443 = fma(_1285, _1435, _1423);
    float _1445 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1447 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1449 = _1437 * _1399;
    out.m_58.w = _1445;
    out.m_60.w = _1447;
    bool _1451 = _1431 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1453 = isnan(_1431);
    bool _1455 = _1451 || _1453;
    bool _1457 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1459 = _1455 || _1457;
    out.m_62.x = _1425;
    out.m_62.y = _1449;
    out.m_62.z = _1441;
    out.m_62.w = _1443;
    float _1461 = _1423;
    float _1463 = _1377;
    float _1465 = _1397;
    if (!_1459)
    {
        _1461 = 1.0;
    }
    float _1467 = _1461;
    bool _1469 = !_1459;
    float _1471 = _1467;
    if (!_1469)
    {
        bool _1473 = _1431 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1475 = isnan(_1431);
        bool _1477 = _1473 || _1475;
        bool _1479 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1481 = _1477 || _1479;
        if (!_1481)
        {
            float _1483 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1485 = _1431 + _1483;
            float _1487 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1489 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1487;
            float _1491 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1493 = _1491 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1495 = 1.0 / _1489;
            float _1497 = _1485 * _1495;
            float _1499 = fma(_1497, _1493, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1471 = _1499;
            _1501 = true;
        }
        else
        {
            bool _1503 = _1431 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1505 = isnan(_1431);
            bool _1507 = _1503 || _1505;
            bool _1509 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1511 = _1507 || _1509;
            if (!_1511)
            {
                float _1513 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1515 = _1431 + _1513;
                float _1517 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1519 = _1517 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1521 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1523 = _1521 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1525 = 1.0 / _1519;
                float _1527 = _1515 * _1525;
                float _1529 = fma(_1527, _1523, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1471 = _1529;
                _1501 = true;
            }
            else
            {
                _1471 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1501 = false;
    float _1531 = _1471;
    float _1533 = _1261 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1535 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1537 = _1375 + _1535;
    float _1539 = fma(_1143, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1533);
    bool _1541 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1543 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1545 = _1541 || _1543;
    bool _1547 = isnan(0.5);
    bool _1549 = _1545 || _1547;
    float _1551 = _1261 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1553 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1555 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1557 = _1553 || _1555;
    bool _1559 = isnan(0.5);
    bool _1561 = _1557 || _1559;
    float _1563 = fma(_1147, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1539);
    float _1565 = fma(_1537, _1531, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1567 = fma(_1143, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1551);
    float _1569 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1571 = _1369 + _1569;
    float _1573 = _1563 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1575 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1577 = _1377 + _1575;
    float _1579 = fma(_1147, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1567);
    float _1581 = fma(_1571, _1531, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1583 = 1.0 / _1573;
    float _1585 = fma(_1577, _1531, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1587 = _1579 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1589 = _1571;
    float _1591 = _1537;
    float _1593 = _1585;
    float _1595 = _1531;
    float _1597 = _1573;
    if (_1561)
    {
        _1463 = _1565;
    }
    float _1599 = _1463;
    float _1601 = _1587 + _1573;
    float _1603 = _1599;
    if (_1561)
    {
        _1589 = _1581;
    }
    float _1605 = _1589;
    float _1607 = _1605;
    if (_1561)
    {
        _1591 = _1585;
    }
    float _1609 = _1591;
    float _1611 = _1609;
    if (!_1561)
    {
        float _1613 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1615 = _1261 + _1613;
        float _1617 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1619 = _1143 + _1617;
        float _1621 = -_1143;
        float _1623 = _1621 + _1565;
        float _1625 = -_1261;
        float _1627 = _1625 + _1581;
        float _1629 = _1615 * _1615;
        float _1631 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1633 = _1147 + _1631;
        float _1635 = -_1147;
        float _1637 = _1635 + _1585;
        float _1639 = fma(_1619, _1619, _1629);
        float _1641 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1643 = fma(_1633, _1633, _1639);
        float _1645 = sqrt(_1643);
        float _1647 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        bool _1649 = _1645 > (*spvDescriptorSet0.vp_c9)._m0[199].x;
        bool _1651 = isnan(_1645);
        bool _1653 = _1649 || _1651;
        bool _1655 = isnan((*spvDescriptorSet0.vp_c9)._m0[199].x);
        bool _1657 = _1653 || _1655;
        float _1659 = precise::min(_1645, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1661 = _1659 * _1641;
        float _1663 = _1647 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1665 = _1663 * _1661;
        float _1667 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
        float _1669 = _1641;
        float _1671 = _1645;
        float _1673 = _1663;
        _1593 = _1637;
        if (_1657)
        {
            float _1675 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].y;
            _1667 = _1675;
        }
        float _1677 = _1667;
        if (_1657)
        {
            float _1679 = precise::max(_1645, (*spvDescriptorSet0.vp_c9)._m0[199].y);
            _1669 = _1679;
        }
        float _1681 = _1669;
        float _1683 = fma(_1623, _1665, _1143);
        float _1685 = _1683;
        if (_1657)
        {
            float _1687 = _1681 * _1677;
            _1671 = _1687;
        }
        float _1689 = _1671;
        float _1691 = fma(_1627, _1665, _1261);
        float _1693 = fma(_1637, _1665, _1147);
        float _1695 = _1689;
        float _1697 = _1691;
        if (_1657)
        {
            float _1699 = _1663 * _1689;
            _1695 = _1699;
        }
        float _1701 = _1695;
        _1595 = _1701;
        if (!_1657)
        {
            _1673 = _1693;
        }
        float _1703 = _1673;
        _1611 = _1703;
        if (_1657)
        {
            float _1705 = fma(_1623, _1701, _1143);
            _1685 = _1705;
        }
        float _1707 = _1685;
        _1603 = _1707;
        if (_1657)
        {
            float _1709 = fma(_1627, _1701, _1261);
            _1697 = _1709;
        }
        float _1711 = _1697;
        _1607 = _1711;
        if (_1657)
        {
            float _1713 = fma(_1637, _1701, _1147);
            _1611 = _1713;
        }
    }
    float _1715 = _1607;
    float _1717 = _1603;
    float _1719 = _1611;
    float _1721 = _1593;
    float _1723 = _1595;
    float _1725 = _1723;
    float _1727 = _1721;
    if (_1549)
    {
        _1725 = 1.0;
    }
    float _1729 = _1725;
    float _1731 = _1601 * _1583;
    float _1733 = _1731 * 0.5;
    float _1735 = _1729;
    if (!_1549)
    {
        float _1737 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1739 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1741 = fma(_1733, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1739);
        float _1743 = _1737 * 0.15915493667125701904296875;
        float _1745 = _1743 * 6.283185482025146484375;
        float _1747 = cos(_1745);
        float _1749 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1751 = _1749 * 0.15915493667125701904296875;
        float _1753 = _1743 * 6.283185482025146484375;
        float _1755 = sin(_1753);
        float _1757 = 1.0 / _1747;
        float _1759 = _1751 * 6.283185482025146484375;
        float _1761 = cos(_1759);
        float _1763 = _1755 * _1757;
        float _1765 = 1.0 / _1741;
        float _1767 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1769 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1767;
        float _1771 = _1761 * _1763;
        float _1773 = _1751 * 6.283185482025146484375;
        float _1775 = sin(_1773);
        float _1777 = 1.0 / _1771;
        float _1779 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1781 = _1765 * _1779;
        float _1783 = 1.0 / _1769;
        float _1785 = _1775 * _1777;
        float _1787 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1789 = fma(_1785, _1781, _1787);
        float _1791 = _1789 * _1783;
        float _1793 = precise::clamp(_1791, 0.0, 1.0);
        float _1795 = -_1793;
        float _1797 = _1795 + 1.0;
        _1597 = _1783;
        _1735 = _1797;
    }
    float _1799 = _1597;
    float _1801 = _1735;
    float _1803 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1805 = _1715 + _1803;
    float _1807 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1809 = _1717 + _1807;
    float _1811 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1813 = _1719 + _1811;
    float _1815 = _1805 * _1805;
    float _1817 = fma(_1809, _1809, _1815);
    float _1819 = fma(_1813, _1813, _1817);
    float _1821 = rsqrt(_1819);
    float _1823 = _1821 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1825 = _1809 * _1823;
    float _1827 = _1813 * _1823;
    float _1829 = _1825 * _1825;
    float _1831 = _1827 * _1827;
    float _1833 = _1829 + _1831;
    float _1835 = sqrt(_1833);
    bool _1837 = _1835 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1839 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1841 = _1835 + _1839;
    float _1843 = _1813;
    float _1845 = _1799;
    float _1847 = _1841;
    float _1849 = _1805;
    float _1851 = _1825;
    if (_1837)
    {
        float _1853 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1843 = _1853;
    }
    float _1855 = _1843;
    if (_1837)
    {
        float _1857 = rsqrt(_1833);
        _1845 = _1857;
    }
    float _1859 = _1845;
    float _1861 = _1859;
    if (_1837)
    {
        float _1863 = _1841 * _1855;
        _1847 = _1863;
    }
    float _1865 = _1847;
    if (_1837)
    {
        float _1867 = _1865 * 0.15915493667125701904296875;
        _1727 = _1867;
    }
    float _1869 = _1727;
    float _1871 = _1815;
    if (_1837)
    {
        float _1873 = _1869 * 6.283185482025146484375;
        float _1875 = sin(_1873);
        _1871 = _1875;
    }
    float _1877 = _1871;
    float _1879 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1881 = precise::max(0.0, _1879);
    float _1883 = _1821;
    float _1885 = _1881;
    float _1887 = _1879;
    if (_1837)
    {
        float _1889 = _1869 * 6.283185482025146484375;
        float _1891 = cos(_1889);
        _1883 = _1891;
    }
    float _1893 = _1883;
    float _1895 = -_1823;
    float _1897 = -_1881;
    float _1899 = fma(_1805, _1895, _1897);
    if (!_1837)
    {
        _1885 = _1827;
    }
    float _1901 = _1885;
    float _1903 = _1901;
    if (_1837)
    {
        float _1905 = _1899 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1887 = _1905;
    }
    float _1907 = _1887;
    float _1909 = sqrt(_1819);
    float _1911 = _1877;
    float _1913 = _1907;
    if (_1837)
    {
        float _1915 = fma(_1877, _1907, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1849 = _1915;
    }
    float _1917 = _1849;
    float _1919 = _1917;
    if (!_1837)
    {
        _1911 = _1899;
    }
    float _1921 = _1911;
    float _1923 = _1921;
    if (_1837)
    {
        float _1925 = _1893 + (-1.0);
        _1913 = _1925;
    }
    float _1927 = _1913;
    float _1929 = _1927;
    if (_1837)
    {
        float _1931 = _1859 * _1917;
        _1465 = _1931;
    }
    float _1933 = _1465;
    if (!_1837)
    {
        _1919 = _1831;
    }
    float _1935 = _1919;
    float _1937 = _1935;
    if (_1837)
    {
        float _1939 = _1927 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1861 = _1939;
    }
    float _1941 = _1861;
    if (_1837)
    {
        float _1943 = _1825 * _1933;
        _1851 = _1943;
    }
    float _1945 = _1851;
    if (!_1837)
    {
        _1929 = _1829;
    }
    float _1947 = _1929;
    float _1949 = _1947;
    if (_1837)
    {
        float _1951 = _1827 * _1933;
        _1903 = _1951;
    }
    float _1953 = _1903;
    if (_1837)
    {
        float _1955 = fma(_1899, _1893, _1941);
        _1923 = _1955;
    }
    float _1957 = _1923;
    if (_1837)
    {
        float _1959 = _1945 * _1945;
        _1949 = _1959;
    }
    float _1961 = _1949;
    if (_1837)
    {
        float _1963 = _1953 * _1953;
        _1937 = _1963;
    }
    float _1965 = _1937;
    float _1967 = fma(_1957, _1957, _1961);
    float _1969 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1971 = fma(_1909, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1969);
    float _1973 = precise::clamp(_1971, 0.0, 1.0);
    float _1975 = _1715 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1977 = _1967 + _1965;
    float _1979 = _1715 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1981 = -_1973;
    float _1983 = _1981 + 1.0;
    float _1985 = fma(_1717, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1975);
    float _1987 = rsqrt(_1977);
    float _1989 = fma(_1717, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1979);
    float _1991 = _1715 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1993 = _1715 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1995 = fma(_1719, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1985);
    float _1997 = fma(_1719, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1989);
    float _1999 = fma(_1717, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1991);
    float _2001 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2003 = abs(_1983);
    float _2005 = log2(_2003);
    float _2007 = fma(_1717, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1993);
    float _2009 = fma(_1719, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1999);
    float _2011 = _1995 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2013 = _1997 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2015 = fma(_1719, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2007);
    float _2017 = _2009 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2019 = _2011 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2021 = _1987 * _1945;
    float _2023 = _1987 * _1957;
    float _2025 = _1987 * _1953;
    float _2027 = fma(_2017, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2019);
    float _2029 = _2021 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2031 = _2013 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2033 = _2015 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2035 = fma(_2013, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2027);
    float _2037 = -_2029;
    float _2039 = fma(_2023, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2037);
    float _2041 = -_2031;
    float _2043 = fma(_2041, _2001, 1.0);
    float _2045 = _2005 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2047 = fma(_2033, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2035);
    float _2049 = -_2025;
    float _2051 = fma(_2049, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2039);
    float _2053 = _2011 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2055 = exp2(_2045);
    float _2057 = _2011 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2059 = fma(_2051, -0.5, 0.5);
    float _2061 = fma(_2017, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2053);
    float _2063 = fma(_2051, 0.5, 0.5);
    float _2065 = fma(_2017, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2057);
    float _2067 = _2023 + 1.0;
    float _2069 = fma(_2013, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2061);
    float _2071 = log2(_2043);
    float _2073 = fma(_2013, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2065);
    float _2075 = fma(_2063, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2077 = fma(_2033, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2069);
    float _2079 = fma(_2033, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2073);
    float _2081 = fma(_2063, _2075, -0.212114393711090087890625);
    float _2083 = 1.0 / _2047;
    float _2085 = -_2023;
    float _2087 = fma(_2055, _2067, _2085);
    float _2089 = fma(_2063, _2081, 1.570728778839111328125);
    float _2091 = fma(_2087, 0.5, 0.5);
    float _2093 = sqrt(_2059);
    float _2095 = _2071 * 0.693147182464599609375;
    float _2097 = _2095 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2099 = _2077 * _2083;
    float _2101 = _2079 * _2083;
    float _2103 = fma(_2099, 0.5, 0.5);
    float _2105 = fma(_2101, -0.5, 0.5);
    float _2107 = _2093 * 0.636619746685028076171875;
    float3 _5520 = float3(_2103, _2105, _2097);
    float _2109 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5520, float3(0.0), isnan(_5520)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5520, float3(0.0), isnan(_5520)), level(0.0)).x;
    float3 _5531 = float3(_2103, _2105, _2097);
    float4 _2112 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5531, float3(0.0), isnan(_5531)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5531, float3(0.0), isnan(_5531)), level(0.0)).xyzw;
    float _2114 = _2112.x;
    float _2116 = _2112.y;
    float _2118 = _2112.z;
    float _2120 = _2112.w;
    float _2122 = -_2089;
    float _2124 = fma(_2107, _2122, 1.0);
    float2 _5553 = float2(_2124, _2091);
    float3 _2128 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5553, float2(0.0), isnan(_5553)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5553, float2(0.0), isnan(_5553)), level(0.0)).xyz;
    float _2130 = _2128.x;
    float _2132 = _2128.y;
    float _2134 = _2128.z;
    float _2136 = _2005 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2138 = _2011 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2140 = _1801 > 0.0;
    bool _2142 = isnan(_1801);
    bool _2144 = _2140 || _2142;
    bool _2146 = isnan(0.0);
    bool _2148 = _2144 || _2146;
    float _2150 = _1801 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2152 = fma(_2017, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2138);
    float _2154 = exp2(_2136);
    float _2156 = fma(_2013, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2152);
    float _2158 = fma(_2033, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2156);
    float _2160 = _2158 + _2047;
    out.gl_Position.x = _2077;
    out.gl_Position.y = _2079;
    out.gl_Position.z = _2158;
    out.gl_Position.w = _2047;
    float _2162 = _2160 * 0.5;
    float _2164 = -_2154;
    float _2166 = _2164 + 1.0;
    float _2168 = _2150 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2170 = _2166 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_64.z = _2162;
    out.m_64.w = _2047;
    out.m_47.x = _2168;
    float _2172 = _2170 * _2109;
    float _2174 = -_2170;
    float _2176 = _2174 + 1.0;
    float _2178 = _2120 * _2172;
    float _2180 = _2120 * _2176;
    float _2182 = _2134 * _2172;
    float _2184 = fma(_2130, _2178, _2114);
    float _2186 = fma(_2132, _2178, _2116);
    float _2188 = fma(_2120, _2182, _2118);
    out.m_66.x = _2184;
    out.m_66.y = _2186;
    out.m_66.z = _2188;
    out.m_66.w = _2180;
    if (_2148)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _2190 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2190;
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
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1501 = false;
    bool _621 = false;
    bool _471 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _80 = in.m_44.w;
    float _82 = trunc(_80);
    int _85 = int(_82);
    bool _89 = _85 >= 1;
    float _91 = 0.0;
    if (!_89)
    {
        _91 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _93 = _91;
    if (!_89)
    {
        out.m_47.x = 0.0;
    }
    int _95 = 0;
    if (!_89)
    {
        float _97 = _93 * 5.0;
        _95 = as_type<int>(_97);
    }
    int _99 = _95;
    int _101 = _99;
    if (!_89)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2246 = as_type<float>(_99);
        out.gl_Position.z = _2246;
    }
    if (!_89)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _103 = in.m_49.w;
    bool _105 = _103 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _107 = isnan(_103);
    bool _109 = _105 || _107;
    bool _111 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _113 = _109 || _111;
    float _115 = -_103;
    float _117 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _119 = 0.0;
    if (_113)
    {
        float _121 = float(_85);
        _119 = _121;
    }
    float _123 = _119;
    bool _125 = _117 >= _123;
    bool _127 = !_113;
    bool _129 = _125 || _127;
    float _131 = 0.0;
    float _133 = _123;
    if (_129)
    {
        _131 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _135 = _131;
    float _137 = _135;
    if (_129)
    {
        out.m_47.x = 0.0;
    }
    if (_129)
    {
        float _139 = _135 * 5.0;
        _101 = as_type<int>(_139);
    }
    int _141 = _101;
    if (_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2316 = as_type<float>(_141);
        out.gl_Position.z = _2316;
    }
    if (_129)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _143 = in.m_49.x;
    float _145 = in.m_49.y;
    float _147 = in.m_49.z;
    float _149 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _151 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _153 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _155 = _151 || _153;
    bool _157 = isnan(1.0);
    bool _159 = _155 || _157;
    float _161 = 0.0;
    float _163 = _149;
    if (!_159)
    {
        float _165 = _149 * _149;
        float _167 = _165 * 0.5;
        _161 = _167;
    }
    float _169 = _161;
    float _171 = 0.0;
    float _173 = _169;
    if (!_159)
    {
        float _175 = _117 * _117;
        float _177 = _175 * 0.5;
        _171 = _177;
    }
    float _179 = _171;
    if (!_159)
    {
        float _181 = _169 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _173 = _181;
    }
    float _183 = _173;
    bool _185 = !_159;
    float _187 = _183;
    if (!_185)
    {
        float _189 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _191 = log2(_189);
        float _193 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _195 = _193 + 1.0;
        float _197 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _199 = _149 * _191;
        float _201 = 1.0 / _195;
        float _203 = _197 * 0.693147182464599609375;
        float _205 = exp2(_199);
        float _207 = 1.0 / _203;
        float _209 = _205 + (-1.0);
        float _211 = -_209;
        float _213 = fma(_211, _207, _149);
        float _215 = _213 * _201;
        float _217 = _215 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _137 = _207;
        _187 = _217;
        _133 = _205;
    }
    float _219 = _137;
    float _221 = _187;
    float _223 = _133;
    bool _225 = !_159;
    float _227 = _219;
    float _229 = _223;
    if (!_225)
    {
        float _231 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _233 = log2(_231);
        float _235 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _237 = _235 + 1.0;
        float _239 = 1.0 / _237;
        float _241 = _149 * _233;
        float _243 = exp2(_241);
        float _245 = -_243;
        float _247 = _245 + 1.0;
        float _249 = _247 * _239;
        _227 = _243;
        _229 = _237;
        _163 = _249;
    }
    float _251 = _227;
    float _253 = _229;
    float _255 = _163;
    float _257 = _253;
    float _259 = _251;
    if (!_159)
    {
        _257 = _117;
    }
    float _261 = _257;
    float _263 = _221 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _265 = _261;
    if (!_159)
    {
        float _267 = _179 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _259 = _267;
    }
    float _269 = _259;
    bool _271 = !_159;
    float _273 = _269;
    if (!_271)
    {
        float _275 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _277 = log2(_275);
        float _279 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _281 = _279 + 1.0;
        float _283 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _285 = _117 * _277;
        float _287 = 1.0 / _281;
        float _289 = _283 * 0.693147182464599609375;
        float _291 = exp2(_285);
        float _293 = 1.0 / _289;
        float _295 = _291 + (-1.0);
        float _297 = -_295;
        float _299 = fma(_297, _293, _117);
        float _301 = _299 * _287;
        float _303 = _301 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _273 = _303;
    }
    float _305 = _273;
    bool _307 = !_159;
    if (!_307)
    {
        float _309 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _311 = log2(_309);
        float _313 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _315 = _313 + 1.0;
        float _317 = 1.0 / _315;
        float _319 = _117 * _311;
        float _321 = exp2(_319);
        float _323 = -_321;
        float _325 = _323 + 1.0;
        float _327 = _325 * _317;
        _265 = _327;
    }
    float _329 = _265;
    float _331 = _305 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _333 = fma(_255, _145, _263);
    float _335 = _221 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _337 = _305 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _339 = fma(_329, _145, _331);
    float _341 = _221 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _343 = _305 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _345 = fma(_255, _143, _335);
    float _347 = fma(_329, _143, _337);
    float _349 = -_339;
    float _351 = _333 + _349;
    float _353 = fma(_255, _147, _341);
    float _355 = fma(_329, _147, _343);
    float _357 = -_347;
    float _359 = _345 + _357;
    float _361 = _351 * _351;
    float _363 = in.m_51.w;
    float _365 = -_355;
    float _367 = _353 + _365;
    float _369 = _351 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _371 = fma(_359, _359, _361);
    float _373 = _351 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _375 = in.m_44.x;
    float _377 = in.m_44.y;
    float _379 = in.m_44.z;
    float _381 = _351 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _383 = fma(_367, _367, _371);
    float _385 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[4].x, _369);
    float _387 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[5].x, _373);
    float _389 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[6].x, _381);
    float _391 = fma(_367, (*spvDescriptorSet0.vp_c10)._m0[4].z, _385);
    float _393 = sqrt(_383);
    float _395 = fma(_367, (*spvDescriptorSet0.vp_c10)._m0[6].z, _389);
    bool _397 = _393 >= 9.9999999747524270787835121154785e-07;
    bool _399 = isnan(_393);
    bool _401 = _397 || _399;
    bool _403 = isnan(9.9999999747524270787835121154785e-07);
    bool _405 = _401 || _403;
    float _407 = fma(_367, (*spvDescriptorSet0.vp_c10)._m0[5].z, _387);
    float _409 = fma(_345, _363, _375);
    float _411 = fma(_333, _363, _377);
    float _413 = fma(_353, _363, _379);
    float _415 = _389;
    float _417 = _367;
    float _419 = _407;
    if (_405)
    {
        _415 = _407;
    }
    float _421 = _415;
    float _423 = _421;
    if (_405)
    {
        _417 = _391;
    }
    float _425 = _417;
    float _427 = _425;
    if (_405)
    {
        _419 = _395;
    }
    float _429 = _419;
    float _431 = _429;
    if (!_405)
    {
        bool _433 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _435 = !_433;
        if (!_435)
        {
            float _437 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _439 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _441 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _443 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _437);
            float _445 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _439);
            float _447 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _441);
            float _449 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _443);
            float _451 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _445);
            float _453 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _447);
            float _455 = _449 * _449;
            float _457 = fma(_451, _451, _455);
            float _459 = fma(_453, _453, _457);
            float _461 = rsqrt(_459);
            float _463 = _461 * 9.9999999747524270787835121154785e-07;
            float _465 = _451 * _463;
            float _467 = _449 * _463;
            float _469 = _453 * _463;
            _423 = _467;
            _427 = _465;
            _431 = _469;
            _471 = true;
        }
        else
        {
            float _473 = _145 * _145;
            float _475 = fma(_143, _143, _473);
            float _477 = fma(_147, _147, _475);
            float _479 = sqrt(_477);
            bool _481 = _479 >= 9.9999999747524270787835121154785e-07;
            bool _483 = isnan(_479);
            bool _485 = _481 || _483;
            bool _487 = isnan(9.9999999747524270787835121154785e-07);
            bool _489 = _485 || _487;
            if (!_489)
            {
                float _491 = _377 * _377;
                float _493 = fma(_375, _375, _491);
                float _495 = fma(_379, _379, _493);
                float _497 = sqrt(_495);
                bool _499 = _497 >= 9.9999999747524270787835121154785e-07;
                bool _501 = isnan(_497);
                bool _503 = _499 || _501;
                bool _505 = isnan(9.9999999747524270787835121154785e-07);
                bool _507 = _503 || _505;
                if (!_507)
                {
                    float _509 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _511 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _509);
                    float _513 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _511);
                    float _515 = rsqrt(_513);
                    float _517 = _515 * 9.9999999747524270787835121154785e-07;
                    float _519 = _517 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _521 = _517 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _523 = _517 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _423 = _521;
                    _427 = _519;
                    _431 = _523;
                    _471 = true;
                }
                else
                {
                    float _525 = _377 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _527 = _377 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _529 = _377 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _531 = fma(_375, (*spvDescriptorSet0.vp_c10)._m0[5].x, _525);
                    float _533 = fma(_375, (*spvDescriptorSet0.vp_c10)._m0[4].x, _527);
                    float _535 = fma(_375, (*spvDescriptorSet0.vp_c10)._m0[6].x, _529);
                    float _537 = fma(_379, (*spvDescriptorSet0.vp_c10)._m0[5].z, _531);
                    float _539 = fma(_379, (*spvDescriptorSet0.vp_c10)._m0[4].z, _533);
                    float _541 = fma(_379, (*spvDescriptorSet0.vp_c10)._m0[6].z, _535);
                    float _543 = _537 * _537;
                    float _545 = fma(_539, _539, _543);
                    float _547 = fma(_541, _541, _545);
                    float _549 = rsqrt(_547);
                    float _551 = _549 * 9.9999999747524270787835121154785e-07;
                    float _553 = _539 * _551;
                    float _555 = _537 * _551;
                    float _557 = _541 * _551;
                    _423 = _555;
                    _427 = _553;
                    _431 = _557;
                    _471 = true;
                }
            }
            else
            {
                float _559 = _145 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _561 = _145 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _563 = _145 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _565 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[5].x, _559);
                float _567 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[4].x, _561);
                float _569 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[6].x, _563);
                float _571 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[5].z, _565);
                float _573 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[4].z, _567);
                float _575 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[6].z, _569);
                float _577 = _571 * _571;
                float _579 = fma(_573, _573, _577);
                float _581 = fma(_575, _575, _579);
                float _583 = rsqrt(_581);
                float _585 = _583 * 9.9999999747524270787835121154785e-07;
                float _587 = _573 * _585;
                float _589 = _571 * _585;
                float _591 = _575 * _585;
                _423 = _589;
                _427 = _587;
                _431 = _591;
            }
        }
    }
    _471 = false;
    float _593 = _423;
    float _595 = _427;
    float _597 = _431;
    bool _599 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _601 = !_599;
    float _619;
    if (!_601)
    {
        float _603 = in.m_53.x;
        float _605 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _607 = _603 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _609 = fma(_607, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _611 = _609 * _605;
        float _613 = floor(_611);
        float _615 = -_613;
        float _617 = _611 + _615;
        _619 = _617;
        _621 = true;
    }
    else
    {
        float _623 = float(_85);
        float _625 = 1.0 / _623;
        float _627 = _117 * _625;
        _619 = _627;
    }
    _621 = false;
    float _629 = _619;
    float _631 = as_type<float>(int(gl_VertexIndex));
    float _633 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _635 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _633;
    float _637 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _639 = _637 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _641 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _643 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _641;
    float _645 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _647 = _645 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _649 = 1.0 / _635;
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _653 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _651;
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _657 = _655 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _659 = 1.0 / _647;
    float _661 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _663 = _629 + _661;
    float _665 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _667 = (*spvDescriptorSet0.vp_c9)._m0[150].w + _665;
    bool _669 = _629 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _671 = isnan(_629);
    bool _673 = _669 || _671;
    bool _675 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _677 = _673 || _675;
    float _679 = float(_677);
    bool _681 = _629 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _683 = isnan(_629);
    bool _685 = _681 || _683;
    bool _687 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _689 = _685 || _687;
    float _691 = float(_689);
    float _693 = 1.0 / _639;
    float _695 = _663 * _649;
    float _697 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _699 = _629 + _697;
    float _701 = -_679;
    float _703 = _701 + 1.0;
    float _705 = 1.0 / _657;
    float _707 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _709 = _629 + _707;
    float _711 = _699 * _659;
    bool _713 = _629 >= (*spvDescriptorSet0.vp_c9)._m0[150].w;
    bool _715 = isnan(_629);
    bool _717 = _713 || _715;
    bool _719 = isnan((*spvDescriptorSet0.vp_c9)._m0[150].w);
    bool _721 = _717 || _719;
    float _723 = float(_721);
    float _725 = 1.0 / _643;
    float _727 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _729 = _629 + _727;
    float _731 = _709 * _693;
    float _733 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _735 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _733;
    float _737 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _739 = _737 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _741 = _629 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _743 = isnan(_629);
    bool _745 = _741 || _743;
    bool _747 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _749 = _745 || _747;
    float _751 = float(_749);
    float _753 = 1.0 / _653;
    float _755 = _729 * _705;
    float _757 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _759 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _757;
    float _761 = fma(_739, _711, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    int _763 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _765 = _763 != 0;
    float _767 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _769 = _629 + _767;
    int _771 = as_type<int>(_631) & 1;
    bool _773 = _771 != 0;
    int _775 = as_type<int>(_631) & 2;
    bool _777 = _775 != 0;
    float _779 = _769 * _725;
    float _781 = 1.0 / _667;
    float _783 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _785 = _629 + _783;
    float _787 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _789 = _629 + _787;
    float _791 = fma(_735, _779, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _793 = fma(_759, _779, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _795 = _629 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _797 = isnan(_629);
    bool _799 = _795 || _797;
    bool _801 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _803 = _799 || _801;
    float _805 = float(_803);
    float _807 = _785 * _753;
    bool _809 = _629 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _811 = isnan(_629);
    bool _813 = _809 || _811;
    bool _815 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _817 = _813 || _815;
    float _819 = float(_817);
    float _821 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _823 = _821 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _825 = -_723;
    float _827 = _825 + 1.0;
    float _829 = -_819;
    float _831 = _829 + 1.0;
    float _833 = fma(_823, _711, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _835 = -_751;
    float _837 = _835 + 1.0;
    float _839 = _751 * _827;
    float _841 = _789 * _781;
    float _843 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _845 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _843;
    float _847 = _805 * _837;
    float _849 = -_805;
    float _851 = _849 + 1.0;
    float _853 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _855 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _853;
    float _857 = fma(_845, _695, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _859 = _819 * _851;
    float _861 = fma(_855, _695, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    bool _863 = _629 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _865 = isnan(_629);
    bool _867 = _863 || _865;
    bool _869 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _871 = _867 || _869;
    float _873 = float(_871);
    float _875 = _679 * _831;
    float _877 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _879 = _877 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _881 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _883 = _881 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    bool _885 = _629 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _887 = isnan(_629);
    bool _889 = _885 || _887;
    bool _891 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _893 = _889 || _891;
    float _895 = float(_893);
    float _897 = _873 * _703;
    float _899 = -_873;
    float _901 = _899 + 1.0;
    float _903 = fma(_879, _731, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _905 = _593 * _593;
    float _907 = fma(_883, _731, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _909 = _691 * _901;
    float _911 = -_691;
    float _913 = _911 + 1.0;
    float _915 = fma(_595, _595, _905);
    float _917 = _895 * _913;
    float _919 = fma(_597, _597, _915);
    float _921 = -_895;
    float _923 = _921 + 1.0;
    float _925 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _927 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _925;
    float _929 = _791 * _917;
    float _931 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _933 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _931;
    float _935 = _793 * _917;
    float _937 = rsqrt(_919);
    float _939 = fma(_923, (*spvDescriptorSet0.vp_c9)._m0[143].x, _929);
    float _941 = fma(_927, _807, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _943 = fma(_933, _807, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _945 = fma(_923, (*spvDescriptorSet0.vp_c9)._m0[143].y, _935);
    float _947 = fma(_761, _909, _939);
    float _949 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _951 = _949 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _953 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _955 = _953 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _957 = fma(_833, _909, _945);
    float _959 = fma(_861, _897, _947);
    float _961 = fma(_951, _755, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _963 = fma(_955, _755, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _965 = fma(_857, _897, _957);
    float _967 = fma(_907, _875, _959);
    float _969 = _937 * _597;
    float _971 = _937 * _595;
    float _973 = _937 * _593;
    float _975 = fma(_903, _875, _965);
    float _977 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _979 = _969 * _977;
    float _981 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _983 = _971 * _981;
    float _985 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _987 = _973 * _985;
    float _989 = in.m_51.x;
    float _991 = in.m_51.y;
    float _993 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _995 = -_979;
    float _997 = fma(_971, _993, _995);
    float _999 = fma(_941, _859, _967);
    float _1001 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1003 = -_987;
    float _1005 = fma(_969, _1001, _1003);
    float _1007 = -(*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _1009 = (*spvDescriptorSet0.vp_c9)._m0[150].x + _1007;
    float _1011 = _997 * _997;
    float _1013 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1015 = -_983;
    float _1017 = fma(_973, _1013, _1015);
    float _1019 = fma(_943, _859, _975);
    float _1021 = fma(_1005, _1005, _1011);
    float _1023 = fma(_1009, _841, (*spvDescriptorSet0.vp_c9)._m0[149].x);
    float _1025 = -(*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _1027 = (*spvDescriptorSet0.vp_c9)._m0[150].y + _1025;
    float _1029 = fma(_961, _847, _999);
    float _1031 = fma(_1017, _1017, _1021);
    float _1033 = fma(_963, _847, _1019);
    float _1035 = fma(_1027, _841, (*spvDescriptorSet0.vp_c9)._m0[149].y);
    float _1037 = fma(_1023, _839, _1029);
    float _1039 = rsqrt(_1031);
    float _1041 = fma(_1035, _839, _1033);
    float _1043 = fma(_723, (*spvDescriptorSet0.vp_c9)._m0[150].x, _1037);
    bool _1045 = !_773;
    float _1047 = _1045 ? (-0.5) : 0.5;
    float _1049 = fma(_723, (*spvDescriptorSet0.vp_c9)._m0[150].y, _1041);
    int _1051 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1053 = _1051 != 0;
    float _1055 = _1043 * _989;
    int _1057 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1059 = _1057 != 0;
    float _1061 = _1049 * _991;
    int _1063 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1065 = _1063 != 0;
    float _1067 = _1031;
    float _1069 = _969;
    if (!_765)
    {
        float _1071 = in.m_53.y;
        _1067 = _1071;
    }
    float _1073 = _1067;
    int _1075 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1077 = _1075 != 0;
    float _1079 = _1061 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _1081 = !_777;
    float _1083 = _1081 ? (-0.5) : 0.5;
    float _1085 = _1005 * _1039;
    float _1087 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1047);
    float _1089 = _1055 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1091 = _1017 * _1039;
    float _1093 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1083);
    float _1095 = _997 * _1039;
    float _1097 = _1089 * _1087;
    float _1099 = _411 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1101 = _1079 * _1093;
    float _1103 = _973 * _1091;
    float _1105 = _411 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1107 = fma(_409, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1099);
    float _1109 = _1101 * _971;
    float _1111 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1113 = -_1103;
    float _1115 = fma(_969, _1095, _1113);
    float _1117 = _971 * _1095;
    float _1119 = fma(_1097, _1085, _1109);
    float _1121 = _1101 * _969;
    float _1123 = fma(_409, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1105);
    float _1125 = in.m_53.z;
    float _1127 = fma(_1111, _1115, _1119);
    float _1129 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1107);
    float _1131 = -_1117;
    float _1133 = fma(_973, _1085, _1131);
    float _1135 = fma(_1097, _1091, _1121);
    float _1137 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1123);
    float _1139 = _411 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1141 = in.m_53.x;
    float _1143 = _1129 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1145 = fma(_1111, _1133, _1135);
    float _1147 = _1137 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1149 = fma(_409, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1139);
    float _1151 = _1143 + _1127;
    float _1153 = _1117;
    float _1155 = _1083;
    float _1157 = _1151;
    if (!_765)
    {
        _1153 = _1073;
    }
    float _1159 = _1153;
    float _1161 = _1147 + _1145;
    float _1163 = in.m_53.w;
    float _1165 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1167 = _1151 + _1165;
    float _1169 = _969 * _1085;
    float _1171 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1173 = _1161 + _1171;
    float _1175 = _1159;
    float _1177 = _1073;
    if (_765)
    {
        float _1179 = in.m_53.x;
        float _1181 = in.m_53.y;
        _1175 = _1179;
        _1177 = _1181;
    }
    float _1183 = _1175;
    float _1185 = _1177;
    float _1187 = _1167 * _1167;
    float _1189 = _1101 * _973;
    float _1191 = _1173 * _1173;
    float _1193 = -_1169;
    float _1195 = fma(_971, _1091, _1193);
    bool _1197 = _1125 > 0.5;
    float _1199 = fma(_1097, _1095, _1189);
    float _1201 = _1187 + _1191;
    if (!_765)
    {
        _1069 = _1125;
    }
    float _1203 = _1069;
    float _1205 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1207 = -_1047;
    float _1209 = _1197 ? _1207 : _1047;
    float _1211 = fma(_1111, _1195, _1199);
    bool _1213 = _1141 > 0.5;
    float _1215 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1149);
    bool _1217 = !_1053;
    float _1219 = _1217 ? _1047 : _1209;
    float _1221 = _1209;
    float _1223 = _1203;
    if (!_765)
    {
        _1221 = _1125;
    }
    float _1225 = _1221;
    float _1227 = sqrt(_1201);
    float _1229 = -_1047;
    int _1231 = _1213 ? as_type<int>(_1229) : as_type<int>(_1047);
    float _1233 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1235 = _1225;
    if (_765)
    {
        _1235 = _1185;
    }
    float _1237 = _1235;
    float _1239 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    if (_765)
    {
        _1223 = _1185;
    }
    float _1241 = _1223;
    float _1243 = fma(_1183, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1233);
    bool _1245 = _1185 > 0.5;
    float _1247 = _1183 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1249 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _1251 = _1163 > 0.5;
    float _1253 = _1241 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _1255 = _1227 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1257 = -_1249;
    float _1259 = fma(_1247, 2.0, _1257);
    float _1261 = _1215 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1263 = !_1065;
    float _1265 = _1263 ? _1047 : as_type<float>(_1231);
    float _1267 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1269 = -_1083;
    int _1271 = _1251 ? as_type<int>(_1269) : as_type<int>(_1083);
    float _1273 = _1261 + _1211;
    float _1275 = -_1083;
    int _1277 = _1245 ? as_type<int>(_1275) : as_type<int>(_1083);
    float _1279 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1281 = fma(_1253, -2.0, _1267);
    bool _1283 = !_1059;
    float _1285 = _1283 ? _1083 : as_type<float>(_1271);
    bool _1287 = !_1077;
    float _1289 = _1287 ? _1083 : as_type<float>(_1277);
    float _1291 = fma(_1237, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1279);
    float _1293 = _1267;
    float _1295 = _1253;
    float _1297 = (*spvDescriptorSet0.vp_c9)._m0[82].y;
    if (!_1255)
    {
        _1293 = _1151;
    }
    float _1299 = _1293;
    float _1301 = _1299;
    if (!_1255)
    {
        _1295 = _1191;
    }
    float _1303 = _1295;
    float _1305 = _1303;
    if (!_1255)
    {
        _1297 = _1187;
    }
    float _1307 = _1297;
    float _1309 = _1307;
    if (!_1255)
    {
        _1155 = _1161;
    }
    float _1311 = _1155;
    float _1313 = _1311;
    if (!_1255)
    {
        _1157 = _1273;
    }
    float _1315 = _1157;
    bool _1317 = !_1255;
    float _1319 = _1315;
    if (!_1317)
    {
        float _1321 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1323 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1325 = _1227 + _1323;
        float _1327 = _1273 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1329 = rsqrt(_1201);
        float _1331 = _1325 * _1321;
        float _1333 = _1331 * 0.15915493667125701904296875;
        float _1335 = _1333 * 6.283185482025146484375;
        float _1337 = sin(_1335);
        float _1339 = _1333 * 6.283185482025146484375;
        float _1341 = cos(_1339);
        float _1343 = fma(_1337, _1327, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1345 = _1329 * _1343;
        float _1347 = _1341 + (-1.0);
        float _1349 = fma(_1167, _1345, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1351 = fma(_1173, _1345, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1353 = _1347 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1355 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1357 = _1349 + _1355;
        float _1359 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1361 = _1351 + _1359;
        float _1363 = fma(_1273, _1341, _1353);
        float _1365 = _1357 * _1357;
        float _1367 = _1361 * _1361;
        _1319 = _1363;
        _1309 = _1365;
        _1305 = _1367;
        _1301 = _1349;
        _1313 = _1351;
    }
    float _1369 = _1319;
    float _1371 = _1309;
    float _1373 = _1305;
    float _1375 = _1301;
    float _1377 = _1313;
    float _1379 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1381 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1383 = _1369 + _1381;
    float _1385 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1243);
    float _1387 = -_117;
    float _1389 = fma(_1387, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1259);
    float _1391 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1291);
    float _1393 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1281);
    float _1395 = _1239 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1397 = fma(_1383, _1383, _1371);
    float _1399 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1401 = _1265 + 0.5;
    float _1403 = _1205 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1405 = _1397 + _1373;
    float _1407 = _1219 + 0.5;
    float _1409 = _1285 + (-0.5);
    float _1411 = _1401 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1413 = -_1289;
    float _1415 = _1413 + 0.5;
    float _1417 = fma(_1403, _1407, _1389);
    float _1419 = -_1395;
    float _1421 = -_1393;
    float _1423 = fma(_1419, _1409, _1421);
    float _1425 = _1411 * _1379;
    float _1427 = -_1385;
    float _1429 = _1427 + 1.0;
    float _1431 = sqrt(_1405);
    float _1433 = -_1391;
    float _1435 = _1433 + 1.0;
    float _1437 = _1415 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1439 = -_1429;
    float _1441 = fma(_1219, _1439, _1417);
    float _1443 = fma(_1285, _1435, _1423);
    float _1445 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1447 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1449 = _1437 * _1399;
    out.m_58.w = _1445;
    out.m_60.w = _1447;
    bool _1451 = _1431 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1453 = isnan(_1431);
    bool _1455 = _1451 || _1453;
    bool _1457 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1459 = _1455 || _1457;
    out.m_62.x = _1425;
    out.m_62.y = _1449;
    out.m_62.z = _1441;
    out.m_62.w = _1443;
    float _1461 = _1423;
    float _1463 = _1377;
    float _1465 = _1397;
    if (!_1459)
    {
        _1461 = 1.0;
    }
    float _1467 = _1461;
    bool _1469 = !_1459;
    float _1471 = _1467;
    if (!_1469)
    {
        bool _1473 = _1431 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1475 = isnan(_1431);
        bool _1477 = _1473 || _1475;
        bool _1479 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1481 = _1477 || _1479;
        if (!_1481)
        {
            float _1483 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1485 = _1431 + _1483;
            float _1487 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1489 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1487;
            float _1491 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1493 = _1491 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1495 = 1.0 / _1489;
            float _1497 = _1485 * _1495;
            float _1499 = fma(_1497, _1493, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1471 = _1499;
            _1501 = true;
        }
        else
        {
            bool _1503 = _1431 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1505 = isnan(_1431);
            bool _1507 = _1503 || _1505;
            bool _1509 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1511 = _1507 || _1509;
            if (!_1511)
            {
                float _1513 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1515 = _1431 + _1513;
                float _1517 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1519 = _1517 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1521 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1523 = _1521 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1525 = 1.0 / _1519;
                float _1527 = _1515 * _1525;
                float _1529 = fma(_1527, _1523, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1471 = _1529;
                _1501 = true;
            }
            else
            {
                _1471 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1501 = false;
    float _1531 = _1471;
    float _1533 = _1261 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1535 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1537 = _1375 + _1535;
    float _1539 = fma(_1143, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1533);
    bool _1541 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1543 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1545 = _1541 || _1543;
    bool _1547 = isnan(0.5);
    bool _1549 = _1545 || _1547;
    float _1551 = _1261 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1553 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1555 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1557 = _1553 || _1555;
    bool _1559 = isnan(0.5);
    bool _1561 = _1557 || _1559;
    float _1563 = fma(_1147, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1539);
    float _1565 = fma(_1537, _1531, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1567 = fma(_1143, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1551);
    float _1569 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1571 = _1369 + _1569;
    float _1573 = _1563 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1575 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1577 = _1377 + _1575;
    float _1579 = fma(_1147, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1567);
    float _1581 = fma(_1571, _1531, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1583 = 1.0 / _1573;
    float _1585 = fma(_1577, _1531, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1587 = _1579 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1589 = _1571;
    float _1591 = _1537;
    float _1593 = _1585;
    float _1595 = _1531;
    float _1597 = _1573;
    if (_1561)
    {
        _1463 = _1565;
    }
    float _1599 = _1463;
    float _1601 = _1587 + _1573;
    float _1603 = _1599;
    if (_1561)
    {
        _1589 = _1581;
    }
    float _1605 = _1589;
    float _1607 = _1605;
    if (_1561)
    {
        _1591 = _1585;
    }
    float _1609 = _1591;
    float _1611 = _1609;
    if (!_1561)
    {
        float _1613 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1615 = _1261 + _1613;
        float _1617 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1619 = _1143 + _1617;
        float _1621 = -_1143;
        float _1623 = _1621 + _1565;
        float _1625 = -_1261;
        float _1627 = _1625 + _1581;
        float _1629 = _1615 * _1615;
        float _1631 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1633 = _1147 + _1631;
        float _1635 = -_1147;
        float _1637 = _1635 + _1585;
        float _1639 = fma(_1619, _1619, _1629);
        float _1641 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1643 = fma(_1633, _1633, _1639);
        float _1645 = sqrt(_1643);
        float _1647 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        bool _1649 = _1645 > (*spvDescriptorSet0.vp_c9)._m0[199].x;
        bool _1651 = isnan(_1645);
        bool _1653 = _1649 || _1651;
        bool _1655 = isnan((*spvDescriptorSet0.vp_c9)._m0[199].x);
        bool _1657 = _1653 || _1655;
        float _1659 = precise::min(_1645, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1661 = _1659 * _1641;
        float _1663 = _1647 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1665 = _1663 * _1661;
        float _1667 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
        float _1669 = _1641;
        float _1671 = _1645;
        float _1673 = _1663;
        _1593 = _1637;
        if (_1657)
        {
            float _1675 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].y;
            _1667 = _1675;
        }
        float _1677 = _1667;
        if (_1657)
        {
            float _1679 = precise::max(_1645, (*spvDescriptorSet0.vp_c9)._m0[199].y);
            _1669 = _1679;
        }
        float _1681 = _1669;
        float _1683 = fma(_1623, _1665, _1143);
        float _1685 = _1683;
        if (_1657)
        {
            float _1687 = _1681 * _1677;
            _1671 = _1687;
        }
        float _1689 = _1671;
        float _1691 = fma(_1627, _1665, _1261);
        float _1693 = fma(_1637, _1665, _1147);
        float _1695 = _1689;
        float _1697 = _1691;
        if (_1657)
        {
            float _1699 = _1663 * _1689;
            _1695 = _1699;
        }
        float _1701 = _1695;
        _1595 = _1701;
        if (!_1657)
        {
            _1673 = _1693;
        }
        float _1703 = _1673;
        _1611 = _1703;
        if (_1657)
        {
            float _1705 = fma(_1623, _1701, _1143);
            _1685 = _1705;
        }
        float _1707 = _1685;
        _1603 = _1707;
        if (_1657)
        {
            float _1709 = fma(_1627, _1701, _1261);
            _1697 = _1709;
        }
        float _1711 = _1697;
        _1607 = _1711;
        if (_1657)
        {
            float _1713 = fma(_1637, _1701, _1147);
            _1611 = _1713;
        }
    }
    float _1715 = _1607;
    float _1717 = _1603;
    float _1719 = _1611;
    float _1721 = _1593;
    float _1723 = _1595;
    float _1725 = _1723;
    float _1727 = _1721;
    if (_1549)
    {
        _1725 = 1.0;
    }
    float _1729 = _1725;
    float _1731 = _1601 * _1583;
    float _1733 = _1731 * 0.5;
    float _1735 = _1729;
    if (!_1549)
    {
        float _1737 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1739 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1741 = fma(_1733, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1739);
        float _1743 = _1737 * 0.15915493667125701904296875;
        float _1745 = _1743 * 6.283185482025146484375;
        float _1747 = cos(_1745);
        float _1749 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1751 = _1749 * 0.15915493667125701904296875;
        float _1753 = _1743 * 6.283185482025146484375;
        float _1755 = sin(_1753);
        float _1757 = 1.0 / _1747;
        float _1759 = _1751 * 6.283185482025146484375;
        float _1761 = cos(_1759);
        float _1763 = _1755 * _1757;
        float _1765 = 1.0 / _1741;
        float _1767 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1769 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1767;
        float _1771 = _1761 * _1763;
        float _1773 = _1751 * 6.283185482025146484375;
        float _1775 = sin(_1773);
        float _1777 = 1.0 / _1771;
        float _1779 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1781 = _1765 * _1779;
        float _1783 = 1.0 / _1769;
        float _1785 = _1775 * _1777;
        float _1787 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1789 = fma(_1785, _1781, _1787);
        float _1791 = _1789 * _1783;
        float _1793 = precise::clamp(_1791, 0.0, 1.0);
        float _1795 = -_1793;
        float _1797 = _1795 + 1.0;
        _1597 = _1783;
        _1735 = _1797;
    }
    float _1799 = _1597;
    float _1801 = _1735;
    float _1803 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1805 = _1715 + _1803;
    float _1807 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1809 = _1717 + _1807;
    float _1811 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1813 = _1719 + _1811;
    float _1815 = _1805 * _1805;
    float _1817 = fma(_1809, _1809, _1815);
    float _1819 = fma(_1813, _1813, _1817);
    float _1821 = rsqrt(_1819);
    float _1823 = _1821 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1825 = _1809 * _1823;
    float _1827 = _1813 * _1823;
    float _1829 = _1825 * _1825;
    float _1831 = _1827 * _1827;
    float _1833 = _1829 + _1831;
    float _1835 = sqrt(_1833);
    bool _1837 = _1835 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1839 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1841 = _1835 + _1839;
    float _1843 = _1813;
    float _1845 = _1799;
    float _1847 = _1841;
    float _1849 = _1805;
    float _1851 = _1825;
    if (_1837)
    {
        float _1853 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1843 = _1853;
    }
    float _1855 = _1843;
    if (_1837)
    {
        float _1857 = rsqrt(_1833);
        _1845 = _1857;
    }
    float _1859 = _1845;
    float _1861 = _1859;
    if (_1837)
    {
        float _1863 = _1841 * _1855;
        _1847 = _1863;
    }
    float _1865 = _1847;
    if (_1837)
    {
        float _1867 = _1865 * 0.15915493667125701904296875;
        _1727 = _1867;
    }
    float _1869 = _1727;
    float _1871 = _1815;
    if (_1837)
    {
        float _1873 = _1869 * 6.283185482025146484375;
        float _1875 = sin(_1873);
        _1871 = _1875;
    }
    float _1877 = _1871;
    float _1879 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1881 = precise::max(0.0, _1879);
    float _1883 = _1821;
    float _1885 = _1881;
    float _1887 = _1879;
    if (_1837)
    {
        float _1889 = _1869 * 6.283185482025146484375;
        float _1891 = cos(_1889);
        _1883 = _1891;
    }
    float _1893 = _1883;
    float _1895 = -_1823;
    float _1897 = -_1881;
    float _1899 = fma(_1805, _1895, _1897);
    if (!_1837)
    {
        _1885 = _1827;
    }
    float _1901 = _1885;
    float _1903 = _1901;
    if (_1837)
    {
        float _1905 = _1899 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1887 = _1905;
    }
    float _1907 = _1887;
    float _1909 = sqrt(_1819);
    float _1911 = _1877;
    float _1913 = _1907;
    if (_1837)
    {
        float _1915 = fma(_1877, _1907, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1849 = _1915;
    }
    float _1917 = _1849;
    float _1919 = _1917;
    if (!_1837)
    {
        _1911 = _1899;
    }
    float _1921 = _1911;
    float _1923 = _1921;
    if (_1837)
    {
        float _1925 = _1893 + (-1.0);
        _1913 = _1925;
    }
    float _1927 = _1913;
    float _1929 = _1927;
    if (_1837)
    {
        float _1931 = _1859 * _1917;
        _1465 = _1931;
    }
    float _1933 = _1465;
    if (!_1837)
    {
        _1919 = _1831;
    }
    float _1935 = _1919;
    float _1937 = _1935;
    if (_1837)
    {
        float _1939 = _1927 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1861 = _1939;
    }
    float _1941 = _1861;
    if (_1837)
    {
        float _1943 = _1825 * _1933;
        _1851 = _1943;
    }
    float _1945 = _1851;
    if (!_1837)
    {
        _1929 = _1829;
    }
    float _1947 = _1929;
    float _1949 = _1947;
    if (_1837)
    {
        float _1951 = _1827 * _1933;
        _1903 = _1951;
    }
    float _1953 = _1903;
    if (_1837)
    {
        float _1955 = fma(_1899, _1893, _1941);
        _1923 = _1955;
    }
    float _1957 = _1923;
    if (_1837)
    {
        float _1959 = _1945 * _1945;
        _1949 = _1959;
    }
    float _1961 = _1949;
    if (_1837)
    {
        float _1963 = _1953 * _1953;
        _1937 = _1963;
    }
    float _1965 = _1937;
    float _1967 = fma(_1957, _1957, _1961);
    float _1969 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1971 = fma(_1909, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1969);
    float _1973 = precise::clamp(_1971, 0.0, 1.0);
    float _1975 = _1715 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1977 = _1967 + _1965;
    float _1979 = _1715 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1981 = -_1973;
    float _1983 = _1981 + 1.0;
    float _1985 = fma(_1717, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1975);
    float _1987 = rsqrt(_1977);
    float _1989 = fma(_1717, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1979);
    float _1991 = _1715 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1993 = _1715 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1995 = fma(_1719, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1985);
    float _1997 = fma(_1719, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1989);
    float _1999 = fma(_1717, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1991);
    float _2001 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2003 = abs(_1983);
    float _2005 = log2(_2003);
    float _2007 = fma(_1717, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1993);
    float _2009 = fma(_1719, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1999);
    float _2011 = _1995 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2013 = _1997 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2015 = fma(_1719, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2007);
    float _2017 = _2009 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2019 = _2011 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2021 = _1987 * _1945;
    float _2023 = _1987 * _1957;
    float _2025 = _1987 * _1953;
    float _2027 = fma(_2017, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2019);
    float _2029 = _2021 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2031 = _2013 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2033 = _2015 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2035 = fma(_2013, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2027);
    float _2037 = -_2029;
    float _2039 = fma(_2023, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2037);
    float _2041 = -_2031;
    float _2043 = fma(_2041, _2001, 1.0);
    float _2045 = _2005 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2047 = fma(_2033, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2035);
    float _2049 = -_2025;
    float _2051 = fma(_2049, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2039);
    float _2053 = _2011 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2055 = exp2(_2045);
    float _2057 = _2011 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2059 = fma(_2051, -0.5, 0.5);
    float _2061 = fma(_2017, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2053);
    float _2063 = fma(_2051, 0.5, 0.5);
    float _2065 = fma(_2017, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2057);
    float _2067 = _2023 + 1.0;
    float _2069 = fma(_2013, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2061);
    float _2071 = log2(_2043);
    float _2073 = fma(_2013, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2065);
    float _2075 = fma(_2063, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2077 = fma(_2033, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2069);
    float _2079 = fma(_2033, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2073);
    float _2081 = fma(_2063, _2075, -0.212114393711090087890625);
    float _2083 = 1.0 / _2047;
    float _2085 = -_2023;
    float _2087 = fma(_2055, _2067, _2085);
    float _2089 = fma(_2063, _2081, 1.570728778839111328125);
    float _2091 = fma(_2087, 0.5, 0.5);
    float _2093 = sqrt(_2059);
    float _2095 = _2071 * 0.693147182464599609375;
    float _2097 = _2095 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2099 = _2077 * _2083;
    float _2101 = _2079 * _2083;
    float _2103 = fma(_2099, 0.5, 0.5);
    float _2105 = fma(_2101, -0.5, 0.5);
    float _2107 = _2093 * 0.636619746685028076171875;
    float3 _5520 = float3(_2103, _2105, _2097);
    float _2109 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5520, float3(0.0), isnan(_5520)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5520, float3(0.0), isnan(_5520)), level(0.0)).x;
    float3 _5531 = float3(_2103, _2105, _2097);
    float4 _2112 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5531, float3(0.0), isnan(_5531)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5531, float3(0.0), isnan(_5531)), level(0.0)).xyzw;
    float _2114 = _2112.x;
    float _2116 = _2112.y;
    float _2118 = _2112.z;
    float _2120 = _2112.w;
    float _2122 = -_2089;
    float _2124 = fma(_2107, _2122, 1.0);
    float2 _5553 = float2(_2124, _2091);
    float3 _2128 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5553, float2(0.0), isnan(_5553)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5553, float2(0.0), isnan(_5553)), level(0.0)).xyz;
    float _2130 = _2128.x;
    float _2132 = _2128.y;
    float _2134 = _2128.z;
    float _2136 = _2005 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2138 = _2011 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2140 = _1801 > 0.0;
    bool _2142 = isnan(_1801);
    bool _2144 = _2140 || _2142;
    bool _2146 = isnan(0.0);
    bool _2148 = _2144 || _2146;
    float _2150 = _1801 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2152 = fma(_2017, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2138);
    float _2154 = exp2(_2136);
    float _2156 = fma(_2013, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2152);
    float _2158 = fma(_2033, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2156);
    float _2160 = _2158 + _2047;
    out.gl_Position.x = _2077;
    out.gl_Position.y = _2079;
    out.gl_Position.z = _2158;
    out.gl_Position.w = _2047;
    float _2162 = _2160 * 0.5;
    float _2164 = -_2154;
    float _2166 = _2164 + 1.0;
    float _2168 = _2150 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2170 = _2166 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_64.z = _2162;
    out.m_64.w = _2047;
    out.m_47.x = _2168;
    float _2172 = _2170 * _2109;
    float _2174 = -_2170;
    float _2176 = _2174 + 1.0;
    float _2178 = _2120 * _2172;
    float _2180 = _2120 * _2176;
    float _2182 = _2134 * _2172;
    float _2184 = fma(_2130, _2178, _2114);
    float _2186 = fma(_2132, _2178, _2116);
    float _2188 = fma(_2120, _2182, _2118);
    out.m_66.x = _2184;
    out.m_66.y = _2186;
    out.m_66.z = _2188;
    out.m_66.w = _2180;
    if (_2148)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _2190 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2190;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

