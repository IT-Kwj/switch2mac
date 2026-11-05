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
    constant _16* vp_c9 [[id(0)]];
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c10 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c7 [[id(4)]];
    texture3d<float> vp_t_tcb_32 [[id(5)]];
    sampler vp_t_tcb_32Smplr [[id(6)]];
    texture3d<float> vp_t_tcb_30 [[id(7)]];
    sampler vp_t_tcb_30Smplr [[id(8)]];
    texture2d<float> vp_t_tcb_1C [[id(9)]];
    sampler vp_t_tcb_1CSmplr [[id(10)]];
    sampler vp_t_tcb_32Smplr_w [[id(11)]];
    sampler vp_t_tcb_30Smplr_w [[id(12)]];
    sampler vp_t_tcb_1CSmplr_w [[id(13)]];
    constant dm_border_t* dm_border [[id(14)]];
};

struct main0_out
{
    float4 m_62 [[user(locn0)]];
    float4 m_56 [[user(locn1)]];
    float4 m_64 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_58 [[user(locn4)]];
    float4 m_60 [[user(locn5)]];
    float4 m_66 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_51 [[attribute(4)]];
    float4 m_49 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _613 = false;
    bool _459 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _80 = in.m_42.w;
    float _82 = trunc(_80);
    int _85 = int(_82);
    bool _89 = _85 >= 1;
    float _91 = 0.0;
    float _93 = 0.0;
    float _95 = 0.0;
    if (!_89)
    {
        _91 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _97 = _91;
    float _99 = _97;
    if (!_89)
    {
        out.m_45.x = 0.0;
    }
    int _101 = 0;
    if (!_89)
    {
        float _103 = _97 * 5.0;
        _101 = as_type<int>(_103);
    }
    int _105 = _101;
    if (!_89)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2183 = as_type<float>(_105);
        out.gl_Position.z = _2183;
    }
    if (!_89)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _107 = in.m_47.w;
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
        float _127 = float(_85);
        _123 = _127;
    }
    float _129 = _123;
    bool _131 = _121 >= _129;
    bool _133 = !_117;
    bool _135 = _131 || _133;
    if (_135)
    {
        _99 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _137 = _99;
    if (_135)
    {
        out.m_45.x = 0.0;
    }
    int _139 = 0;
    if (_135)
    {
        float _141 = _137 * 5.0;
        _139 = as_type<int>(_141);
    }
    int _143 = _139;
    if (_135)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2251 = as_type<float>(_143);
        out.gl_Position.z = _2251;
    }
    if (_135)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _145 = in.m_47.x;
    float _147 = in.m_47.y;
    float _149 = in.m_47.z;
    float _151 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _153 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _155 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _157 = _153 || _155;
    bool _159 = isnan(1.0);
    bool _161 = _157 || _159;
    float _163 = _151;
    if (!_161)
    {
        float _165 = _151 * _151;
        float _167 = _165 * 0.5;
        _125 = _167;
    }
    float _169 = _125;
    float _171 = 0.0;
    float _173 = _169;
    if (!_161)
    {
        float _175 = _121 * _121;
        float _177 = _175 * 0.5;
        _171 = _177;
    }
    float _179 = _171;
    if (!_161)
    {
        float _181 = _169 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _173 = _181;
    }
    float _183 = _173;
    bool _185 = !_161;
    float _187 = _183;
    if (!_185)
    {
        float _189 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _191 = log2(_189);
        float _193 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _195 = _193 + 1.0;
        float _197 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _199 = _151 * _191;
        float _201 = 1.0 / _195;
        float _203 = _197 * 0.693147182464599609375;
        float _205 = exp2(_199);
        float _207 = 1.0 / _203;
        float _209 = _205 + (-1.0);
        float _211 = -_209;
        float _213 = fma(_211, _207, _151);
        float _215 = _213 * _201;
        float _217 = _215 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _93 = _207;
        _187 = _217;
        _95 = _205;
    }
    float _219 = _93;
    float _221 = _187;
    float _223 = _95;
    bool _225 = !_161;
    float _227 = _219;
    float _229 = _223;
    if (!_225)
    {
        float _231 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _233 = log2(_231);
        float _235 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _237 = _235 + 1.0;
        float _239 = 1.0 / _237;
        float _241 = _151 * _233;
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
    if (!_161)
    {
        _257 = _121;
    }
    float _261 = _257;
    float _263 = _221 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _265 = _261;
    if (!_161)
    {
        float _267 = _179 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _259 = _267;
    }
    float _269 = _259;
    bool _271 = !_161;
    float _273 = _269;
    if (!_271)
    {
        float _275 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _277 = log2(_275);
        float _279 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _281 = _279 + 1.0;
        float _283 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _285 = _121 * _277;
        float _287 = 1.0 / _281;
        float _289 = _283 * 0.693147182464599609375;
        float _291 = exp2(_285);
        float _293 = 1.0 / _289;
        float _295 = _291 + (-1.0);
        float _297 = -_295;
        float _299 = fma(_297, _293, _121);
        float _301 = _299 * _287;
        float _303 = _301 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _273 = _303;
    }
    float _305 = _273;
    bool _307 = !_161;
    if (!_307)
    {
        float _309 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _311 = log2(_309);
        float _313 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _315 = _313 + 1.0;
        float _317 = 1.0 / _315;
        float _319 = _121 * _311;
        float _321 = exp2(_319);
        float _323 = -_321;
        float _325 = _323 + 1.0;
        float _327 = _325 * _317;
        _265 = _327;
    }
    float _329 = _265;
    float _331 = _305 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _333 = fma(_255, _147, _263);
    float _335 = _221 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _337 = _305 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _339 = fma(_329, _147, _331);
    float _341 = _221 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _343 = _305 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _345 = fma(_255, _145, _335);
    float _347 = fma(_329, _145, _337);
    float _349 = -_339;
    float _351 = _333 + _349;
    float _353 = fma(_255, _149, _341);
    float _355 = fma(_329, _149, _343);
    float _357 = -_347;
    float _359 = _345 + _357;
    float _361 = _351 * _351;
    float _363 = in.m_49.w;
    float _365 = -_355;
    float _367 = _353 + _365;
    float _369 = _351 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _371 = fma(_359, _359, _361);
    float _373 = _351 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _375 = in.m_42.x;
    float _377 = in.m_42.y;
    float _379 = in.m_42.z;
    float _381 = _351 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _383 = fma(_367, _367, _371);
    float _385 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[4].x, _369);
    float _387 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[5].x, _373);
    float _389 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[6].x, _381);
    float _391 = fma(_367, (*spvDescriptorSet0.vp_c10)._m0[4].z, _385);
    float _393 = sqrt(_383);
    float _395 = fma(_367, (*spvDescriptorSet0.vp_c10)._m0[5].z, _387);
    bool _397 = _393 >= 9.9999999747524270787835121154785e-07;
    bool _399 = isnan(_393);
    bool _401 = _397 || _399;
    bool _403 = isnan(9.9999999747524270787835121154785e-07);
    bool _405 = _401 || _403;
    float _407 = fma(_367, (*spvDescriptorSet0.vp_c10)._m0[6].z, _389);
    float _409 = fma(_345, _363, _375);
    float _411 = fma(_333, _363, _377);
    float _413 = fma(_353, _363, _379);
    float _415 = _395;
    float _417 = _391;
    float _419 = _407;
    if (!_405)
    {
        bool _421 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _423 = !_421;
        if (!_423)
        {
            float _425 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _427 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _429 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _431 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _425);
            float _433 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _427);
            float _435 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _429);
            float _437 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _431);
            float _439 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _433);
            float _441 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _435);
            float _443 = _437 * _437;
            float _445 = fma(_439, _439, _443);
            float _447 = fma(_441, _441, _445);
            float _449 = rsqrt(_447);
            float _451 = _449 * 9.9999999747524270787835121154785e-07;
            float _453 = _439 * _451;
            float _455 = _437 * _451;
            float _457 = _441 * _451;
            _415 = _455;
            _417 = _453;
            _419 = _457;
            _459 = true;
        }
        else
        {
            float _461 = _147 * _147;
            float _463 = fma(_145, _145, _461);
            float _465 = fma(_149, _149, _463);
            float _467 = sqrt(_465);
            bool _469 = _467 >= 9.9999999747524270787835121154785e-07;
            bool _471 = isnan(_467);
            bool _473 = _469 || _471;
            bool _475 = isnan(9.9999999747524270787835121154785e-07);
            bool _477 = _473 || _475;
            if (!_477)
            {
                float _479 = _377 * _377;
                float _481 = fma(_375, _375, _479);
                float _483 = fma(_379, _379, _481);
                float _485 = sqrt(_483);
                bool _487 = _485 >= 9.9999999747524270787835121154785e-07;
                bool _489 = isnan(_485);
                bool _491 = _487 || _489;
                bool _493 = isnan(9.9999999747524270787835121154785e-07);
                bool _495 = _491 || _493;
                if (!_495)
                {
                    float _497 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _499 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _497);
                    float _501 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _499);
                    float _503 = rsqrt(_501);
                    float _505 = _503 * 9.9999999747524270787835121154785e-07;
                    float _507 = _505 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _509 = _505 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _511 = _505 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _415 = _509;
                    _417 = _507;
                    _419 = _511;
                    _459 = true;
                }
                else
                {
                    float _513 = _377 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _515 = _377 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _517 = _377 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _519 = fma(_375, (*spvDescriptorSet0.vp_c10)._m0[5].x, _513);
                    float _521 = fma(_375, (*spvDescriptorSet0.vp_c10)._m0[4].x, _515);
                    float _523 = fma(_375, (*spvDescriptorSet0.vp_c10)._m0[6].x, _517);
                    float _525 = fma(_379, (*spvDescriptorSet0.vp_c10)._m0[5].z, _519);
                    float _527 = fma(_379, (*spvDescriptorSet0.vp_c10)._m0[4].z, _521);
                    float _529 = fma(_379, (*spvDescriptorSet0.vp_c10)._m0[6].z, _523);
                    float _531 = _525 * _525;
                    float _533 = fma(_527, _527, _531);
                    float _535 = fma(_529, _529, _533);
                    float _537 = rsqrt(_535);
                    float _539 = _537 * 9.9999999747524270787835121154785e-07;
                    float _541 = _527 * _539;
                    float _543 = _525 * _539;
                    float _545 = _529 * _539;
                    _415 = _543;
                    _417 = _541;
                    _419 = _545;
                    _459 = true;
                }
            }
            else
            {
                float _547 = _147 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _549 = _147 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _551 = _147 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _553 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[5].x, _547);
                float _555 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[4].x, _549);
                float _557 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[6].x, _551);
                float _559 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[5].z, _553);
                float _561 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[4].z, _555);
                float _563 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[6].z, _557);
                float _565 = _559 * _559;
                float _567 = fma(_561, _561, _565);
                float _569 = fma(_563, _563, _567);
                float _571 = rsqrt(_569);
                float _573 = _571 * 9.9999999747524270787835121154785e-07;
                float _575 = _561 * _573;
                float _577 = _559 * _573;
                float _579 = _563 * _573;
                _415 = _577;
                _417 = _575;
                _419 = _579;
            }
        }
    }
    _459 = false;
    float _581 = _415;
    float _583 = _417;
    float _585 = _419;
    bool _587 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    bool _589 = !_587;
    float _609;
    float _611;
    if (!_589)
    {
        float _591 = in.m_51.x;
        float _593 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _595 = float(_85);
        float _597 = _591 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _599 = fma(_597, (*spvDescriptorSet0.vp_c9)._m0[11].y, _121);
        float _601 = _599 * _593;
        float _603 = floor(_601);
        float _605 = -_603;
        float _607 = _601 + _605;
        _609 = _595;
        _611 = _607;
        _613 = true;
    }
    else
    {
        float _615 = float(_85);
        float _617 = 1.0 / _615;
        float _619 = _121 * _617;
        _609 = _615;
        _611 = _619;
    }
    _613 = false;
    float _621 = _609;
    float _623 = _611;
    float _625 = _411 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _627 = _411 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _629 = fma(_409, (*spvDescriptorSet0.vp_c10)._m0[5].x, _625);
    float _631 = _411 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _633 = fma(_409, (*spvDescriptorSet0.vp_c10)._m0[4].x, _627);
    float _635 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[5].z, _629);
    float _637 = fma(_409, (*spvDescriptorSet0.vp_c10)._m0[6].x, _631);
    float _639 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[4].z, _633);
    float _641 = _635 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _643 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[6].z, _637);
    float _645 = _639 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _647 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _649 = _641 + _647;
    float _651 = _643 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _653 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _655 = _645 + _653;
    float _657 = _649 * _649;
    float _659 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _661 = _651 + _659;
    float _663 = fma(_655, _655, _657);
    float _665 = fma(_661, _661, _663);
    float _667 = _581 * _581;
    float _669 = rsqrt(_665);
    float _671 = fma(_583, _583, _667);
    float _673 = fma(_585, _585, _671);
    float _675 = rsqrt(_673);
    float _677 = _649 * _669;
    float _679 = _655 * _669;
    float _681 = _661 * _669;
    float _683 = -_677;
    float _685 = fma(_683, (*spvDescriptorSet0.vp_c9)._m0[18].w, _649);
    float _687 = -_679;
    float _689 = fma(_687, (*spvDescriptorSet0.vp_c9)._m0[18].w, _655);
    float _691 = -_681;
    float _693 = fma(_691, (*spvDescriptorSet0.vp_c9)._m0[18].w, _661);
    float _695 = _685 * _685;
    float _697 = _675 * _585;
    float _699 = _675 * _581;
    float _701 = fma(_689, _689, _695);
    float _703 = _675 * _583;
    float _705 = as_type<float>(int(gl_VertexIndex));
    float _707 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _709 = _697 * _707;
    float _711 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _713 = _699 * _711;
    float _715 = fma(_693, _693, _701);
    float _717 = in.m_49.x;
    float _719 = in.m_49.y;
    float _721 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _723 = -_709;
    float _725 = fma(_703, _721, _723);
    float _727 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _729 = -_713;
    float _731 = fma(_697, _727, _729);
    float _733 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _735 = _703 * _733;
    float _737 = _725 * _725;
    float _739 = sqrt(_715);
    float _741 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _743 = -_735;
    float _745 = fma(_699, _741, _743);
    float _747 = fma(_731, _731, _737);
    float _749 = fma(_745, _745, _747);
    float _751 = rsqrt(_749);
    int _753 = as_type<int>(_705) & 1;
    bool _755 = _753 != 0;
    int _757 = as_type<int>(_705) & 2;
    bool _759 = _757 != 0;
    float _761 = _669 * _739;
    float _763 = _719 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _765 = _717 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    bool _767 = !_759;
    float _769 = _767 ? (-0.5) : 0.5;
    float _771 = _763 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _773 = !_755;
    float _775 = _773 ? (-0.5) : 0.5;
    float _777 = _765 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _779 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _769);
    float _781 = _771 * _761;
    float _783 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _775);
    float _785 = _777 * _761;
    float _787 = _725 * _751;
    float _789 = _781 * _779;
    float _791 = _731 * _751;
    float _793 = _745 * _751;
    float _795 = _785 * _783;
    float _797 = _703 * _787;
    float _799 = _789 * _697;
    float _801 = _699 * _793;
    float _803 = _761 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _805 = _803 * 0.5;
    float _807 = -_797;
    float _809 = fma(_699, _791, _807);
    float _811 = _789 * _703;
    float _813 = fma(_795, _793, _799);
    float _815 = -_801;
    float _817 = fma(_697, _787, _815);
    float _819 = _697 * _791;
    float _821 = fma(_795, _791, _811);
    float _823 = fma(_805, _809, _813);
    float _825 = _789 * _699;
    float _827 = -_819;
    float _829 = fma(_703, _793, _827);
    float _831 = fma(_805, _817, _821);
    float _833 = _651 + _823;
    float _835 = fma(_795, _787, _825);
    float _837 = _645 + _831;
    float _839 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _841 = _833 + _839;
    float _843 = fma(_805, _829, _835);
    float _845 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _847 = _837 + _845;
    float _849 = _841 * _841;
    float _851 = _641 + _843;
    float _853 = fma(_847, _847, _849);
    float _855 = sqrt(_853);
    bool _857 = _855 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _859 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _861 = _859 != 0;
    int _863 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _865 = _863 != 0;
    int _867 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _869 = _867 != 0;
    bool _871 = !_865;
    int _873 = _871 ? 0 : 1;
    bool _875 = !_861;
    int _877 = _875 ? 0 : 1;
    bool _879 = !_869;
    int _881 = _879 ? 0 : 1;
    float _883 = _829;
    float _885 = _641;
    float _887 = _849;
    float _889 = _855;
    float _891 = _847;
    float _893 = _789;
    if (!_857)
    {
        _883 = _837;
    }
    float _895 = _883;
    float _897 = _895;
    if (!_857)
    {
        _885 = _833;
    }
    float _899 = _885;
    float _901 = _899;
    if (!_857)
    {
        _887 = _851;
    }
    float _903 = _887;
    bool _905 = !_857;
    float _907 = _903;
    if (!_905)
    {
        float _909 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _911 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _913 = _855 + _911;
        float _915 = _851 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _917 = rsqrt(_853);
        float _919 = _913 * _909;
        float _921 = _919 * 0.15915493667125701904296875;
        float _923 = _921 * 6.283185482025146484375;
        float _925 = cos(_923);
        float _927 = _921 * 6.283185482025146484375;
        float _929 = sin(_927);
        float _931 = _925 + (-1.0);
        float _933 = _931 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _935 = fma(_929, _915, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _937 = fma(_851, _925, _933);
        float _939 = _917 * _935;
        float _941 = fma(_847, _939, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _943 = fma(_841, _939, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _907 = _937;
        _897 = _941;
        _901 = _943;
        _889 = _921;
    }
    float _945 = _907;
    float _947 = _897;
    float _949 = _901;
    float _951 = _889;
    float _953 = -_677;
    float _955 = fma(_953, (*spvDescriptorSet0.vp_c9)._m0[18].w, _945);
    float _957 = -_679;
    float _959 = fma(_957, (*spvDescriptorSet0.vp_c9)._m0[18].w, _947);
    float _961 = -_681;
    float _963 = fma(_961, (*spvDescriptorSet0.vp_c9)._m0[18].w, _949);
    float _965 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _967 = _955 + _965;
    float _969 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _971 = _959 + _969;
    float _973 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _975 = _963 + _973;
    float _977 = _967 * _967;
    float _979 = fma(_971, _971, _977);
    float _981 = fma(_975, _975, _979);
    float _983 = rsqrt(_981);
    float _985 = _983 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _987 = _971 * _985;
    float _989 = _975 * _985;
    float _991 = _987 * _987;
    float _993 = _989 * _989;
    float _995 = _991 + _993;
    float _997 = sqrt(_995);
    bool _999 = _997 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1001 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1003 = _997 + _1001;
    float _1005 = _983;
    float _1007 = _995;
    float _1009 = _1003;
    float _1011 = _951;
    float _1013 = _967;
    if (_999)
    {
        float _1015 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1005 = _1015;
    }
    float _1017 = _1005;
    if (_999)
    {
        float _1019 = rsqrt(_995);
        _1007 = _1019;
    }
    float _1021 = _1007;
    float _1023 = _1021;
    if (_999)
    {
        float _1025 = _1003 * _1017;
        _1009 = _1025;
    }
    float _1027 = _1009;
    if (_999)
    {
        float _1029 = _1027 * 0.15915493667125701904296875;
        _1011 = _1029;
    }
    float _1031 = _1011;
    float _1033 = _975;
    if (_999)
    {
        float _1035 = _1031 * 6.283185482025146484375;
        float _1037 = sin(_1035);
        _1033 = _1037;
    }
    float _1039 = _1033;
    float _1041 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1043 = precise::max(0.0, _1041);
    float _1045 = _1017;
    float _1047 = _1043;
    if (_999)
    {
        float _1049 = _1031 * 6.283185482025146484375;
        float _1051 = cos(_1049);
        _1045 = _1051;
    }
    float _1053 = _1045;
    float _1055 = -_985;
    float _1057 = -_1043;
    float _1059 = fma(_967, _1055, _1057);
    if (_999)
    {
        float _1061 = _1059 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1013 = _1061;
    }
    float _1063 = _1013;
    float _1065 = sqrt(_981);
    float _1067 = _1063;
    float _1069 = _1039;
    if (_999)
    {
        float _1071 = fma(_1039, _1063, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1067 = _1071;
    }
    float _1073 = _1067;
    float _1075 = _1073;
    if (!_999)
    {
        _1069 = _987;
    }
    float _1077 = _1069;
    float _1079 = _1077;
    float _1081 = _1053;
    if (_999)
    {
        float _1083 = _1053 + (-1.0);
        _1047 = _1083;
    }
    float _1085 = _1047;
    float _1087 = _1085;
    if (_999)
    {
        float _1089 = _1021 * _1073;
        _891 = _1089;
    }
    float _1091 = _891;
    if (!_999)
    {
        _1075 = _1059;
    }
    float _1093 = _1075;
    float _1095 = _1093;
    if (_999)
    {
        float _1097 = _1085 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _893 = _1097;
    }
    float _1099 = _893;
    if (_999)
    {
        float _1101 = _987 * _1091;
        _1079 = _1101;
    }
    float _1103 = _1079;
    if (!_999)
    {
        _1087 = _989;
    }
    float _1105 = _1087;
    float _1107 = _1105;
    if (_999)
    {
        float _1109 = _989 * _1091;
        _1107 = _1109;
    }
    float _1111 = _1107;
    if (!_999)
    {
        _1023 = _991;
    }
    float _1113 = _1023;
    float _1115 = _1113;
    if (_999)
    {
        float _1117 = fma(_1059, _1053, _1099);
        _1095 = _1117;
    }
    float _1119 = _1095;
    if (_999)
    {
        float _1121 = _1103 * _1103;
        _1115 = _1121;
    }
    float _1123 = _1115;
    if (!_999)
    {
        _1081 = _993;
    }
    float _1125 = _1081;
    float _1127 = _1125;
    if (_999)
    {
        float _1129 = _1111 * _1111;
        _1127 = _1129;
    }
    float _1131 = _1127;
    float _1133 = fma(_1119, _1119, _1123);
    float _1135 = _1133 + _1131;
    float _1137 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1139 = fma(_1065, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1137);
    float _1141 = precise::clamp(_1139, 0.0, 1.0);
    float _1143 = _955 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1145 = _955 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1147 = rsqrt(_1135);
    float _1149 = -_1141;
    float _1151 = _1149 + 1.0;
    float _1153 = fma(_959, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1143);
    float _1155 = fma(_959, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1145);
    float _1157 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1159 = fma(_963, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1153);
    float _1161 = _955 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1163 = fma(_963, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1155);
    float _1165 = abs(_1151);
    float _1167 = log2(_1165);
    float _1169 = _955 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1171 = fma(_959, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1161);
    float _1173 = _1163 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1175 = _1159 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1177 = fma(_959, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1169);
    float _1179 = fma(_963, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1171);
    float _1181 = _1147 * _1103;
    float _1183 = _1147 * _1111;
    float _1185 = _1147 * _1119;
    float _1187 = _1179 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1189 = _1181 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1191 = _1173 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1193 = fma(_963, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1177);
    float _1195 = _1175 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1197 = -_1189;
    float _1199 = fma(_1185, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1197);
    float _1201 = fma(_1187, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1191);
    float _1203 = _1193 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1205 = -_1195;
    float _1207 = fma(_1205, _1157, 1.0);
    float _1209 = -_1183;
    float _1211 = fma(_1209, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1199);
    float _1213 = fma(_1175, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1201);
    float _1215 = _1167 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1217 = _1173 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1219 = fma(_1211, -0.5, 0.5);
    float _1221 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1213);
    float _1223 = log2(_1207);
    float _1225 = _1173 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1227 = fma(_1187, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1217);
    float _1229 = fma(_1211, 0.5, 0.5);
    float _1231 = _1185 + 1.0;
    float _1233 = fma(_1187, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1225);
    float _1235 = fma(_1175, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1227);
    float _1237 = fma(_1229, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1239 = exp2(_1215);
    float _1241 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1235);
    float _1243 = fma(_1229, _1237, -0.212114393711090087890625);
    float _1245 = fma(_1229, _1243, 1.570728778839111328125);
    float _1247 = 1.0 / _1221;
    float _1249 = fma(_1175, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1233);
    float _1251 = _1223 * 0.693147182464599609375;
    float _1253 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1249);
    float _1255 = _1251 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1257 = sqrt(_1219);
    float _1259 = -_1185;
    float _1261 = fma(_1239, _1231, _1259);
    float _1263 = fma(_1261, 0.5, 0.5);
    float _1265 = _1241 * _1247;
    float _1267 = _1253 * _1247;
    float _1269 = fma(_1265, 0.5, 0.5);
    float _1271 = fma(_1267, -0.5, 0.5);
    float _1273 = _1257 * 0.636619746685028076171875;
    float _1275 = -_1245;
    float _1277 = fma(_1273, _1275, 1.0);
    float3 _4105 = float3(_1269, _1271, _1255);
    float _1279 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4105, float3(0.0), isnan(_4105)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4105, float3(0.0), isnan(_4105)), level(0.0)).x;
    float3 _4116 = float3(_1269, _1271, _1255);
    float4 _1282 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4116, float3(0.0), isnan(_4116)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4116, float3(0.0), isnan(_4116)), level(0.0)).xyzw;
    float _1284 = _1282.x;
    float _1286 = _1282.y;
    float _1288 = _1282.z;
    float _1290 = _1282.w;
    float2 _4133 = float2(_1277, _1263);
    float3 _1294 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4133, float2(0.0), isnan(_4133)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4133, float2(0.0), isnan(_4133)), level(0.0)).xyz;
    float _1296 = _1294.x;
    float _1298 = _1294.y;
    float _1300 = _1294.z;
    float _1302 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1304 = int(_1302);
    int _1306 = abs(_877);
    float _1308 = _1173 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1310 = fma(_1187, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1308);
    float _1312 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1314 = int(_1312);
    float _1316 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1318 = float(_1304);
    float _1320 = 1.0 / _621;
    float _1322 = float(uint(_1314));
    float _1324 = 1.0 / _1318;
    int _1326 = ~_1314;
    int _1328 = _1326 + 1;
    int _1330 = ~_1314;
    int _1332 = _1330 + 1;
    int _1334 = _1314 + (-1);
    int _1336 = ~_1314;
    int _1338 = _1336 + 1;
    float _1340 = 1.0 / _1322;
    float _1342 = _121 * _1324;
    float _1344 = in.m_51.x;
    float _1346 = trunc(_1342);
    int _1348 = int(_1346);
    int _1350 = as_type<int>(_1340) + (-2);
    float _1352 = float(uint(_1348));
    float _1354 = as_type<float>(_1350) * _1352;
    float _1356 = trunc(_1354);
    float _1358 = precise::max(_1356, 0.0);
    uint _1361 = uint(_1358);
    int _1363 = _1328 * int(_1361);
    int _1365 = _1363 + _1348;
    float _1367 = float(uint(_1365));
    float _1369 = as_type<float>(_1350) * _1367;
    int _1371 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1373 = _1371 != 0;
    float _1375 = trunc(_1369);
    float _1377 = precise::max(_1375, 0.0);
    uint _1379 = uint(_1377);
    bool _1381 = !_1373;
    float _1383 = _1381 ? 7.345489978790283203125 : 1.0;
    float _1385 = _1383 * _1344;
    float _1387 = floor(_1385);
    int _1389 = int(_1361) + int(_1379);
    float _1391 = float(_1314);
    float _1393 = float(_1348);
    int _1395 = _1332 * _1389;
    int _1397 = _1395 + _1348;
    bool _1399 = _1393 >= _1391;
    bool _1401 = isnan(_1393);
    bool _1403 = _1399 || _1401;
    bool _1405 = isnan(_1391);
    bool _1407 = _1403 || _1405;
    float _1409 = float(_1407);
    bool _1411 = uint(_1397) >= uint(_1314);
    float _1413 = -_1387;
    float _1415 = _1385 + _1413;
    float _1417 = trunc(_1409);
    int _1419 = int(_1417);
    bool _1421 = !_1411;
    int _1423 = _1421 ? 0 : (-1);
    bool _1425 = _1314 == 0;
    int _1427 = ~_1389;
    int _1429 = _1427 + _1423;
    int _1431 = _1429 + 1;
    float _1433 = _1415 * _1391;
    float _1435 = _121 * _1391;
    int _1437 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1439 = _1437 != 0;
    int _1441 = _1314 * _1431;
    int _1443 = _1441 + _1348;
    float _1445 = _1435 * _1320;
    float _1447 = trunc(_1433);
    int _1449 = int(_1447);
    bool _1451 = !_1439;
    int _1453 = _1451 ? 0 : 1;
    bool _1455 = !_1425;
    int _1457 = _1455 ? _1443 : (-1);
    int _1459 = ~_1419;
    int _1461 = _1459 + 1;
    int _1463 = _1461 + 1;
    int _1465 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1467 = _1465 != 0;
    float _1469 = trunc(_1445);
    int _1471 = int(_1469);
    int _1473 = abs(_873);
    int _1475 = _1457 * _1463;
    int _1477 = abs(_1453);
    int _1479 = abs(_881);
    int _1481 = _1419 * _1334;
    int _1483 = _1481 + _1475;
    int _1485 = _1449 * _1477;
    int _1487 = _1485 + _1348;
    bool _1489 = !_1467;
    int _1491 = _1489 ? 0 : 1;
    int _1493 = ~_1314;
    int _1495 = _1493 + 1;
    int _1497 = _1483 * _1473;
    int _1499 = abs(_1491);
    float _1501 = in.m_51.w;
    int _1503 = _1471 * _1306;
    int _1505 = _1503 + _1497;
    float _1507 = _1344 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1509 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1511 = _1509 != 0;
    int _1513 = _1487 * _1479;
    int _1515 = _1513 + _1505;
    float _1517 = -_1316;
    float _1519 = fma(_1507, 2.0, _1517);
    float _1521 = float(uint(_1487));
    int _1523 = _1449 * _1499;
    int _1525 = _1523 + _1515;
    int _1527 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1529 = _1527 != 0;
    float _1531 = in.m_51.y;
    int _1533 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1535 = _1533 != 0;
    float _1537 = -_121;
    float _1539 = fma(_1537, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1519);
    float _1541 = float(uint(_1525));
    int _1543 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1545 = _1543 != 0;
    int _1547 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1549 = _1547 != 0;
    float _1551 = as_type<float>(_1350) * _1541;
    int _1553 = ~_1314;
    int _1555 = _1553 + 1;
    float _1557 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _1559 = trunc(_1551);
    float _1561 = precise::max(_1559, 0.0);
    uint _1563 = uint(_1561);
    float _1565 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1567 = _1565 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1569 = _1557 * _1344;
    float _1571 = 1.0 / _1567;
    int _1573 = _1555 * int(_1563);
    int _1575 = _1573 + _1525;
    float _1577 = _1531 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1579 = trunc(_1569);
    int _1581 = int(_1579);
    float _1583 = float(uint(_1575));
    float _1585 = as_type<float>(_1350) * _1583;
    float _1587 = trunc(_1585);
    float _1589 = precise::max(_1587, 0.0);
    uint _1591 = uint(_1589);
    int _1593 = int(_1563) + int(_1591);
    float _1595 = in.m_51.z;
    int _1597 = _1495 * _1593;
    int _1599 = _1597 + _1525;
    float _1601 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1603 = _1601 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1605 = uint(_1599) >= uint(_1314);
    float _1607 = 1.0 / _1603;
    bool _1609 = !_1605;
    int _1611 = _1609 ? 0 : (-1);
    bool _1613 = _1344 > 0.5;
    float _1615 = -_775;
    int _1617 = _1613 ? as_type<int>(_1615) : as_type<int>(_775);
    bool _1619 = !_1511;
    float _1621 = _1619 ? _775 : as_type<float>(_1617);
    bool _1623 = _1595 > 0.5;
    float _1625 = _1621 + 0.5;
    bool _1627 = _1501 > 0.5;
    float _1629 = -_775;
    int _1631 = _1623 ? as_type<int>(_1629) : as_type<int>(_775);
    float _1633 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1635 = fma(_1625, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1539);
    bool _1637 = _1531 > 0.5;
    float _1639 = fma(_1344, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1633);
    float _1641 = as_type<float>(_1350) * _1521;
    float _1643 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1645 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1647 = fma(_1577, -2.0, _1643);
    float _1649 = trunc(_1641);
    float _1651 = precise::max(_1649, 0.0);
    uint _1653 = uint(_1651);
    float _1655 = fma(_1531, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1645);
    float _1657 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1659 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1657;
    int _1661 = ~_1314;
    int _1663 = _1661 + 1;
    float _1665 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1647);
    int _1667 = ~_1593;
    int _1669 = _1667 + _1611;
    int _1671 = _1669 + 1;
    float _1673 = _1659 * _1607;
    float _1675 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1677 = _1675 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    int _1679 = _1581 << 4;
    int _1681 = _1679 + 1968;
    int _1683 = _1314 * _1671;
    int _1685 = _1683 + _1525;
    float _1687 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1689 = _623 + _1687;
    float _1691 = _1677 * _1571;
    int _1693 = _1681 + 8;
    uint _1695 = uint(int(uint(_1693) >> uint(2)));
    uint _1697 = uint(int(uint(int(_1695)) >> uint(2)));
    int _1699 = int(_1695) & 3;
    float _1701 = (*spvDescriptorSet0.vp_c9)._m0[int(_1697)][_1699];
    float _1703 = fma(_1673, _1689, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    int _1705 = _1663 * int(_1653);
    int _1707 = _1705 + _1487;
    float _1709 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1639);
    bool _1711 = _623 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1713 = isnan(_623);
    bool _1715 = _1711 || _1713;
    bool _1717 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1719 = _1715 || _1717;
    float _1721 = float(_1719);
    float _1723 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1725 = _623 + _1723;
    float _1727 = float(uint(_1707));
    float _1729 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1655);
    bool _1731 = !_1425;
    int _1733 = _1731 ? _1685 : (-1);
    uint _1735 = uint(int(uint(_1681) >> uint(2)));
    uint _1737 = uint(int(uint(int(_1735)) >> uint(2)));
    int _1739 = int(_1735) & 3;
    float _1741 = (*spvDescriptorSet0.vp_c9)._m0[int(_1737)][_1739];
    int _1743 = int(_1735) + 1;
    uint _1745 = uint(int(uint(_1743) >> uint(2)));
    int _1747 = _1743 & 3;
    float _1749 = (*spvDescriptorSet0.vp_c9)._m0[int(_1745)][_1747];
    float _1751 = fma(_1691, _1725, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1753 = as_type<float>(_1350) * _1727;
    int _1755 = _1733 >> 31;
    bool _1757 = _623 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1759 = isnan(_623);
    bool _1761 = _1757 || _1759;
    bool _1763 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1765 = _1761 || _1763;
    float _1767 = float(_1765);
    int _1769 = _1755 & 3;
    float _1771 = trunc(_1753);
    float _1773 = precise::max(_1771, 0.0);
    uint _1775 = uint(_1773);
    float _1777 = -_1721;
    float _1779 = _1777 + 1.0;
    bool _1781 = !_1545;
    float _1783 = _1781 ? _775 : as_type<float>(_1631);
    int _1785 = _1733 + _1769;
    float _1787 = _1767 * _1779;
    bool _1789 = _623 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1791 = isnan(_623);
    bool _1793 = _1789 || _1791;
    bool _1795 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1797 = _1793 || _1795;
    float _1799 = float(_1797);
    float _1801 = -_1767;
    float _1803 = _1801 + 1.0;
    int _1805 = _1785 >> 2;
    float _1807 = _1783 + 0.5;
    float _1809 = -_769;
    int _1811 = _1637 ? as_type<int>(_1809) : as_type<int>(_769);
    int _1813 = _1805 << 4;
    int _1815 = _1813 + 368;
    bool _1817 = !_1535;
    float _1819 = _1817 ? _769 : as_type<float>(_1811);
    float _1821 = _1799 * _1803;
    int _1823 = int(_1653) + int(_1775);
    float _1825 = -_1799;
    float _1827 = _1825 + 1.0;
    uint _1829 = uint(int(uint(_1815) >> uint(2)));
    uint _1831 = uint(int(uint(int(_1829)) >> uint(2)));
    int _1833 = int(_1829) & 3;
    float _1835 = (*spvDescriptorSet0.vp_c9)._m0[int(_1831)][_1833];
    int _1837 = int(_1829) + 1;
    uint _1839 = uint(int(uint(_1837) >> uint(2)));
    int _1841 = _1837 & 3;
    float _1843 = (*spvDescriptorSet0.vp_c9)._m0[int(_1839)][_1841];
    float _1845 = -_769;
    int _1847 = _1627 ? as_type<int>(_1845) : as_type<int>(_769);
    float _1849 = _1703 * _1821;
    int _1851 = _1733 & 3;
    bool _1853 = _1851 != 0;
    int _1855 = _1338 * _1823;
    int _1857 = _1855 + _1487;
    bool _1859 = !_1549;
    float _1861 = _1859 ? _769 : as_type<float>(_1847);
    float _1863 = fma(_1827, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1849);
    int _1865 = _1733 & 3;
    bool _1867 = _1865 != 0;
    int _1869 = _1815 + 8;
    uint _1871 = uint(int(uint(_1869) >> uint(2)));
    uint _1873 = uint(int(uint(int(_1871)) >> uint(2)));
    int _1875 = int(_1871) & 3;
    float _1877 = (*spvDescriptorSet0.vp_c9)._m0[int(_1873)][_1875];
    int _1879 = int(_1871) + 1;
    uint _1881 = uint(int(uint(_1879) >> uint(2)));
    int _1883 = _1879 & 3;
    float _1885 = (*spvDescriptorSet0.vp_c9)._m0[int(_1881)][_1883];
    float _1887 = fma(_1751, _1787, _1863);
    bool _1889 = uint(_1865) > 1u;
    float _1891 = _1701 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _1893 = _1853 ? 0 : 1;
    float _1895 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _1897 = uint(_1857) >= uint(_1314);
    float _1899 = _1891 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1901 = _1865 != 3;
    float _1903 = _1819 + (-0.5);
    int _1905 = ~_1893;
    int _1907 = _1905 + 1;
    int _1909 = _1907 + 1;
    float _1911 = -_1861;
    float _1913 = _1911 + 0.5;
    bool _1915 = !_1897;
    int _1917 = _1915 ? 0 : (-1);
    float _1919 = _1741 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1921 = _1749 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _1923 = _1909;
    if (!_1889)
    {
        int _1925 = ~_1893;
        int _1927 = _1925 + 1;
        _1923 = _1927;
    }
    int _1929 = _1923;
    float _1931 = -_1903;
    float _1933 = -_1665;
    float _1935 = fma(_1931, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1933);
    float _1937 = _1919 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1939 = _1921 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1941 = uint(_1865) >= 2u;
    float _1943 = fma(_1721, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1887);
    bool _1945 = !_1867;
    int _1947 = _1945 ? 0 : 1;
    int _1949 = abs(_1929);
    out.m_56.x = _1937;
    out.m_56.y = _1939;
    out.m_56.z = _1899;
    out.m_56.w = _1895;
    int _1951 = _1941 ? 0 : 1;
    float _1953 = _1943 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _1955 = _1865 != 3;
    int _1957 = abs(_1947);
    int _1959 = ~_1823;
    int _1961 = _1959 + _1917;
    int _1963 = _1961 + 1;
    int _1965 = ~_1951;
    int _1967 = _1965 + 1;
    int _1969 = _1967 + 1;
    int _1971 = _1969;
    if (_1901)
    {
        int _1973 = ~_1951;
        int _1975 = _1973 + 1;
        _1971 = _1975;
    }
    int _1977 = _1971;
    int _1979 = _1314 * _1963;
    int _1981 = _1979 + _1487;
    float _1983 = _1167 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1985 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1987 = !_1955;
    int _1989 = _1987 ? 0 : (-1);
    int _1991 = ~_1949;
    int _1993 = _1991 + 1;
    int _1995 = _1993 + 1;
    int _1997 = abs(_1989);
    float _1999 = exp2(_1983);
    int _2001 = abs(_1977);
    int _2003 = _1995 * as_type<int>(_1843);
    int _2005 = ~_1957;
    int _2007 = _2005 + 1;
    int _2009 = _2007 + 1;
    float _2011 = fma(_1175, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1310);
    int _2013 = ~_2001;
    int _2015 = _2013 + 1;
    int _2017 = _2015 + 1;
    int _2019 = _2009 * as_type<int>(_1835);
    int _2021 = _2019 + _2003;
    float _2023 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2025 = ~_1997;
    int _2027 = _2025 + 1;
    int _2029 = _2027 + 1;
    float _2031 = _1807 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _2033 = _2017 * as_type<int>(_1877);
    int _2035 = _2033 + _2021;
    float _2037 = _1913 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2039 = _2031 * _1985;
    int _2041 = _2029 * as_type<int>(_1885);
    int _2043 = _2041 + _2035;
    bool _2045 = !_1529;
    int _2047 = _2045 ? 0 : 1;
    float _2049 = -_1709;
    float _2051 = _2049 + 1.0;
    float _2053 = -_1729;
    float _2055 = _2053 + 1.0;
    float _2057 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _2059 = abs(_2047);
    float _2061 = -_2051;
    float _2063 = fma(_1621, _2061, _1635);
    float _2065 = fma(_1819, _2055, _1935);
    float _2067 = _2057 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2069 = ~_2059;
    int _2071 = _2069 + 1;
    int _2073 = _2071 + 1;
    float _2075 = _2037 * _2023;
    bool _2077 = !_1425;
    int _2079 = _2077 ? _1981 : (-1);
    float _2081 = -_1999;
    float _2083 = _2081 + 1.0;
    int _2085 = _2043 * _2073;
    out.m_58.x = _2063;
    out.m_58.y = _2065;
    out.m_58.z = _2039;
    out.m_58.w = _2075;
    float _2087 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2011);
    int _2089 = _2079 * _2059;
    int _2091 = _2089 + _2085;
    float _2093 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2095 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2097 = _2087 + _1221;
    float _2099 = float(_2091);
    out.gl_Position.x = _1241;
    out.gl_Position.y = _1253;
    out.gl_Position.z = _2087;
    out.gl_Position.w = _1221;
    float _2101 = _2093 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2103 = _2095 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_60.x = _2099;
    float _2105 = _2083 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2107 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2109 = _2097 * 0.5;
    out.m_62.x = _2067;
    out.m_62.y = _2101;
    out.m_62.z = _2103;
    out.m_62.w = _1953;
    float _2111 = _2105 * _1279;
    float _2113 = -_2105;
    float _2115 = _2113 + 1.0;
    out.m_64.z = _2109;
    out.m_64.w = _1221;
    float _2117 = _1290 * _2111;
    float _2119 = _1300 * _2111;
    float _2121 = _1290 * _2115;
    float _2123 = fma(_1296, _2117, _1284);
    float _2125 = fma(_1298, _2117, _1286);
    float _2127 = fma(_1290, _2119, _1288);
    out.m_45.x = _2107;
    out.m_66.x = _2123;
    out.m_66.y = _2125;
    out.m_66.z = _2127;
    out.m_66.w = _2121;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _613 = false;
    bool _459 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _80 = in.m_42.w;
    float _82 = trunc(_80);
    int _85 = int(_82);
    bool _89 = _85 >= 1;
    float _91 = 0.0;
    float _93 = 0.0;
    float _95 = 0.0;
    if (!_89)
    {
        _91 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _97 = _91;
    float _99 = _97;
    if (!_89)
    {
        out.m_45.x = 0.0;
    }
    int _101 = 0;
    if (!_89)
    {
        float _103 = _97 * 5.0;
        _101 = as_type<int>(_103);
    }
    int _105 = _101;
    if (!_89)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2183 = as_type<float>(_105);
        out.gl_Position.z = _2183;
    }
    if (!_89)
    {
        return out;
    }
    float _107 = in.m_47.w;
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
        float _127 = float(_85);
        _123 = _127;
    }
    float _129 = _123;
    bool _131 = _121 >= _129;
    bool _133 = !_117;
    bool _135 = _131 || _133;
    if (_135)
    {
        _99 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _137 = _99;
    if (_135)
    {
        out.m_45.x = 0.0;
    }
    int _139 = 0;
    if (_135)
    {
        float _141 = _137 * 5.0;
        _139 = as_type<int>(_141);
    }
    int _143 = _139;
    if (_135)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2251 = as_type<float>(_143);
        out.gl_Position.z = _2251;
    }
    if (_135)
    {
        return out;
    }
    float _145 = in.m_47.x;
    float _147 = in.m_47.y;
    float _149 = in.m_47.z;
    float _151 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _153 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _155 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _157 = _153 || _155;
    bool _159 = isnan(1.0);
    bool _161 = _157 || _159;
    float _163 = _151;
    if (!_161)
    {
        float _165 = _151 * _151;
        float _167 = _165 * 0.5;
        _125 = _167;
    }
    float _169 = _125;
    float _171 = 0.0;
    float _173 = _169;
    if (!_161)
    {
        float _175 = _121 * _121;
        float _177 = _175 * 0.5;
        _171 = _177;
    }
    float _179 = _171;
    if (!_161)
    {
        float _181 = _169 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _173 = _181;
    }
    float _183 = _173;
    bool _185 = !_161;
    float _187 = _183;
    if (!_185)
    {
        float _189 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _191 = log2(_189);
        float _193 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _195 = _193 + 1.0;
        float _197 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _199 = _151 * _191;
        float _201 = 1.0 / _195;
        float _203 = _197 * 0.693147182464599609375;
        float _205 = exp2(_199);
        float _207 = 1.0 / _203;
        float _209 = _205 + (-1.0);
        float _211 = -_209;
        float _213 = fma(_211, _207, _151);
        float _215 = _213 * _201;
        float _217 = _215 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _93 = _207;
        _187 = _217;
        _95 = _205;
    }
    float _219 = _93;
    float _221 = _187;
    float _223 = _95;
    bool _225 = !_161;
    float _227 = _219;
    float _229 = _223;
    if (!_225)
    {
        float _231 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _233 = log2(_231);
        float _235 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _237 = _235 + 1.0;
        float _239 = 1.0 / _237;
        float _241 = _151 * _233;
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
    if (!_161)
    {
        _257 = _121;
    }
    float _261 = _257;
    float _263 = _221 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _265 = _261;
    if (!_161)
    {
        float _267 = _179 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _259 = _267;
    }
    float _269 = _259;
    bool _271 = !_161;
    float _273 = _269;
    if (!_271)
    {
        float _275 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _277 = log2(_275);
        float _279 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _281 = _279 + 1.0;
        float _283 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _285 = _121 * _277;
        float _287 = 1.0 / _281;
        float _289 = _283 * 0.693147182464599609375;
        float _291 = exp2(_285);
        float _293 = 1.0 / _289;
        float _295 = _291 + (-1.0);
        float _297 = -_295;
        float _299 = fma(_297, _293, _121);
        float _301 = _299 * _287;
        float _303 = _301 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _273 = _303;
    }
    float _305 = _273;
    bool _307 = !_161;
    if (!_307)
    {
        float _309 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _311 = log2(_309);
        float _313 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _315 = _313 + 1.0;
        float _317 = 1.0 / _315;
        float _319 = _121 * _311;
        float _321 = exp2(_319);
        float _323 = -_321;
        float _325 = _323 + 1.0;
        float _327 = _325 * _317;
        _265 = _327;
    }
    float _329 = _265;
    float _331 = _305 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _333 = fma(_255, _147, _263);
    float _335 = _221 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _337 = _305 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _339 = fma(_329, _147, _331);
    float _341 = _221 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _343 = _305 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _345 = fma(_255, _145, _335);
    float _347 = fma(_329, _145, _337);
    float _349 = -_339;
    float _351 = _333 + _349;
    float _353 = fma(_255, _149, _341);
    float _355 = fma(_329, _149, _343);
    float _357 = -_347;
    float _359 = _345 + _357;
    float _361 = _351 * _351;
    float _363 = in.m_49.w;
    float _365 = -_355;
    float _367 = _353 + _365;
    float _369 = _351 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _371 = fma(_359, _359, _361);
    float _373 = _351 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _375 = in.m_42.x;
    float _377 = in.m_42.y;
    float _379 = in.m_42.z;
    float _381 = _351 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _383 = fma(_367, _367, _371);
    float _385 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[4].x, _369);
    float _387 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[5].x, _373);
    float _389 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[6].x, _381);
    float _391 = fma(_367, (*spvDescriptorSet0.vp_c10)._m0[4].z, _385);
    float _393 = sqrt(_383);
    float _395 = fma(_367, (*spvDescriptorSet0.vp_c10)._m0[5].z, _387);
    bool _397 = _393 >= 9.9999999747524270787835121154785e-07;
    bool _399 = isnan(_393);
    bool _401 = _397 || _399;
    bool _403 = isnan(9.9999999747524270787835121154785e-07);
    bool _405 = _401 || _403;
    float _407 = fma(_367, (*spvDescriptorSet0.vp_c10)._m0[6].z, _389);
    float _409 = fma(_345, _363, _375);
    float _411 = fma(_333, _363, _377);
    float _413 = fma(_353, _363, _379);
    float _415 = _395;
    float _417 = _391;
    float _419 = _407;
    if (!_405)
    {
        bool _421 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _423 = !_421;
        if (!_423)
        {
            float _425 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _427 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _429 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _431 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _425);
            float _433 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _427);
            float _435 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _429);
            float _437 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _431);
            float _439 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _433);
            float _441 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _435);
            float _443 = _437 * _437;
            float _445 = fma(_439, _439, _443);
            float _447 = fma(_441, _441, _445);
            float _449 = rsqrt(_447);
            float _451 = _449 * 9.9999999747524270787835121154785e-07;
            float _453 = _439 * _451;
            float _455 = _437 * _451;
            float _457 = _441 * _451;
            _415 = _455;
            _417 = _453;
            _419 = _457;
            _459 = true;
        }
        else
        {
            float _461 = _147 * _147;
            float _463 = fma(_145, _145, _461);
            float _465 = fma(_149, _149, _463);
            float _467 = sqrt(_465);
            bool _469 = _467 >= 9.9999999747524270787835121154785e-07;
            bool _471 = isnan(_467);
            bool _473 = _469 || _471;
            bool _475 = isnan(9.9999999747524270787835121154785e-07);
            bool _477 = _473 || _475;
            if (!_477)
            {
                float _479 = _377 * _377;
                float _481 = fma(_375, _375, _479);
                float _483 = fma(_379, _379, _481);
                float _485 = sqrt(_483);
                bool _487 = _485 >= 9.9999999747524270787835121154785e-07;
                bool _489 = isnan(_485);
                bool _491 = _487 || _489;
                bool _493 = isnan(9.9999999747524270787835121154785e-07);
                bool _495 = _491 || _493;
                if (!_495)
                {
                    float _497 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _499 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _497);
                    float _501 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _499);
                    float _503 = rsqrt(_501);
                    float _505 = _503 * 9.9999999747524270787835121154785e-07;
                    float _507 = _505 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _509 = _505 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _511 = _505 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _415 = _509;
                    _417 = _507;
                    _419 = _511;
                    _459 = true;
                }
                else
                {
                    float _513 = _377 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _515 = _377 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _517 = _377 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _519 = fma(_375, (*spvDescriptorSet0.vp_c10)._m0[5].x, _513);
                    float _521 = fma(_375, (*spvDescriptorSet0.vp_c10)._m0[4].x, _515);
                    float _523 = fma(_375, (*spvDescriptorSet0.vp_c10)._m0[6].x, _517);
                    float _525 = fma(_379, (*spvDescriptorSet0.vp_c10)._m0[5].z, _519);
                    float _527 = fma(_379, (*spvDescriptorSet0.vp_c10)._m0[4].z, _521);
                    float _529 = fma(_379, (*spvDescriptorSet0.vp_c10)._m0[6].z, _523);
                    float _531 = _525 * _525;
                    float _533 = fma(_527, _527, _531);
                    float _535 = fma(_529, _529, _533);
                    float _537 = rsqrt(_535);
                    float _539 = _537 * 9.9999999747524270787835121154785e-07;
                    float _541 = _527 * _539;
                    float _543 = _525 * _539;
                    float _545 = _529 * _539;
                    _415 = _543;
                    _417 = _541;
                    _419 = _545;
                    _459 = true;
                }
            }
            else
            {
                float _547 = _147 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _549 = _147 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _551 = _147 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _553 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[5].x, _547);
                float _555 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[4].x, _549);
                float _557 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[6].x, _551);
                float _559 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[5].z, _553);
                float _561 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[4].z, _555);
                float _563 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[6].z, _557);
                float _565 = _559 * _559;
                float _567 = fma(_561, _561, _565);
                float _569 = fma(_563, _563, _567);
                float _571 = rsqrt(_569);
                float _573 = _571 * 9.9999999747524270787835121154785e-07;
                float _575 = _561 * _573;
                float _577 = _559 * _573;
                float _579 = _563 * _573;
                _415 = _577;
                _417 = _575;
                _419 = _579;
            }
        }
    }
    _459 = false;
    float _581 = _415;
    float _583 = _417;
    float _585 = _419;
    bool _587 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    bool _589 = !_587;
    float _609;
    float _611;
    if (!_589)
    {
        float _591 = in.m_51.x;
        float _593 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _595 = float(_85);
        float _597 = _591 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _599 = fma(_597, (*spvDescriptorSet0.vp_c9)._m0[11].y, _121);
        float _601 = _599 * _593;
        float _603 = floor(_601);
        float _605 = -_603;
        float _607 = _601 + _605;
        _609 = _595;
        _611 = _607;
        _613 = true;
    }
    else
    {
        float _615 = float(_85);
        float _617 = 1.0 / _615;
        float _619 = _121 * _617;
        _609 = _615;
        _611 = _619;
    }
    _613 = false;
    float _621 = _609;
    float _623 = _611;
    float _625 = _411 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _627 = _411 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _629 = fma(_409, (*spvDescriptorSet0.vp_c10)._m0[5].x, _625);
    float _631 = _411 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _633 = fma(_409, (*spvDescriptorSet0.vp_c10)._m0[4].x, _627);
    float _635 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[5].z, _629);
    float _637 = fma(_409, (*spvDescriptorSet0.vp_c10)._m0[6].x, _631);
    float _639 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[4].z, _633);
    float _641 = _635 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _643 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[6].z, _637);
    float _645 = _639 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _647 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _649 = _641 + _647;
    float _651 = _643 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _653 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _655 = _645 + _653;
    float _657 = _649 * _649;
    float _659 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _661 = _651 + _659;
    float _663 = fma(_655, _655, _657);
    float _665 = fma(_661, _661, _663);
    float _667 = _581 * _581;
    float _669 = rsqrt(_665);
    float _671 = fma(_583, _583, _667);
    float _673 = fma(_585, _585, _671);
    float _675 = rsqrt(_673);
    float _677 = _649 * _669;
    float _679 = _655 * _669;
    float _681 = _661 * _669;
    float _683 = -_677;
    float _685 = fma(_683, (*spvDescriptorSet0.vp_c9)._m0[18].w, _649);
    float _687 = -_679;
    float _689 = fma(_687, (*spvDescriptorSet0.vp_c9)._m0[18].w, _655);
    float _691 = -_681;
    float _693 = fma(_691, (*spvDescriptorSet0.vp_c9)._m0[18].w, _661);
    float _695 = _685 * _685;
    float _697 = _675 * _585;
    float _699 = _675 * _581;
    float _701 = fma(_689, _689, _695);
    float _703 = _675 * _583;
    float _705 = as_type<float>(int(gl_VertexIndex));
    float _707 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _709 = _697 * _707;
    float _711 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _713 = _699 * _711;
    float _715 = fma(_693, _693, _701);
    float _717 = in.m_49.x;
    float _719 = in.m_49.y;
    float _721 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _723 = -_709;
    float _725 = fma(_703, _721, _723);
    float _727 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _729 = -_713;
    float _731 = fma(_697, _727, _729);
    float _733 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _735 = _703 * _733;
    float _737 = _725 * _725;
    float _739 = sqrt(_715);
    float _741 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _743 = -_735;
    float _745 = fma(_699, _741, _743);
    float _747 = fma(_731, _731, _737);
    float _749 = fma(_745, _745, _747);
    float _751 = rsqrt(_749);
    int _753 = as_type<int>(_705) & 1;
    bool _755 = _753 != 0;
    int _757 = as_type<int>(_705) & 2;
    bool _759 = _757 != 0;
    float _761 = _669 * _739;
    float _763 = _719 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _765 = _717 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    bool _767 = !_759;
    float _769 = _767 ? (-0.5) : 0.5;
    float _771 = _763 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _773 = !_755;
    float _775 = _773 ? (-0.5) : 0.5;
    float _777 = _765 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _779 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _769);
    float _781 = _771 * _761;
    float _783 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _775);
    float _785 = _777 * _761;
    float _787 = _725 * _751;
    float _789 = _781 * _779;
    float _791 = _731 * _751;
    float _793 = _745 * _751;
    float _795 = _785 * _783;
    float _797 = _703 * _787;
    float _799 = _789 * _697;
    float _801 = _699 * _793;
    float _803 = _761 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _805 = _803 * 0.5;
    float _807 = -_797;
    float _809 = fma(_699, _791, _807);
    float _811 = _789 * _703;
    float _813 = fma(_795, _793, _799);
    float _815 = -_801;
    float _817 = fma(_697, _787, _815);
    float _819 = _697 * _791;
    float _821 = fma(_795, _791, _811);
    float _823 = fma(_805, _809, _813);
    float _825 = _789 * _699;
    float _827 = -_819;
    float _829 = fma(_703, _793, _827);
    float _831 = fma(_805, _817, _821);
    float _833 = _651 + _823;
    float _835 = fma(_795, _787, _825);
    float _837 = _645 + _831;
    float _839 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _841 = _833 + _839;
    float _843 = fma(_805, _829, _835);
    float _845 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _847 = _837 + _845;
    float _849 = _841 * _841;
    float _851 = _641 + _843;
    float _853 = fma(_847, _847, _849);
    float _855 = sqrt(_853);
    bool _857 = _855 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _859 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _861 = _859 != 0;
    int _863 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _865 = _863 != 0;
    int _867 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _869 = _867 != 0;
    bool _871 = !_865;
    int _873 = _871 ? 0 : 1;
    bool _875 = !_861;
    int _877 = _875 ? 0 : 1;
    bool _879 = !_869;
    int _881 = _879 ? 0 : 1;
    float _883 = _829;
    float _885 = _641;
    float _887 = _849;
    float _889 = _855;
    float _891 = _847;
    float _893 = _789;
    if (!_857)
    {
        _883 = _837;
    }
    float _895 = _883;
    float _897 = _895;
    if (!_857)
    {
        _885 = _833;
    }
    float _899 = _885;
    float _901 = _899;
    if (!_857)
    {
        _887 = _851;
    }
    float _903 = _887;
    bool _905 = !_857;
    float _907 = _903;
    if (!_905)
    {
        float _909 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _911 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _913 = _855 + _911;
        float _915 = _851 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _917 = rsqrt(_853);
        float _919 = _913 * _909;
        float _921 = _919 * 0.15915493667125701904296875;
        float _923 = _921 * 6.283185482025146484375;
        float _925 = cos(_923);
        float _927 = _921 * 6.283185482025146484375;
        float _929 = sin(_927);
        float _931 = _925 + (-1.0);
        float _933 = _931 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _935 = fma(_929, _915, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _937 = fma(_851, _925, _933);
        float _939 = _917 * _935;
        float _941 = fma(_847, _939, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _943 = fma(_841, _939, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _907 = _937;
        _897 = _941;
        _901 = _943;
        _889 = _921;
    }
    float _945 = _907;
    float _947 = _897;
    float _949 = _901;
    float _951 = _889;
    float _953 = -_677;
    float _955 = fma(_953, (*spvDescriptorSet0.vp_c9)._m0[18].w, _945);
    float _957 = -_679;
    float _959 = fma(_957, (*spvDescriptorSet0.vp_c9)._m0[18].w, _947);
    float _961 = -_681;
    float _963 = fma(_961, (*spvDescriptorSet0.vp_c9)._m0[18].w, _949);
    float _965 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _967 = _955 + _965;
    float _969 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _971 = _959 + _969;
    float _973 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _975 = _963 + _973;
    float _977 = _967 * _967;
    float _979 = fma(_971, _971, _977);
    float _981 = fma(_975, _975, _979);
    float _983 = rsqrt(_981);
    float _985 = _983 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _987 = _971 * _985;
    float _989 = _975 * _985;
    float _991 = _987 * _987;
    float _993 = _989 * _989;
    float _995 = _991 + _993;
    float _997 = sqrt(_995);
    bool _999 = _997 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1001 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1003 = _997 + _1001;
    float _1005 = _983;
    float _1007 = _995;
    float _1009 = _1003;
    float _1011 = _951;
    float _1013 = _967;
    if (_999)
    {
        float _1015 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1005 = _1015;
    }
    float _1017 = _1005;
    if (_999)
    {
        float _1019 = rsqrt(_995);
        _1007 = _1019;
    }
    float _1021 = _1007;
    float _1023 = _1021;
    if (_999)
    {
        float _1025 = _1003 * _1017;
        _1009 = _1025;
    }
    float _1027 = _1009;
    if (_999)
    {
        float _1029 = _1027 * 0.15915493667125701904296875;
        _1011 = _1029;
    }
    float _1031 = _1011;
    float _1033 = _975;
    if (_999)
    {
        float _1035 = _1031 * 6.283185482025146484375;
        float _1037 = sin(_1035);
        _1033 = _1037;
    }
    float _1039 = _1033;
    float _1041 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1043 = precise::max(0.0, _1041);
    float _1045 = _1017;
    float _1047 = _1043;
    if (_999)
    {
        float _1049 = _1031 * 6.283185482025146484375;
        float _1051 = cos(_1049);
        _1045 = _1051;
    }
    float _1053 = _1045;
    float _1055 = -_985;
    float _1057 = -_1043;
    float _1059 = fma(_967, _1055, _1057);
    if (_999)
    {
        float _1061 = _1059 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1013 = _1061;
    }
    float _1063 = _1013;
    float _1065 = sqrt(_981);
    float _1067 = _1063;
    float _1069 = _1039;
    if (_999)
    {
        float _1071 = fma(_1039, _1063, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1067 = _1071;
    }
    float _1073 = _1067;
    float _1075 = _1073;
    if (!_999)
    {
        _1069 = _987;
    }
    float _1077 = _1069;
    float _1079 = _1077;
    float _1081 = _1053;
    if (_999)
    {
        float _1083 = _1053 + (-1.0);
        _1047 = _1083;
    }
    float _1085 = _1047;
    float _1087 = _1085;
    if (_999)
    {
        float _1089 = _1021 * _1073;
        _891 = _1089;
    }
    float _1091 = _891;
    if (!_999)
    {
        _1075 = _1059;
    }
    float _1093 = _1075;
    float _1095 = _1093;
    if (_999)
    {
        float _1097 = _1085 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _893 = _1097;
    }
    float _1099 = _893;
    if (_999)
    {
        float _1101 = _987 * _1091;
        _1079 = _1101;
    }
    float _1103 = _1079;
    if (!_999)
    {
        _1087 = _989;
    }
    float _1105 = _1087;
    float _1107 = _1105;
    if (_999)
    {
        float _1109 = _989 * _1091;
        _1107 = _1109;
    }
    float _1111 = _1107;
    if (!_999)
    {
        _1023 = _991;
    }
    float _1113 = _1023;
    float _1115 = _1113;
    if (_999)
    {
        float _1117 = fma(_1059, _1053, _1099);
        _1095 = _1117;
    }
    float _1119 = _1095;
    if (_999)
    {
        float _1121 = _1103 * _1103;
        _1115 = _1121;
    }
    float _1123 = _1115;
    if (!_999)
    {
        _1081 = _993;
    }
    float _1125 = _1081;
    float _1127 = _1125;
    if (_999)
    {
        float _1129 = _1111 * _1111;
        _1127 = _1129;
    }
    float _1131 = _1127;
    float _1133 = fma(_1119, _1119, _1123);
    float _1135 = _1133 + _1131;
    float _1137 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1139 = fma(_1065, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1137);
    float _1141 = precise::clamp(_1139, 0.0, 1.0);
    float _1143 = _955 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1145 = _955 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1147 = rsqrt(_1135);
    float _1149 = -_1141;
    float _1151 = _1149 + 1.0;
    float _1153 = fma(_959, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1143);
    float _1155 = fma(_959, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1145);
    float _1157 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1159 = fma(_963, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1153);
    float _1161 = _955 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1163 = fma(_963, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1155);
    float _1165 = abs(_1151);
    float _1167 = log2(_1165);
    float _1169 = _955 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1171 = fma(_959, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1161);
    float _1173 = _1163 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1175 = _1159 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1177 = fma(_959, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1169);
    float _1179 = fma(_963, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1171);
    float _1181 = _1147 * _1103;
    float _1183 = _1147 * _1111;
    float _1185 = _1147 * _1119;
    float _1187 = _1179 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1189 = _1181 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1191 = _1173 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1193 = fma(_963, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1177);
    float _1195 = _1175 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1197 = -_1189;
    float _1199 = fma(_1185, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1197);
    float _1201 = fma(_1187, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1191);
    float _1203 = _1193 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1205 = -_1195;
    float _1207 = fma(_1205, _1157, 1.0);
    float _1209 = -_1183;
    float _1211 = fma(_1209, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1199);
    float _1213 = fma(_1175, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1201);
    float _1215 = _1167 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1217 = _1173 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1219 = fma(_1211, -0.5, 0.5);
    float _1221 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1213);
    float _1223 = log2(_1207);
    float _1225 = _1173 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1227 = fma(_1187, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1217);
    float _1229 = fma(_1211, 0.5, 0.5);
    float _1231 = _1185 + 1.0;
    float _1233 = fma(_1187, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1225);
    float _1235 = fma(_1175, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1227);
    float _1237 = fma(_1229, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1239 = exp2(_1215);
    float _1241 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1235);
    float _1243 = fma(_1229, _1237, -0.212114393711090087890625);
    float _1245 = fma(_1229, _1243, 1.570728778839111328125);
    float _1247 = 1.0 / _1221;
    float _1249 = fma(_1175, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1233);
    float _1251 = _1223 * 0.693147182464599609375;
    float _1253 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1249);
    float _1255 = _1251 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1257 = sqrt(_1219);
    float _1259 = -_1185;
    float _1261 = fma(_1239, _1231, _1259);
    float _1263 = fma(_1261, 0.5, 0.5);
    float _1265 = _1241 * _1247;
    float _1267 = _1253 * _1247;
    float _1269 = fma(_1265, 0.5, 0.5);
    float _1271 = fma(_1267, -0.5, 0.5);
    float _1273 = _1257 * 0.636619746685028076171875;
    float _1275 = -_1245;
    float _1277 = fma(_1273, _1275, 1.0);
    float3 _4105 = float3(_1269, _1271, _1255);
    float _1279 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4105, float3(0.0), isnan(_4105)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4105, float3(0.0), isnan(_4105)), level(0.0)).x;
    float3 _4116 = float3(_1269, _1271, _1255);
    float4 _1282 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4116, float3(0.0), isnan(_4116)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4116, float3(0.0), isnan(_4116)), level(0.0)).xyzw;
    float _1284 = _1282.x;
    float _1286 = _1282.y;
    float _1288 = _1282.z;
    float _1290 = _1282.w;
    float2 _4133 = float2(_1277, _1263);
    float3 _1294 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4133, float2(0.0), isnan(_4133)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4133, float2(0.0), isnan(_4133)), level(0.0)).xyz;
    float _1296 = _1294.x;
    float _1298 = _1294.y;
    float _1300 = _1294.z;
    float _1302 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1304 = int(_1302);
    int _1306 = abs(_877);
    float _1308 = _1173 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1310 = fma(_1187, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1308);
    float _1312 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1314 = int(_1312);
    float _1316 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1318 = float(_1304);
    float _1320 = 1.0 / _621;
    float _1322 = float(uint(_1314));
    float _1324 = 1.0 / _1318;
    int _1326 = ~_1314;
    int _1328 = _1326 + 1;
    int _1330 = ~_1314;
    int _1332 = _1330 + 1;
    int _1334 = _1314 + (-1);
    int _1336 = ~_1314;
    int _1338 = _1336 + 1;
    float _1340 = 1.0 / _1322;
    float _1342 = _121 * _1324;
    float _1344 = in.m_51.x;
    float _1346 = trunc(_1342);
    int _1348 = int(_1346);
    int _1350 = as_type<int>(_1340) + (-2);
    float _1352 = float(uint(_1348));
    float _1354 = as_type<float>(_1350) * _1352;
    float _1356 = trunc(_1354);
    float _1358 = precise::max(_1356, 0.0);
    uint _1361 = uint(_1358);
    int _1363 = _1328 * int(_1361);
    int _1365 = _1363 + _1348;
    float _1367 = float(uint(_1365));
    float _1369 = as_type<float>(_1350) * _1367;
    int _1371 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1373 = _1371 != 0;
    float _1375 = trunc(_1369);
    float _1377 = precise::max(_1375, 0.0);
    uint _1379 = uint(_1377);
    bool _1381 = !_1373;
    float _1383 = _1381 ? 7.345489978790283203125 : 1.0;
    float _1385 = _1383 * _1344;
    float _1387 = floor(_1385);
    int _1389 = int(_1361) + int(_1379);
    float _1391 = float(_1314);
    float _1393 = float(_1348);
    int _1395 = _1332 * _1389;
    int _1397 = _1395 + _1348;
    bool _1399 = _1393 >= _1391;
    bool _1401 = isnan(_1393);
    bool _1403 = _1399 || _1401;
    bool _1405 = isnan(_1391);
    bool _1407 = _1403 || _1405;
    float _1409 = float(_1407);
    bool _1411 = uint(_1397) >= uint(_1314);
    float _1413 = -_1387;
    float _1415 = _1385 + _1413;
    float _1417 = trunc(_1409);
    int _1419 = int(_1417);
    bool _1421 = !_1411;
    int _1423 = _1421 ? 0 : (-1);
    bool _1425 = _1314 == 0;
    int _1427 = ~_1389;
    int _1429 = _1427 + _1423;
    int _1431 = _1429 + 1;
    float _1433 = _1415 * _1391;
    float _1435 = _121 * _1391;
    int _1437 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1439 = _1437 != 0;
    int _1441 = _1314 * _1431;
    int _1443 = _1441 + _1348;
    float _1445 = _1435 * _1320;
    float _1447 = trunc(_1433);
    int _1449 = int(_1447);
    bool _1451 = !_1439;
    int _1453 = _1451 ? 0 : 1;
    bool _1455 = !_1425;
    int _1457 = _1455 ? _1443 : (-1);
    int _1459 = ~_1419;
    int _1461 = _1459 + 1;
    int _1463 = _1461 + 1;
    int _1465 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1467 = _1465 != 0;
    float _1469 = trunc(_1445);
    int _1471 = int(_1469);
    int _1473 = abs(_873);
    int _1475 = _1457 * _1463;
    int _1477 = abs(_1453);
    int _1479 = abs(_881);
    int _1481 = _1419 * _1334;
    int _1483 = _1481 + _1475;
    int _1485 = _1449 * _1477;
    int _1487 = _1485 + _1348;
    bool _1489 = !_1467;
    int _1491 = _1489 ? 0 : 1;
    int _1493 = ~_1314;
    int _1495 = _1493 + 1;
    int _1497 = _1483 * _1473;
    int _1499 = abs(_1491);
    float _1501 = in.m_51.w;
    int _1503 = _1471 * _1306;
    int _1505 = _1503 + _1497;
    float _1507 = _1344 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1509 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1511 = _1509 != 0;
    int _1513 = _1487 * _1479;
    int _1515 = _1513 + _1505;
    float _1517 = -_1316;
    float _1519 = fma(_1507, 2.0, _1517);
    float _1521 = float(uint(_1487));
    int _1523 = _1449 * _1499;
    int _1525 = _1523 + _1515;
    int _1527 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1529 = _1527 != 0;
    float _1531 = in.m_51.y;
    int _1533 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1535 = _1533 != 0;
    float _1537 = -_121;
    float _1539 = fma(_1537, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1519);
    float _1541 = float(uint(_1525));
    int _1543 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1545 = _1543 != 0;
    int _1547 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1549 = _1547 != 0;
    float _1551 = as_type<float>(_1350) * _1541;
    int _1553 = ~_1314;
    int _1555 = _1553 + 1;
    float _1557 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _1559 = trunc(_1551);
    float _1561 = precise::max(_1559, 0.0);
    uint _1563 = uint(_1561);
    float _1565 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1567 = _1565 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1569 = _1557 * _1344;
    float _1571 = 1.0 / _1567;
    int _1573 = _1555 * int(_1563);
    int _1575 = _1573 + _1525;
    float _1577 = _1531 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1579 = trunc(_1569);
    int _1581 = int(_1579);
    float _1583 = float(uint(_1575));
    float _1585 = as_type<float>(_1350) * _1583;
    float _1587 = trunc(_1585);
    float _1589 = precise::max(_1587, 0.0);
    uint _1591 = uint(_1589);
    int _1593 = int(_1563) + int(_1591);
    float _1595 = in.m_51.z;
    int _1597 = _1495 * _1593;
    int _1599 = _1597 + _1525;
    float _1601 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1603 = _1601 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1605 = uint(_1599) >= uint(_1314);
    float _1607 = 1.0 / _1603;
    bool _1609 = !_1605;
    int _1611 = _1609 ? 0 : (-1);
    bool _1613 = _1344 > 0.5;
    float _1615 = -_775;
    int _1617 = _1613 ? as_type<int>(_1615) : as_type<int>(_775);
    bool _1619 = !_1511;
    float _1621 = _1619 ? _775 : as_type<float>(_1617);
    bool _1623 = _1595 > 0.5;
    float _1625 = _1621 + 0.5;
    bool _1627 = _1501 > 0.5;
    float _1629 = -_775;
    int _1631 = _1623 ? as_type<int>(_1629) : as_type<int>(_775);
    float _1633 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1635 = fma(_1625, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1539);
    bool _1637 = _1531 > 0.5;
    float _1639 = fma(_1344, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1633);
    float _1641 = as_type<float>(_1350) * _1521;
    float _1643 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1645 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1647 = fma(_1577, -2.0, _1643);
    float _1649 = trunc(_1641);
    float _1651 = precise::max(_1649, 0.0);
    uint _1653 = uint(_1651);
    float _1655 = fma(_1531, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1645);
    float _1657 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1659 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1657;
    int _1661 = ~_1314;
    int _1663 = _1661 + 1;
    float _1665 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1647);
    int _1667 = ~_1593;
    int _1669 = _1667 + _1611;
    int _1671 = _1669 + 1;
    float _1673 = _1659 * _1607;
    float _1675 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1677 = _1675 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    int _1679 = _1581 << 4;
    int _1681 = _1679 + 1968;
    int _1683 = _1314 * _1671;
    int _1685 = _1683 + _1525;
    float _1687 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1689 = _623 + _1687;
    float _1691 = _1677 * _1571;
    int _1693 = _1681 + 8;
    uint _1695 = uint(int(uint(_1693) >> uint(2)));
    uint _1697 = uint(int(uint(int(_1695)) >> uint(2)));
    int _1699 = int(_1695) & 3;
    float _1701 = (*spvDescriptorSet0.vp_c9)._m0[int(_1697)][_1699];
    float _1703 = fma(_1673, _1689, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    int _1705 = _1663 * int(_1653);
    int _1707 = _1705 + _1487;
    float _1709 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1639);
    bool _1711 = _623 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1713 = isnan(_623);
    bool _1715 = _1711 || _1713;
    bool _1717 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1719 = _1715 || _1717;
    float _1721 = float(_1719);
    float _1723 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1725 = _623 + _1723;
    float _1727 = float(uint(_1707));
    float _1729 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1655);
    bool _1731 = !_1425;
    int _1733 = _1731 ? _1685 : (-1);
    uint _1735 = uint(int(uint(_1681) >> uint(2)));
    uint _1737 = uint(int(uint(int(_1735)) >> uint(2)));
    int _1739 = int(_1735) & 3;
    float _1741 = (*spvDescriptorSet0.vp_c9)._m0[int(_1737)][_1739];
    int _1743 = int(_1735) + 1;
    uint _1745 = uint(int(uint(_1743) >> uint(2)));
    int _1747 = _1743 & 3;
    float _1749 = (*spvDescriptorSet0.vp_c9)._m0[int(_1745)][_1747];
    float _1751 = fma(_1691, _1725, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1753 = as_type<float>(_1350) * _1727;
    int _1755 = _1733 >> 31;
    bool _1757 = _623 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1759 = isnan(_623);
    bool _1761 = _1757 || _1759;
    bool _1763 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1765 = _1761 || _1763;
    float _1767 = float(_1765);
    int _1769 = _1755 & 3;
    float _1771 = trunc(_1753);
    float _1773 = precise::max(_1771, 0.0);
    uint _1775 = uint(_1773);
    float _1777 = -_1721;
    float _1779 = _1777 + 1.0;
    bool _1781 = !_1545;
    float _1783 = _1781 ? _775 : as_type<float>(_1631);
    int _1785 = _1733 + _1769;
    float _1787 = _1767 * _1779;
    bool _1789 = _623 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1791 = isnan(_623);
    bool _1793 = _1789 || _1791;
    bool _1795 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1797 = _1793 || _1795;
    float _1799 = float(_1797);
    float _1801 = -_1767;
    float _1803 = _1801 + 1.0;
    int _1805 = _1785 >> 2;
    float _1807 = _1783 + 0.5;
    float _1809 = -_769;
    int _1811 = _1637 ? as_type<int>(_1809) : as_type<int>(_769);
    int _1813 = _1805 << 4;
    int _1815 = _1813 + 368;
    bool _1817 = !_1535;
    float _1819 = _1817 ? _769 : as_type<float>(_1811);
    float _1821 = _1799 * _1803;
    int _1823 = int(_1653) + int(_1775);
    float _1825 = -_1799;
    float _1827 = _1825 + 1.0;
    uint _1829 = uint(int(uint(_1815) >> uint(2)));
    uint _1831 = uint(int(uint(int(_1829)) >> uint(2)));
    int _1833 = int(_1829) & 3;
    float _1835 = (*spvDescriptorSet0.vp_c9)._m0[int(_1831)][_1833];
    int _1837 = int(_1829) + 1;
    uint _1839 = uint(int(uint(_1837) >> uint(2)));
    int _1841 = _1837 & 3;
    float _1843 = (*spvDescriptorSet0.vp_c9)._m0[int(_1839)][_1841];
    float _1845 = -_769;
    int _1847 = _1627 ? as_type<int>(_1845) : as_type<int>(_769);
    float _1849 = _1703 * _1821;
    int _1851 = _1733 & 3;
    bool _1853 = _1851 != 0;
    int _1855 = _1338 * _1823;
    int _1857 = _1855 + _1487;
    bool _1859 = !_1549;
    float _1861 = _1859 ? _769 : as_type<float>(_1847);
    float _1863 = fma(_1827, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1849);
    int _1865 = _1733 & 3;
    bool _1867 = _1865 != 0;
    int _1869 = _1815 + 8;
    uint _1871 = uint(int(uint(_1869) >> uint(2)));
    uint _1873 = uint(int(uint(int(_1871)) >> uint(2)));
    int _1875 = int(_1871) & 3;
    float _1877 = (*spvDescriptorSet0.vp_c9)._m0[int(_1873)][_1875];
    int _1879 = int(_1871) + 1;
    uint _1881 = uint(int(uint(_1879) >> uint(2)));
    int _1883 = _1879 & 3;
    float _1885 = (*spvDescriptorSet0.vp_c9)._m0[int(_1881)][_1883];
    float _1887 = fma(_1751, _1787, _1863);
    bool _1889 = uint(_1865) > 1u;
    float _1891 = _1701 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _1893 = _1853 ? 0 : 1;
    float _1895 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _1897 = uint(_1857) >= uint(_1314);
    float _1899 = _1891 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1901 = _1865 != 3;
    float _1903 = _1819 + (-0.5);
    int _1905 = ~_1893;
    int _1907 = _1905 + 1;
    int _1909 = _1907 + 1;
    float _1911 = -_1861;
    float _1913 = _1911 + 0.5;
    bool _1915 = !_1897;
    int _1917 = _1915 ? 0 : (-1);
    float _1919 = _1741 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1921 = _1749 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _1923 = _1909;
    if (!_1889)
    {
        int _1925 = ~_1893;
        int _1927 = _1925 + 1;
        _1923 = _1927;
    }
    int _1929 = _1923;
    float _1931 = -_1903;
    float _1933 = -_1665;
    float _1935 = fma(_1931, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1933);
    float _1937 = _1919 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1939 = _1921 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1941 = uint(_1865) >= 2u;
    float _1943 = fma(_1721, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1887);
    bool _1945 = !_1867;
    int _1947 = _1945 ? 0 : 1;
    int _1949 = abs(_1929);
    out.m_56.x = _1937;
    out.m_56.y = _1939;
    out.m_56.z = _1899;
    out.m_56.w = _1895;
    int _1951 = _1941 ? 0 : 1;
    float _1953 = _1943 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _1955 = _1865 != 3;
    int _1957 = abs(_1947);
    int _1959 = ~_1823;
    int _1961 = _1959 + _1917;
    int _1963 = _1961 + 1;
    int _1965 = ~_1951;
    int _1967 = _1965 + 1;
    int _1969 = _1967 + 1;
    int _1971 = _1969;
    if (_1901)
    {
        int _1973 = ~_1951;
        int _1975 = _1973 + 1;
        _1971 = _1975;
    }
    int _1977 = _1971;
    int _1979 = _1314 * _1963;
    int _1981 = _1979 + _1487;
    float _1983 = _1167 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1985 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1987 = !_1955;
    int _1989 = _1987 ? 0 : (-1);
    int _1991 = ~_1949;
    int _1993 = _1991 + 1;
    int _1995 = _1993 + 1;
    int _1997 = abs(_1989);
    float _1999 = exp2(_1983);
    int _2001 = abs(_1977);
    int _2003 = _1995 * as_type<int>(_1843);
    int _2005 = ~_1957;
    int _2007 = _2005 + 1;
    int _2009 = _2007 + 1;
    float _2011 = fma(_1175, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1310);
    int _2013 = ~_2001;
    int _2015 = _2013 + 1;
    int _2017 = _2015 + 1;
    int _2019 = _2009 * as_type<int>(_1835);
    int _2021 = _2019 + _2003;
    float _2023 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2025 = ~_1997;
    int _2027 = _2025 + 1;
    int _2029 = _2027 + 1;
    float _2031 = _1807 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _2033 = _2017 * as_type<int>(_1877);
    int _2035 = _2033 + _2021;
    float _2037 = _1913 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2039 = _2031 * _1985;
    int _2041 = _2029 * as_type<int>(_1885);
    int _2043 = _2041 + _2035;
    bool _2045 = !_1529;
    int _2047 = _2045 ? 0 : 1;
    float _2049 = -_1709;
    float _2051 = _2049 + 1.0;
    float _2053 = -_1729;
    float _2055 = _2053 + 1.0;
    float _2057 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _2059 = abs(_2047);
    float _2061 = -_2051;
    float _2063 = fma(_1621, _2061, _1635);
    float _2065 = fma(_1819, _2055, _1935);
    float _2067 = _2057 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2069 = ~_2059;
    int _2071 = _2069 + 1;
    int _2073 = _2071 + 1;
    float _2075 = _2037 * _2023;
    bool _2077 = !_1425;
    int _2079 = _2077 ? _1981 : (-1);
    float _2081 = -_1999;
    float _2083 = _2081 + 1.0;
    int _2085 = _2043 * _2073;
    out.m_58.x = _2063;
    out.m_58.y = _2065;
    out.m_58.z = _2039;
    out.m_58.w = _2075;
    float _2087 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2011);
    int _2089 = _2079 * _2059;
    int _2091 = _2089 + _2085;
    float _2093 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2095 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2097 = _2087 + _1221;
    float _2099 = float(_2091);
    out.gl_Position.x = _1241;
    out.gl_Position.y = _1253;
    out.gl_Position.z = _2087;
    out.gl_Position.w = _1221;
    float _2101 = _2093 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2103 = _2095 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_60.x = _2099;
    float _2105 = _2083 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2107 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2109 = _2097 * 0.5;
    out.m_62.x = _2067;
    out.m_62.y = _2101;
    out.m_62.z = _2103;
    out.m_62.w = _1953;
    float _2111 = _2105 * _1279;
    float _2113 = -_2105;
    float _2115 = _2113 + 1.0;
    out.m_64.z = _2109;
    out.m_64.w = _1221;
    float _2117 = _1290 * _2111;
    float _2119 = _1300 * _2111;
    float _2121 = _1290 * _2115;
    float _2123 = fma(_1296, _2117, _1284);
    float _2125 = fma(_1298, _2117, _1286);
    float _2127 = fma(_1290, _2119, _1288);
    out.m_45.x = _2107;
    out.m_66.x = _2123;
    out.m_66.y = _2125;
    out.m_66.z = _2127;
    out.m_66.w = _2121;
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
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _613 = false;
    bool _459 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _80 = in.m_42.w;
    float _82 = trunc(_80);
    int _85 = int(_82);
    bool _89 = _85 >= 1;
    float _91 = 0.0;
    float _93 = 0.0;
    float _95 = 0.0;
    if (!_89)
    {
        _91 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _97 = _91;
    float _99 = _97;
    if (!_89)
    {
        out.m_45.x = 0.0;
    }
    int _101 = 0;
    if (!_89)
    {
        float _103 = _97 * 5.0;
        _101 = as_type<int>(_103);
    }
    int _105 = _101;
    if (!_89)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2183 = as_type<float>(_105);
        out.gl_Position.z = _2183;
    }
    if (!_89)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _107 = in.m_47.w;
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
        float _127 = float(_85);
        _123 = _127;
    }
    float _129 = _123;
    bool _131 = _121 >= _129;
    bool _133 = !_117;
    bool _135 = _131 || _133;
    if (_135)
    {
        _99 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _137 = _99;
    if (_135)
    {
        out.m_45.x = 0.0;
    }
    int _139 = 0;
    if (_135)
    {
        float _141 = _137 * 5.0;
        _139 = as_type<int>(_141);
    }
    int _143 = _139;
    if (_135)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2251 = as_type<float>(_143);
        out.gl_Position.z = _2251;
    }
    if (_135)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _145 = in.m_47.x;
    float _147 = in.m_47.y;
    float _149 = in.m_47.z;
    float _151 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _153 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _155 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _157 = _153 || _155;
    bool _159 = isnan(1.0);
    bool _161 = _157 || _159;
    float _163 = _151;
    if (!_161)
    {
        float _165 = _151 * _151;
        float _167 = _165 * 0.5;
        _125 = _167;
    }
    float _169 = _125;
    float _171 = 0.0;
    float _173 = _169;
    if (!_161)
    {
        float _175 = _121 * _121;
        float _177 = _175 * 0.5;
        _171 = _177;
    }
    float _179 = _171;
    if (!_161)
    {
        float _181 = _169 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _173 = _181;
    }
    float _183 = _173;
    bool _185 = !_161;
    float _187 = _183;
    if (!_185)
    {
        float _189 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _191 = log2(_189);
        float _193 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _195 = _193 + 1.0;
        float _197 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _199 = _151 * _191;
        float _201 = 1.0 / _195;
        float _203 = _197 * 0.693147182464599609375;
        float _205 = exp2(_199);
        float _207 = 1.0 / _203;
        float _209 = _205 + (-1.0);
        float _211 = -_209;
        float _213 = fma(_211, _207, _151);
        float _215 = _213 * _201;
        float _217 = _215 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _93 = _207;
        _187 = _217;
        _95 = _205;
    }
    float _219 = _93;
    float _221 = _187;
    float _223 = _95;
    bool _225 = !_161;
    float _227 = _219;
    float _229 = _223;
    if (!_225)
    {
        float _231 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _233 = log2(_231);
        float _235 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _237 = _235 + 1.0;
        float _239 = 1.0 / _237;
        float _241 = _151 * _233;
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
    if (!_161)
    {
        _257 = _121;
    }
    float _261 = _257;
    float _263 = _221 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _265 = _261;
    if (!_161)
    {
        float _267 = _179 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _259 = _267;
    }
    float _269 = _259;
    bool _271 = !_161;
    float _273 = _269;
    if (!_271)
    {
        float _275 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _277 = log2(_275);
        float _279 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _281 = _279 + 1.0;
        float _283 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _285 = _121 * _277;
        float _287 = 1.0 / _281;
        float _289 = _283 * 0.693147182464599609375;
        float _291 = exp2(_285);
        float _293 = 1.0 / _289;
        float _295 = _291 + (-1.0);
        float _297 = -_295;
        float _299 = fma(_297, _293, _121);
        float _301 = _299 * _287;
        float _303 = _301 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _273 = _303;
    }
    float _305 = _273;
    bool _307 = !_161;
    if (!_307)
    {
        float _309 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _311 = log2(_309);
        float _313 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _315 = _313 + 1.0;
        float _317 = 1.0 / _315;
        float _319 = _121 * _311;
        float _321 = exp2(_319);
        float _323 = -_321;
        float _325 = _323 + 1.0;
        float _327 = _325 * _317;
        _265 = _327;
    }
    float _329 = _265;
    float _331 = _305 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _333 = fma(_255, _147, _263);
    float _335 = _221 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _337 = _305 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _339 = fma(_329, _147, _331);
    float _341 = _221 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _343 = _305 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _345 = fma(_255, _145, _335);
    float _347 = fma(_329, _145, _337);
    float _349 = -_339;
    float _351 = _333 + _349;
    float _353 = fma(_255, _149, _341);
    float _355 = fma(_329, _149, _343);
    float _357 = -_347;
    float _359 = _345 + _357;
    float _361 = _351 * _351;
    float _363 = in.m_49.w;
    float _365 = -_355;
    float _367 = _353 + _365;
    float _369 = _351 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _371 = fma(_359, _359, _361);
    float _373 = _351 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _375 = in.m_42.x;
    float _377 = in.m_42.y;
    float _379 = in.m_42.z;
    float _381 = _351 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _383 = fma(_367, _367, _371);
    float _385 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[4].x, _369);
    float _387 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[5].x, _373);
    float _389 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[6].x, _381);
    float _391 = fma(_367, (*spvDescriptorSet0.vp_c10)._m0[4].z, _385);
    float _393 = sqrt(_383);
    float _395 = fma(_367, (*spvDescriptorSet0.vp_c10)._m0[5].z, _387);
    bool _397 = _393 >= 9.9999999747524270787835121154785e-07;
    bool _399 = isnan(_393);
    bool _401 = _397 || _399;
    bool _403 = isnan(9.9999999747524270787835121154785e-07);
    bool _405 = _401 || _403;
    float _407 = fma(_367, (*spvDescriptorSet0.vp_c10)._m0[6].z, _389);
    float _409 = fma(_345, _363, _375);
    float _411 = fma(_333, _363, _377);
    float _413 = fma(_353, _363, _379);
    float _415 = _395;
    float _417 = _391;
    float _419 = _407;
    if (!_405)
    {
        bool _421 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _423 = !_421;
        if (!_423)
        {
            float _425 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _427 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _429 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _431 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _425);
            float _433 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _427);
            float _435 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _429);
            float _437 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _431);
            float _439 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _433);
            float _441 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _435);
            float _443 = _437 * _437;
            float _445 = fma(_439, _439, _443);
            float _447 = fma(_441, _441, _445);
            float _449 = rsqrt(_447);
            float _451 = _449 * 9.9999999747524270787835121154785e-07;
            float _453 = _439 * _451;
            float _455 = _437 * _451;
            float _457 = _441 * _451;
            _415 = _455;
            _417 = _453;
            _419 = _457;
            _459 = true;
        }
        else
        {
            float _461 = _147 * _147;
            float _463 = fma(_145, _145, _461);
            float _465 = fma(_149, _149, _463);
            float _467 = sqrt(_465);
            bool _469 = _467 >= 9.9999999747524270787835121154785e-07;
            bool _471 = isnan(_467);
            bool _473 = _469 || _471;
            bool _475 = isnan(9.9999999747524270787835121154785e-07);
            bool _477 = _473 || _475;
            if (!_477)
            {
                float _479 = _377 * _377;
                float _481 = fma(_375, _375, _479);
                float _483 = fma(_379, _379, _481);
                float _485 = sqrt(_483);
                bool _487 = _485 >= 9.9999999747524270787835121154785e-07;
                bool _489 = isnan(_485);
                bool _491 = _487 || _489;
                bool _493 = isnan(9.9999999747524270787835121154785e-07);
                bool _495 = _491 || _493;
                if (!_495)
                {
                    float _497 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _499 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _497);
                    float _501 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _499);
                    float _503 = rsqrt(_501);
                    float _505 = _503 * 9.9999999747524270787835121154785e-07;
                    float _507 = _505 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _509 = _505 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _511 = _505 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _415 = _509;
                    _417 = _507;
                    _419 = _511;
                    _459 = true;
                }
                else
                {
                    float _513 = _377 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _515 = _377 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _517 = _377 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _519 = fma(_375, (*spvDescriptorSet0.vp_c10)._m0[5].x, _513);
                    float _521 = fma(_375, (*spvDescriptorSet0.vp_c10)._m0[4].x, _515);
                    float _523 = fma(_375, (*spvDescriptorSet0.vp_c10)._m0[6].x, _517);
                    float _525 = fma(_379, (*spvDescriptorSet0.vp_c10)._m0[5].z, _519);
                    float _527 = fma(_379, (*spvDescriptorSet0.vp_c10)._m0[4].z, _521);
                    float _529 = fma(_379, (*spvDescriptorSet0.vp_c10)._m0[6].z, _523);
                    float _531 = _525 * _525;
                    float _533 = fma(_527, _527, _531);
                    float _535 = fma(_529, _529, _533);
                    float _537 = rsqrt(_535);
                    float _539 = _537 * 9.9999999747524270787835121154785e-07;
                    float _541 = _527 * _539;
                    float _543 = _525 * _539;
                    float _545 = _529 * _539;
                    _415 = _543;
                    _417 = _541;
                    _419 = _545;
                    _459 = true;
                }
            }
            else
            {
                float _547 = _147 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _549 = _147 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _551 = _147 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _553 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[5].x, _547);
                float _555 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[4].x, _549);
                float _557 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[6].x, _551);
                float _559 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[5].z, _553);
                float _561 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[4].z, _555);
                float _563 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[6].z, _557);
                float _565 = _559 * _559;
                float _567 = fma(_561, _561, _565);
                float _569 = fma(_563, _563, _567);
                float _571 = rsqrt(_569);
                float _573 = _571 * 9.9999999747524270787835121154785e-07;
                float _575 = _561 * _573;
                float _577 = _559 * _573;
                float _579 = _563 * _573;
                _415 = _577;
                _417 = _575;
                _419 = _579;
            }
        }
    }
    _459 = false;
    float _581 = _415;
    float _583 = _417;
    float _585 = _419;
    bool _587 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    bool _589 = !_587;
    float _609;
    float _611;
    if (!_589)
    {
        float _591 = in.m_51.x;
        float _593 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _595 = float(_85);
        float _597 = _591 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _599 = fma(_597, (*spvDescriptorSet0.vp_c9)._m0[11].y, _121);
        float _601 = _599 * _593;
        float _603 = floor(_601);
        float _605 = -_603;
        float _607 = _601 + _605;
        _609 = _595;
        _611 = _607;
        _613 = true;
    }
    else
    {
        float _615 = float(_85);
        float _617 = 1.0 / _615;
        float _619 = _121 * _617;
        _609 = _615;
        _611 = _619;
    }
    _613 = false;
    float _621 = _609;
    float _623 = _611;
    float _625 = _411 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _627 = _411 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _629 = fma(_409, (*spvDescriptorSet0.vp_c10)._m0[5].x, _625);
    float _631 = _411 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _633 = fma(_409, (*spvDescriptorSet0.vp_c10)._m0[4].x, _627);
    float _635 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[5].z, _629);
    float _637 = fma(_409, (*spvDescriptorSet0.vp_c10)._m0[6].x, _631);
    float _639 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[4].z, _633);
    float _641 = _635 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _643 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[6].z, _637);
    float _645 = _639 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _647 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _649 = _641 + _647;
    float _651 = _643 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _653 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _655 = _645 + _653;
    float _657 = _649 * _649;
    float _659 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _661 = _651 + _659;
    float _663 = fma(_655, _655, _657);
    float _665 = fma(_661, _661, _663);
    float _667 = _581 * _581;
    float _669 = rsqrt(_665);
    float _671 = fma(_583, _583, _667);
    float _673 = fma(_585, _585, _671);
    float _675 = rsqrt(_673);
    float _677 = _649 * _669;
    float _679 = _655 * _669;
    float _681 = _661 * _669;
    float _683 = -_677;
    float _685 = fma(_683, (*spvDescriptorSet0.vp_c9)._m0[18].w, _649);
    float _687 = -_679;
    float _689 = fma(_687, (*spvDescriptorSet0.vp_c9)._m0[18].w, _655);
    float _691 = -_681;
    float _693 = fma(_691, (*spvDescriptorSet0.vp_c9)._m0[18].w, _661);
    float _695 = _685 * _685;
    float _697 = _675 * _585;
    float _699 = _675 * _581;
    float _701 = fma(_689, _689, _695);
    float _703 = _675 * _583;
    float _705 = as_type<float>(int(gl_VertexIndex));
    float _707 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _709 = _697 * _707;
    float _711 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _713 = _699 * _711;
    float _715 = fma(_693, _693, _701);
    float _717 = in.m_49.x;
    float _719 = in.m_49.y;
    float _721 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _723 = -_709;
    float _725 = fma(_703, _721, _723);
    float _727 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _729 = -_713;
    float _731 = fma(_697, _727, _729);
    float _733 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _735 = _703 * _733;
    float _737 = _725 * _725;
    float _739 = sqrt(_715);
    float _741 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _743 = -_735;
    float _745 = fma(_699, _741, _743);
    float _747 = fma(_731, _731, _737);
    float _749 = fma(_745, _745, _747);
    float _751 = rsqrt(_749);
    int _753 = as_type<int>(_705) & 1;
    bool _755 = _753 != 0;
    int _757 = as_type<int>(_705) & 2;
    bool _759 = _757 != 0;
    float _761 = _669 * _739;
    float _763 = _719 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _765 = _717 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    bool _767 = !_759;
    float _769 = _767 ? (-0.5) : 0.5;
    float _771 = _763 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _773 = !_755;
    float _775 = _773 ? (-0.5) : 0.5;
    float _777 = _765 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _779 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _769);
    float _781 = _771 * _761;
    float _783 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _775);
    float _785 = _777 * _761;
    float _787 = _725 * _751;
    float _789 = _781 * _779;
    float _791 = _731 * _751;
    float _793 = _745 * _751;
    float _795 = _785 * _783;
    float _797 = _703 * _787;
    float _799 = _789 * _697;
    float _801 = _699 * _793;
    float _803 = _761 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _805 = _803 * 0.5;
    float _807 = -_797;
    float _809 = fma(_699, _791, _807);
    float _811 = _789 * _703;
    float _813 = fma(_795, _793, _799);
    float _815 = -_801;
    float _817 = fma(_697, _787, _815);
    float _819 = _697 * _791;
    float _821 = fma(_795, _791, _811);
    float _823 = fma(_805, _809, _813);
    float _825 = _789 * _699;
    float _827 = -_819;
    float _829 = fma(_703, _793, _827);
    float _831 = fma(_805, _817, _821);
    float _833 = _651 + _823;
    float _835 = fma(_795, _787, _825);
    float _837 = _645 + _831;
    float _839 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _841 = _833 + _839;
    float _843 = fma(_805, _829, _835);
    float _845 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _847 = _837 + _845;
    float _849 = _841 * _841;
    float _851 = _641 + _843;
    float _853 = fma(_847, _847, _849);
    float _855 = sqrt(_853);
    bool _857 = _855 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _859 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _861 = _859 != 0;
    int _863 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _865 = _863 != 0;
    int _867 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _869 = _867 != 0;
    bool _871 = !_865;
    int _873 = _871 ? 0 : 1;
    bool _875 = !_861;
    int _877 = _875 ? 0 : 1;
    bool _879 = !_869;
    int _881 = _879 ? 0 : 1;
    float _883 = _829;
    float _885 = _641;
    float _887 = _849;
    float _889 = _855;
    float _891 = _847;
    float _893 = _789;
    if (!_857)
    {
        _883 = _837;
    }
    float _895 = _883;
    float _897 = _895;
    if (!_857)
    {
        _885 = _833;
    }
    float _899 = _885;
    float _901 = _899;
    if (!_857)
    {
        _887 = _851;
    }
    float _903 = _887;
    bool _905 = !_857;
    float _907 = _903;
    if (!_905)
    {
        float _909 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _911 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _913 = _855 + _911;
        float _915 = _851 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _917 = rsqrt(_853);
        float _919 = _913 * _909;
        float _921 = _919 * 0.15915493667125701904296875;
        float _923 = _921 * 6.283185482025146484375;
        float _925 = cos(_923);
        float _927 = _921 * 6.283185482025146484375;
        float _929 = sin(_927);
        float _931 = _925 + (-1.0);
        float _933 = _931 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _935 = fma(_929, _915, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _937 = fma(_851, _925, _933);
        float _939 = _917 * _935;
        float _941 = fma(_847, _939, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _943 = fma(_841, _939, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _907 = _937;
        _897 = _941;
        _901 = _943;
        _889 = _921;
    }
    float _945 = _907;
    float _947 = _897;
    float _949 = _901;
    float _951 = _889;
    float _953 = -_677;
    float _955 = fma(_953, (*spvDescriptorSet0.vp_c9)._m0[18].w, _945);
    float _957 = -_679;
    float _959 = fma(_957, (*spvDescriptorSet0.vp_c9)._m0[18].w, _947);
    float _961 = -_681;
    float _963 = fma(_961, (*spvDescriptorSet0.vp_c9)._m0[18].w, _949);
    float _965 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _967 = _955 + _965;
    float _969 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _971 = _959 + _969;
    float _973 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _975 = _963 + _973;
    float _977 = _967 * _967;
    float _979 = fma(_971, _971, _977);
    float _981 = fma(_975, _975, _979);
    float _983 = rsqrt(_981);
    float _985 = _983 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _987 = _971 * _985;
    float _989 = _975 * _985;
    float _991 = _987 * _987;
    float _993 = _989 * _989;
    float _995 = _991 + _993;
    float _997 = sqrt(_995);
    bool _999 = _997 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1001 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1003 = _997 + _1001;
    float _1005 = _983;
    float _1007 = _995;
    float _1009 = _1003;
    float _1011 = _951;
    float _1013 = _967;
    if (_999)
    {
        float _1015 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1005 = _1015;
    }
    float _1017 = _1005;
    if (_999)
    {
        float _1019 = rsqrt(_995);
        _1007 = _1019;
    }
    float _1021 = _1007;
    float _1023 = _1021;
    if (_999)
    {
        float _1025 = _1003 * _1017;
        _1009 = _1025;
    }
    float _1027 = _1009;
    if (_999)
    {
        float _1029 = _1027 * 0.15915493667125701904296875;
        _1011 = _1029;
    }
    float _1031 = _1011;
    float _1033 = _975;
    if (_999)
    {
        float _1035 = _1031 * 6.283185482025146484375;
        float _1037 = sin(_1035);
        _1033 = _1037;
    }
    float _1039 = _1033;
    float _1041 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1043 = precise::max(0.0, _1041);
    float _1045 = _1017;
    float _1047 = _1043;
    if (_999)
    {
        float _1049 = _1031 * 6.283185482025146484375;
        float _1051 = cos(_1049);
        _1045 = _1051;
    }
    float _1053 = _1045;
    float _1055 = -_985;
    float _1057 = -_1043;
    float _1059 = fma(_967, _1055, _1057);
    if (_999)
    {
        float _1061 = _1059 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1013 = _1061;
    }
    float _1063 = _1013;
    float _1065 = sqrt(_981);
    float _1067 = _1063;
    float _1069 = _1039;
    if (_999)
    {
        float _1071 = fma(_1039, _1063, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1067 = _1071;
    }
    float _1073 = _1067;
    float _1075 = _1073;
    if (!_999)
    {
        _1069 = _987;
    }
    float _1077 = _1069;
    float _1079 = _1077;
    float _1081 = _1053;
    if (_999)
    {
        float _1083 = _1053 + (-1.0);
        _1047 = _1083;
    }
    float _1085 = _1047;
    float _1087 = _1085;
    if (_999)
    {
        float _1089 = _1021 * _1073;
        _891 = _1089;
    }
    float _1091 = _891;
    if (!_999)
    {
        _1075 = _1059;
    }
    float _1093 = _1075;
    float _1095 = _1093;
    if (_999)
    {
        float _1097 = _1085 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _893 = _1097;
    }
    float _1099 = _893;
    if (_999)
    {
        float _1101 = _987 * _1091;
        _1079 = _1101;
    }
    float _1103 = _1079;
    if (!_999)
    {
        _1087 = _989;
    }
    float _1105 = _1087;
    float _1107 = _1105;
    if (_999)
    {
        float _1109 = _989 * _1091;
        _1107 = _1109;
    }
    float _1111 = _1107;
    if (!_999)
    {
        _1023 = _991;
    }
    float _1113 = _1023;
    float _1115 = _1113;
    if (_999)
    {
        float _1117 = fma(_1059, _1053, _1099);
        _1095 = _1117;
    }
    float _1119 = _1095;
    if (_999)
    {
        float _1121 = _1103 * _1103;
        _1115 = _1121;
    }
    float _1123 = _1115;
    if (!_999)
    {
        _1081 = _993;
    }
    float _1125 = _1081;
    float _1127 = _1125;
    if (_999)
    {
        float _1129 = _1111 * _1111;
        _1127 = _1129;
    }
    float _1131 = _1127;
    float _1133 = fma(_1119, _1119, _1123);
    float _1135 = _1133 + _1131;
    float _1137 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1139 = fma(_1065, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1137);
    float _1141 = precise::clamp(_1139, 0.0, 1.0);
    float _1143 = _955 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1145 = _955 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1147 = rsqrt(_1135);
    float _1149 = -_1141;
    float _1151 = _1149 + 1.0;
    float _1153 = fma(_959, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1143);
    float _1155 = fma(_959, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1145);
    float _1157 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1159 = fma(_963, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1153);
    float _1161 = _955 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1163 = fma(_963, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1155);
    float _1165 = abs(_1151);
    float _1167 = log2(_1165);
    float _1169 = _955 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1171 = fma(_959, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1161);
    float _1173 = _1163 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1175 = _1159 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1177 = fma(_959, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1169);
    float _1179 = fma(_963, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1171);
    float _1181 = _1147 * _1103;
    float _1183 = _1147 * _1111;
    float _1185 = _1147 * _1119;
    float _1187 = _1179 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1189 = _1181 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1191 = _1173 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1193 = fma(_963, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1177);
    float _1195 = _1175 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1197 = -_1189;
    float _1199 = fma(_1185, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1197);
    float _1201 = fma(_1187, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1191);
    float _1203 = _1193 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1205 = -_1195;
    float _1207 = fma(_1205, _1157, 1.0);
    float _1209 = -_1183;
    float _1211 = fma(_1209, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1199);
    float _1213 = fma(_1175, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1201);
    float _1215 = _1167 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1217 = _1173 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1219 = fma(_1211, -0.5, 0.5);
    float _1221 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1213);
    float _1223 = log2(_1207);
    float _1225 = _1173 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1227 = fma(_1187, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1217);
    float _1229 = fma(_1211, 0.5, 0.5);
    float _1231 = _1185 + 1.0;
    float _1233 = fma(_1187, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1225);
    float _1235 = fma(_1175, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1227);
    float _1237 = fma(_1229, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1239 = exp2(_1215);
    float _1241 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1235);
    float _1243 = fma(_1229, _1237, -0.212114393711090087890625);
    float _1245 = fma(_1229, _1243, 1.570728778839111328125);
    float _1247 = 1.0 / _1221;
    float _1249 = fma(_1175, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1233);
    float _1251 = _1223 * 0.693147182464599609375;
    float _1253 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1249);
    float _1255 = _1251 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1257 = sqrt(_1219);
    float _1259 = -_1185;
    float _1261 = fma(_1239, _1231, _1259);
    float _1263 = fma(_1261, 0.5, 0.5);
    float _1265 = _1241 * _1247;
    float _1267 = _1253 * _1247;
    float _1269 = fma(_1265, 0.5, 0.5);
    float _1271 = fma(_1267, -0.5, 0.5);
    float _1273 = _1257 * 0.636619746685028076171875;
    float _1275 = -_1245;
    float _1277 = fma(_1273, _1275, 1.0);
    float3 _4105 = float3(_1269, _1271, _1255);
    float _1279 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4105, float3(0.0), isnan(_4105)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4105, float3(0.0), isnan(_4105)), level(0.0)).x;
    float3 _4116 = float3(_1269, _1271, _1255);
    float4 _1282 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4116, float3(0.0), isnan(_4116)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4116, float3(0.0), isnan(_4116)), level(0.0)).xyzw;
    float _1284 = _1282.x;
    float _1286 = _1282.y;
    float _1288 = _1282.z;
    float _1290 = _1282.w;
    float2 _4133 = float2(_1277, _1263);
    float3 _1294 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4133, float2(0.0), isnan(_4133)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4133, float2(0.0), isnan(_4133)), level(0.0)).xyz;
    float _1296 = _1294.x;
    float _1298 = _1294.y;
    float _1300 = _1294.z;
    float _1302 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1304 = int(_1302);
    int _1306 = abs(_877);
    float _1308 = _1173 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1310 = fma(_1187, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1308);
    float _1312 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1314 = int(_1312);
    float _1316 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1318 = float(_1304);
    float _1320 = 1.0 / _621;
    float _1322 = float(uint(_1314));
    float _1324 = 1.0 / _1318;
    int _1326 = ~_1314;
    int _1328 = _1326 + 1;
    int _1330 = ~_1314;
    int _1332 = _1330 + 1;
    int _1334 = _1314 + (-1);
    int _1336 = ~_1314;
    int _1338 = _1336 + 1;
    float _1340 = 1.0 / _1322;
    float _1342 = _121 * _1324;
    float _1344 = in.m_51.x;
    float _1346 = trunc(_1342);
    int _1348 = int(_1346);
    int _1350 = as_type<int>(_1340) + (-2);
    float _1352 = float(uint(_1348));
    float _1354 = as_type<float>(_1350) * _1352;
    float _1356 = trunc(_1354);
    float _1358 = precise::max(_1356, 0.0);
    uint _1361 = uint(_1358);
    int _1363 = _1328 * int(_1361);
    int _1365 = _1363 + _1348;
    float _1367 = float(uint(_1365));
    float _1369 = as_type<float>(_1350) * _1367;
    int _1371 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1373 = _1371 != 0;
    float _1375 = trunc(_1369);
    float _1377 = precise::max(_1375, 0.0);
    uint _1379 = uint(_1377);
    bool _1381 = !_1373;
    float _1383 = _1381 ? 7.345489978790283203125 : 1.0;
    float _1385 = _1383 * _1344;
    float _1387 = floor(_1385);
    int _1389 = int(_1361) + int(_1379);
    float _1391 = float(_1314);
    float _1393 = float(_1348);
    int _1395 = _1332 * _1389;
    int _1397 = _1395 + _1348;
    bool _1399 = _1393 >= _1391;
    bool _1401 = isnan(_1393);
    bool _1403 = _1399 || _1401;
    bool _1405 = isnan(_1391);
    bool _1407 = _1403 || _1405;
    float _1409 = float(_1407);
    bool _1411 = uint(_1397) >= uint(_1314);
    float _1413 = -_1387;
    float _1415 = _1385 + _1413;
    float _1417 = trunc(_1409);
    int _1419 = int(_1417);
    bool _1421 = !_1411;
    int _1423 = _1421 ? 0 : (-1);
    bool _1425 = _1314 == 0;
    int _1427 = ~_1389;
    int _1429 = _1427 + _1423;
    int _1431 = _1429 + 1;
    float _1433 = _1415 * _1391;
    float _1435 = _121 * _1391;
    int _1437 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1439 = _1437 != 0;
    int _1441 = _1314 * _1431;
    int _1443 = _1441 + _1348;
    float _1445 = _1435 * _1320;
    float _1447 = trunc(_1433);
    int _1449 = int(_1447);
    bool _1451 = !_1439;
    int _1453 = _1451 ? 0 : 1;
    bool _1455 = !_1425;
    int _1457 = _1455 ? _1443 : (-1);
    int _1459 = ~_1419;
    int _1461 = _1459 + 1;
    int _1463 = _1461 + 1;
    int _1465 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1467 = _1465 != 0;
    float _1469 = trunc(_1445);
    int _1471 = int(_1469);
    int _1473 = abs(_873);
    int _1475 = _1457 * _1463;
    int _1477 = abs(_1453);
    int _1479 = abs(_881);
    int _1481 = _1419 * _1334;
    int _1483 = _1481 + _1475;
    int _1485 = _1449 * _1477;
    int _1487 = _1485 + _1348;
    bool _1489 = !_1467;
    int _1491 = _1489 ? 0 : 1;
    int _1493 = ~_1314;
    int _1495 = _1493 + 1;
    int _1497 = _1483 * _1473;
    int _1499 = abs(_1491);
    float _1501 = in.m_51.w;
    int _1503 = _1471 * _1306;
    int _1505 = _1503 + _1497;
    float _1507 = _1344 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1509 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1511 = _1509 != 0;
    int _1513 = _1487 * _1479;
    int _1515 = _1513 + _1505;
    float _1517 = -_1316;
    float _1519 = fma(_1507, 2.0, _1517);
    float _1521 = float(uint(_1487));
    int _1523 = _1449 * _1499;
    int _1525 = _1523 + _1515;
    int _1527 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1529 = _1527 != 0;
    float _1531 = in.m_51.y;
    int _1533 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1535 = _1533 != 0;
    float _1537 = -_121;
    float _1539 = fma(_1537, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1519);
    float _1541 = float(uint(_1525));
    int _1543 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1545 = _1543 != 0;
    int _1547 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1549 = _1547 != 0;
    float _1551 = as_type<float>(_1350) * _1541;
    int _1553 = ~_1314;
    int _1555 = _1553 + 1;
    float _1557 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _1559 = trunc(_1551);
    float _1561 = precise::max(_1559, 0.0);
    uint _1563 = uint(_1561);
    float _1565 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1567 = _1565 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1569 = _1557 * _1344;
    float _1571 = 1.0 / _1567;
    int _1573 = _1555 * int(_1563);
    int _1575 = _1573 + _1525;
    float _1577 = _1531 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1579 = trunc(_1569);
    int _1581 = int(_1579);
    float _1583 = float(uint(_1575));
    float _1585 = as_type<float>(_1350) * _1583;
    float _1587 = trunc(_1585);
    float _1589 = precise::max(_1587, 0.0);
    uint _1591 = uint(_1589);
    int _1593 = int(_1563) + int(_1591);
    float _1595 = in.m_51.z;
    int _1597 = _1495 * _1593;
    int _1599 = _1597 + _1525;
    float _1601 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1603 = _1601 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1605 = uint(_1599) >= uint(_1314);
    float _1607 = 1.0 / _1603;
    bool _1609 = !_1605;
    int _1611 = _1609 ? 0 : (-1);
    bool _1613 = _1344 > 0.5;
    float _1615 = -_775;
    int _1617 = _1613 ? as_type<int>(_1615) : as_type<int>(_775);
    bool _1619 = !_1511;
    float _1621 = _1619 ? _775 : as_type<float>(_1617);
    bool _1623 = _1595 > 0.5;
    float _1625 = _1621 + 0.5;
    bool _1627 = _1501 > 0.5;
    float _1629 = -_775;
    int _1631 = _1623 ? as_type<int>(_1629) : as_type<int>(_775);
    float _1633 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1635 = fma(_1625, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1539);
    bool _1637 = _1531 > 0.5;
    float _1639 = fma(_1344, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1633);
    float _1641 = as_type<float>(_1350) * _1521;
    float _1643 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1645 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1647 = fma(_1577, -2.0, _1643);
    float _1649 = trunc(_1641);
    float _1651 = precise::max(_1649, 0.0);
    uint _1653 = uint(_1651);
    float _1655 = fma(_1531, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1645);
    float _1657 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1659 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1657;
    int _1661 = ~_1314;
    int _1663 = _1661 + 1;
    float _1665 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1647);
    int _1667 = ~_1593;
    int _1669 = _1667 + _1611;
    int _1671 = _1669 + 1;
    float _1673 = _1659 * _1607;
    float _1675 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1677 = _1675 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    int _1679 = _1581 << 4;
    int _1681 = _1679 + 1968;
    int _1683 = _1314 * _1671;
    int _1685 = _1683 + _1525;
    float _1687 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1689 = _623 + _1687;
    float _1691 = _1677 * _1571;
    int _1693 = _1681 + 8;
    uint _1695 = uint(int(uint(_1693) >> uint(2)));
    uint _1697 = uint(int(uint(int(_1695)) >> uint(2)));
    int _1699 = int(_1695) & 3;
    float _1701 = (*spvDescriptorSet0.vp_c9)._m0[int(_1697)][_1699];
    float _1703 = fma(_1673, _1689, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    int _1705 = _1663 * int(_1653);
    int _1707 = _1705 + _1487;
    float _1709 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1639);
    bool _1711 = _623 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1713 = isnan(_623);
    bool _1715 = _1711 || _1713;
    bool _1717 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1719 = _1715 || _1717;
    float _1721 = float(_1719);
    float _1723 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1725 = _623 + _1723;
    float _1727 = float(uint(_1707));
    float _1729 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1655);
    bool _1731 = !_1425;
    int _1733 = _1731 ? _1685 : (-1);
    uint _1735 = uint(int(uint(_1681) >> uint(2)));
    uint _1737 = uint(int(uint(int(_1735)) >> uint(2)));
    int _1739 = int(_1735) & 3;
    float _1741 = (*spvDescriptorSet0.vp_c9)._m0[int(_1737)][_1739];
    int _1743 = int(_1735) + 1;
    uint _1745 = uint(int(uint(_1743) >> uint(2)));
    int _1747 = _1743 & 3;
    float _1749 = (*spvDescriptorSet0.vp_c9)._m0[int(_1745)][_1747];
    float _1751 = fma(_1691, _1725, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1753 = as_type<float>(_1350) * _1727;
    int _1755 = _1733 >> 31;
    bool _1757 = _623 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1759 = isnan(_623);
    bool _1761 = _1757 || _1759;
    bool _1763 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1765 = _1761 || _1763;
    float _1767 = float(_1765);
    int _1769 = _1755 & 3;
    float _1771 = trunc(_1753);
    float _1773 = precise::max(_1771, 0.0);
    uint _1775 = uint(_1773);
    float _1777 = -_1721;
    float _1779 = _1777 + 1.0;
    bool _1781 = !_1545;
    float _1783 = _1781 ? _775 : as_type<float>(_1631);
    int _1785 = _1733 + _1769;
    float _1787 = _1767 * _1779;
    bool _1789 = _623 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1791 = isnan(_623);
    bool _1793 = _1789 || _1791;
    bool _1795 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1797 = _1793 || _1795;
    float _1799 = float(_1797);
    float _1801 = -_1767;
    float _1803 = _1801 + 1.0;
    int _1805 = _1785 >> 2;
    float _1807 = _1783 + 0.5;
    float _1809 = -_769;
    int _1811 = _1637 ? as_type<int>(_1809) : as_type<int>(_769);
    int _1813 = _1805 << 4;
    int _1815 = _1813 + 368;
    bool _1817 = !_1535;
    float _1819 = _1817 ? _769 : as_type<float>(_1811);
    float _1821 = _1799 * _1803;
    int _1823 = int(_1653) + int(_1775);
    float _1825 = -_1799;
    float _1827 = _1825 + 1.0;
    uint _1829 = uint(int(uint(_1815) >> uint(2)));
    uint _1831 = uint(int(uint(int(_1829)) >> uint(2)));
    int _1833 = int(_1829) & 3;
    float _1835 = (*spvDescriptorSet0.vp_c9)._m0[int(_1831)][_1833];
    int _1837 = int(_1829) + 1;
    uint _1839 = uint(int(uint(_1837) >> uint(2)));
    int _1841 = _1837 & 3;
    float _1843 = (*spvDescriptorSet0.vp_c9)._m0[int(_1839)][_1841];
    float _1845 = -_769;
    int _1847 = _1627 ? as_type<int>(_1845) : as_type<int>(_769);
    float _1849 = _1703 * _1821;
    int _1851 = _1733 & 3;
    bool _1853 = _1851 != 0;
    int _1855 = _1338 * _1823;
    int _1857 = _1855 + _1487;
    bool _1859 = !_1549;
    float _1861 = _1859 ? _769 : as_type<float>(_1847);
    float _1863 = fma(_1827, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1849);
    int _1865 = _1733 & 3;
    bool _1867 = _1865 != 0;
    int _1869 = _1815 + 8;
    uint _1871 = uint(int(uint(_1869) >> uint(2)));
    uint _1873 = uint(int(uint(int(_1871)) >> uint(2)));
    int _1875 = int(_1871) & 3;
    float _1877 = (*spvDescriptorSet0.vp_c9)._m0[int(_1873)][_1875];
    int _1879 = int(_1871) + 1;
    uint _1881 = uint(int(uint(_1879) >> uint(2)));
    int _1883 = _1879 & 3;
    float _1885 = (*spvDescriptorSet0.vp_c9)._m0[int(_1881)][_1883];
    float _1887 = fma(_1751, _1787, _1863);
    bool _1889 = uint(_1865) > 1u;
    float _1891 = _1701 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _1893 = _1853 ? 0 : 1;
    float _1895 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _1897 = uint(_1857) >= uint(_1314);
    float _1899 = _1891 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1901 = _1865 != 3;
    float _1903 = _1819 + (-0.5);
    int _1905 = ~_1893;
    int _1907 = _1905 + 1;
    int _1909 = _1907 + 1;
    float _1911 = -_1861;
    float _1913 = _1911 + 0.5;
    bool _1915 = !_1897;
    int _1917 = _1915 ? 0 : (-1);
    float _1919 = _1741 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1921 = _1749 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _1923 = _1909;
    if (!_1889)
    {
        int _1925 = ~_1893;
        int _1927 = _1925 + 1;
        _1923 = _1927;
    }
    int _1929 = _1923;
    float _1931 = -_1903;
    float _1933 = -_1665;
    float _1935 = fma(_1931, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1933);
    float _1937 = _1919 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1939 = _1921 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1941 = uint(_1865) >= 2u;
    float _1943 = fma(_1721, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1887);
    bool _1945 = !_1867;
    int _1947 = _1945 ? 0 : 1;
    int _1949 = abs(_1929);
    out.m_56.x = _1937;
    out.m_56.y = _1939;
    out.m_56.z = _1899;
    out.m_56.w = _1895;
    int _1951 = _1941 ? 0 : 1;
    float _1953 = _1943 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _1955 = _1865 != 3;
    int _1957 = abs(_1947);
    int _1959 = ~_1823;
    int _1961 = _1959 + _1917;
    int _1963 = _1961 + 1;
    int _1965 = ~_1951;
    int _1967 = _1965 + 1;
    int _1969 = _1967 + 1;
    int _1971 = _1969;
    if (_1901)
    {
        int _1973 = ~_1951;
        int _1975 = _1973 + 1;
        _1971 = _1975;
    }
    int _1977 = _1971;
    int _1979 = _1314 * _1963;
    int _1981 = _1979 + _1487;
    float _1983 = _1167 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1985 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1987 = !_1955;
    int _1989 = _1987 ? 0 : (-1);
    int _1991 = ~_1949;
    int _1993 = _1991 + 1;
    int _1995 = _1993 + 1;
    int _1997 = abs(_1989);
    float _1999 = exp2(_1983);
    int _2001 = abs(_1977);
    int _2003 = _1995 * as_type<int>(_1843);
    int _2005 = ~_1957;
    int _2007 = _2005 + 1;
    int _2009 = _2007 + 1;
    float _2011 = fma(_1175, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1310);
    int _2013 = ~_2001;
    int _2015 = _2013 + 1;
    int _2017 = _2015 + 1;
    int _2019 = _2009 * as_type<int>(_1835);
    int _2021 = _2019 + _2003;
    float _2023 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2025 = ~_1997;
    int _2027 = _2025 + 1;
    int _2029 = _2027 + 1;
    float _2031 = _1807 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _2033 = _2017 * as_type<int>(_1877);
    int _2035 = _2033 + _2021;
    float _2037 = _1913 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2039 = _2031 * _1985;
    int _2041 = _2029 * as_type<int>(_1885);
    int _2043 = _2041 + _2035;
    bool _2045 = !_1529;
    int _2047 = _2045 ? 0 : 1;
    float _2049 = -_1709;
    float _2051 = _2049 + 1.0;
    float _2053 = -_1729;
    float _2055 = _2053 + 1.0;
    float _2057 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _2059 = abs(_2047);
    float _2061 = -_2051;
    float _2063 = fma(_1621, _2061, _1635);
    float _2065 = fma(_1819, _2055, _1935);
    float _2067 = _2057 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2069 = ~_2059;
    int _2071 = _2069 + 1;
    int _2073 = _2071 + 1;
    float _2075 = _2037 * _2023;
    bool _2077 = !_1425;
    int _2079 = _2077 ? _1981 : (-1);
    float _2081 = -_1999;
    float _2083 = _2081 + 1.0;
    int _2085 = _2043 * _2073;
    out.m_58.x = _2063;
    out.m_58.y = _2065;
    out.m_58.z = _2039;
    out.m_58.w = _2075;
    float _2087 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2011);
    int _2089 = _2079 * _2059;
    int _2091 = _2089 + _2085;
    float _2093 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2095 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2097 = _2087 + _1221;
    float _2099 = float(_2091);
    out.gl_Position.x = _1241;
    out.gl_Position.y = _1253;
    out.gl_Position.z = _2087;
    out.gl_Position.w = _1221;
    float _2101 = _2093 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2103 = _2095 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_60.x = _2099;
    float _2105 = _2083 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2107 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2109 = _2097 * 0.5;
    out.m_62.x = _2067;
    out.m_62.y = _2101;
    out.m_62.z = _2103;
    out.m_62.w = _1953;
    float _2111 = _2105 * _1279;
    float _2113 = -_2105;
    float _2115 = _2113 + 1.0;
    out.m_64.z = _2109;
    out.m_64.w = _1221;
    float _2117 = _1290 * _2111;
    float _2119 = _1300 * _2111;
    float _2121 = _1290 * _2115;
    float _2123 = fma(_1296, _2117, _1284);
    float _2125 = fma(_1298, _2117, _1286);
    float _2127 = fma(_1290, _2119, _1288);
    out.m_45.x = _2107;
    out.m_66.x = _2123;
    out.m_66.y = _2125;
    out.m_66.z = _2127;
    out.m_66.w = _2121;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

