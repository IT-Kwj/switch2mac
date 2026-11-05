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
    bool _1385 = false;
    bool _609 = false;
    bool _459 = false;
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
    float _95 = _93;
    if (!_89)
    {
        out.m_47.x = 0.0;
    }
    int _97 = 0;
    if (!_89)
    {
        float _99 = _93 * 5.0;
        _97 = as_type<int>(_99);
    }
    int _101 = _97;
    int _103 = _101;
    if (!_89)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2017 = as_type<float>(_101);
        out.gl_Position.z = _2017;
    }
    if (!_89)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _105 = in.m_49.w;
    bool _107 = _105 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _109 = isnan(_105);
    bool _111 = _107 || _109;
    bool _113 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _115 = _111 || _113;
    float _117 = -_105;
    float _119 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _121 = 0.0;
    float _123 = 0.0;
    if (_115)
    {
        float _125 = float(_85);
        _95 = _125;
    }
    float _127 = _95;
    bool _129 = _119 >= _127;
    bool _131 = !_115;
    bool _133 = _129 || _131;
    float _135 = _127;
    if (_133)
    {
        _135 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _137 = _135;
    if (_133)
    {
        out.m_47.x = 0.0;
    }
    if (_133)
    {
        float _139 = _137 * 5.0;
        _103 = as_type<int>(_139);
    }
    int _141 = _103;
    float _143 = as_type<float>(_141);
    if (_133)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2088 = as_type<float>(_141);
        out.gl_Position.z = _2088;
    }
    if (_133)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _145 = in.m_49.x;
    float _147 = in.m_49.y;
    float _149 = in.m_49.z;
    float _151 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
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
        _143 = _167;
    }
    float _169 = _143;
    float _171 = 0.0;
    float _173 = _169;
    if (!_161)
    {
        float _175 = _119 * _119;
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
        _121 = _207;
        _187 = _217;
        _123 = _205;
    }
    float _219 = _121;
    float _221 = _187;
    float _223 = _123;
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
        _257 = _119;
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
        float _285 = _119 * _277;
        float _287 = 1.0 / _281;
        float _289 = _283 * 0.693147182464599609375;
        float _291 = exp2(_285);
        float _293 = 1.0 / _289;
        float _295 = _291 + (-1.0);
        float _297 = -_295;
        float _299 = fma(_297, _293, _119);
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
        float _319 = _119 * _311;
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
    float _363 = in.m_51.w;
    float _365 = -_355;
    float _367 = _353 + _365;
    float _369 = _351 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _371 = fma(_359, _359, _361);
    float _373 = _351 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _375 = _351 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _377 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[4].x, _369);
    float _379 = fma(_367, _367, _371);
    float _381 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[5].x, _373);
    float _383 = in.m_44.x;
    float _385 = in.m_44.y;
    float _387 = in.m_44.z;
    float _389 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[6].x, _375);
    float _391 = fma(_367, (*spvDescriptorSet0.vp_c10)._m0[4].z, _377);
    float _393 = sqrt(_379);
    float _395 = fma(_367, (*spvDescriptorSet0.vp_c10)._m0[5].z, _381);
    float _397 = fma(_367, (*spvDescriptorSet0.vp_c10)._m0[6].z, _389);
    bool _399 = _393 >= 9.9999999747524270787835121154785e-07;
    bool _401 = isnan(_393);
    bool _403 = _399 || _401;
    bool _405 = isnan(9.9999999747524270787835121154785e-07);
    bool _407 = _403 || _405;
    float _409 = fma(_345, _363, _383);
    float _411 = fma(_333, _363, _385);
    float _413 = fma(_353, _363, _387);
    float _415 = _395;
    float _417 = _391;
    float _419 = _397;
    if (!_407)
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
                float _479 = _385 * _385;
                float _481 = fma(_383, _383, _479);
                float _483 = fma(_387, _387, _481);
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
                    float _513 = _385 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _515 = _385 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _517 = _385 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _519 = fma(_383, (*spvDescriptorSet0.vp_c10)._m0[5].x, _513);
                    float _521 = fma(_383, (*spvDescriptorSet0.vp_c10)._m0[4].x, _515);
                    float _523 = fma(_383, (*spvDescriptorSet0.vp_c10)._m0[6].x, _517);
                    float _525 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[5].z, _519);
                    float _527 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[4].z, _521);
                    float _529 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[6].z, _523);
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
    bool _587 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _589 = !_587;
    float _607;
    if (!_589)
    {
        float _591 = in.m_53.x;
        float _593 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _595 = _591 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _597 = fma(_595, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _599 = _597 * _593;
        float _601 = floor(_599);
        float _603 = -_601;
        float _605 = _599 + _603;
        _607 = _605;
        _609 = true;
    }
    else
    {
        float _611 = float(_85);
        float _613 = 1.0 / _611;
        float _615 = _119 * _613;
        _607 = _615;
    }
    _609 = false;
    float _617 = _607;
    float _619 = as_type<float>(int(gl_VertexIndex));
    float _621 = _411 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _623 = 0.0 + (*spvDescriptorSet0.vp_c7)._m0[0].x;
    float _625 = precise::clamp(_623, 0.0, 1.0);
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _629 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _627;
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _633 = _631 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _635 = fma(_409, (*spvDescriptorSet0.vp_c10)._m0[5].x, _621);
    float _637 = fma(_625, -0.64999997615814208984375, 1.0);
    float _639 = 1.0 / _629;
    float _641 = _581 * _581;
    float _643 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[5].z, _635);
    float _645 = fma(_583, _583, _641);
    float _647 = _643 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _649 = 1.0 / _633;
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _653 = _617 + _651;
    float _655 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _657 = _647 + _655;
    float _659 = fma(_585, _585, _645);
    int _661 = as_type<int>(_619) & 1;
    bool _663 = _661 != 0;
    int _665 = as_type<int>(_619) & 2;
    bool _667 = _665 != 0;
    float _669 = _411 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _671 = _411 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _673 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _675 = _617 + _673;
    float _677 = _653 * _639;
    float _679 = fma(_409, (*spvDescriptorSet0.vp_c10)._m0[4].x, _669);
    float _681 = fma(_409, (*spvDescriptorSet0.vp_c10)._m0[6].x, _671);
    float _683 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _685 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _683;
    float _687 = rsqrt(_659);
    float _689 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[4].z, _679);
    float _691 = _675 * _649;
    float _693 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[6].z, _681);
    float _695 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _697 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _695;
    float _699 = _689 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _701 = _657 * _657;
    float _703 = _693 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _705 = fma(_685, _677, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _707 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _709 = _699 + _707;
    float _711 = fma(_697, _677, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _713 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _715 = _703 + _713;
    bool _717 = _617 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _719 = isnan(_617);
    bool _721 = _717 || _719;
    bool _723 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _725 = _721 || _723;
    float _727 = float(_725);
    float _729 = fma(_709, _709, _701);
    bool _731 = _617 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _733 = isnan(_617);
    bool _735 = _731 || _733;
    bool _737 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _739 = _735 || _737;
    float _741 = float(_739);
    bool _743 = _617 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _745 = isnan(_617);
    bool _747 = _743 || _745;
    bool _749 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _751 = _747 || _749;
    float _753 = float(_751);
    float _755 = fma(_715, _715, _729);
    float _757 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _759 = _757 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _761 = -_727;
    float _763 = _761 + 1.0;
    float _765 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _767 = _765 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _769 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _771 = (*spvDescriptorSet0.vp_c10)._m0[9].w + _769;
    float _773 = fma(_759, _691, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _775 = rsqrt(_755);
    float _777 = _741 * _763;
    float _779 = fma(_767, _691, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _781 = -_741;
    float _783 = _781 + 1.0;
    float _785 = _687 * _585;
    float _787 = _705 * _777;
    float _789 = _711 * _777;
    float _791 = -_753;
    float _793 = _791 + 1.0;
    float _795 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _797 = (*spvDescriptorSet0.vp_c10)._m0[8].w + _795;
    float _799 = _771 * _771;
    float _801 = _687 * _583;
    float _803 = _687 * _581;
    float _805 = fma(_783, (*spvDescriptorSet0.vp_c9)._m0[143].y, _789);
    float _807 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _809 = _785 * _807;
    float _811 = _727 * _793;
    float _813 = _657 * _775;
    float _815 = _709 * _775;
    float _817 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _819 = (*spvDescriptorSet0.vp_c10)._m0[10].w + _817;
    float _821 = fma(_797, _797, _799);
    float _823 = -_813;
    float _825 = fma(_823, (*spvDescriptorSet0.vp_c9)._m0[18].w, _657);
    float _827 = -_815;
    float _829 = fma(_827, (*spvDescriptorSet0.vp_c9)._m0[18].w, _709);
    float _831 = fma(_783, (*spvDescriptorSet0.vp_c9)._m0[143].x, _787);
    float _833 = _715 * _775;
    float _835 = _825 * _825;
    float _837 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _839 = -_809;
    float _841 = fma(_801, _837, _839);
    float _843 = fma(_819, _819, _821);
    float _845 = -_833;
    float _847 = fma(_845, (*spvDescriptorSet0.vp_c9)._m0[18].w, _715);
    float _849 = fma(_829, _829, _835);
    float _851 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _853 = _803 * _851;
    float _855 = in.m_51.x;
    float _857 = in.m_51.y;
    float _859 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _861 = _801 * _859;
    float _863 = _841 * _841;
    float _865 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _867 = -_853;
    float _869 = fma(_785, _865, _867);
    float _871 = fma(_847, _847, _849);
    float _873 = sqrt(_843);
    float _875 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _877 = -_861;
    float _879 = fma(_803, _875, _877);
    float _881 = fma(_869, _869, _863);
    float _883 = fma(_779, _811, _805);
    float _885 = fma(_773, _811, _831);
    float _887 = fma(_879, _879, _881);
    float _889 = fma(_753, (*spvDescriptorSet0.vp_c9)._m0[145].y, _883);
    float _891 = rsqrt(_843);
    float _893 = fma(_753, (*spvDescriptorSet0.vp_c9)._m0[145].x, _885);
    float _895 = sqrt(_871);
    float _897 = _873 * 0.066666670143604278564453125;
    float _899 = _889 * _857;
    bool _901 = !_667;
    float _903 = _901 ? (-0.5) : 0.5;
    float _905 = _893 * _855;
    float _907 = precise::max(_897, 1.0);
    float _909 = _899 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _911 = rsqrt(_887);
    float _913 = _891 * (-0.20000000298023223876953125);
    float _915 = _905 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _917 = precise::min(_907, 2.0);
    float _919 = fma(_771, _913, (*spvDescriptorSet0.vp_c10)._m0[9].w);
    float _921 = fma(_797, _913, (*spvDescriptorSet0.vp_c10)._m0[8].w);
    bool _923 = !_663;
    float _925 = _923 ? (-0.5) : 0.5;
    float _927 = _775 * _895;
    float _929 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _903);
    float _931 = fma(_819, _913, (*spvDescriptorSet0.vp_c10)._m0[10].w);
    float _933 = _917 * _637;
    float _935 = _909 * _927;
    float _937 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _925);
    float _939 = _915 * _927;
    float _941 = _927 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _943 = _941 * 0.5;
    float _945 = _869 * _911;
    float _947 = _935 * _929;
    float _949 = _879 * _911;
    float _951 = _841 * _911;
    float _953 = _939 * _937;
    float _955 = _785 * _945;
    float _957 = _947 * _803;
    float _959 = _803 * _949;
    float _961 = _947 * _801;
    float _963 = -_955;
    float _965 = fma(_801, _949, _963);
    float _967 = fma(_953, _951, _957);
    float _969 = _801 * _951;
    float _971 = -_959;
    float _973 = fma(_785, _951, _971);
    float _975 = _947 * _785;
    float _977 = fma(_953, _945, _961);
    float _979 = fma(_943, _965, _967);
    float _981 = -_969;
    float _983 = fma(_803, _945, _981);
    float _985 = fma(_953, _949, _975);
    float _987 = fma(_943, _973, _977);
    float _989 = _647 + _979;
    float _991 = -_919;
    float _993 = _991 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _995 = fma(_943, _983, _985);
    float _997 = _699 + _987;
    float _999 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1001 = _989 + _999;
    float _1003 = _993 * _993;
    float _1005 = _703 + _995;
    float _1007 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1009 = _997 + _1007;
    float _1011 = fma(_1001, _933, (*spvDescriptorSet0.vp_c10)._m0[9].w);
    float _1013 = -_921;
    float _1015 = _1013 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1017 = fma(_1009, _933, (*spvDescriptorSet0.vp_c10)._m0[8].w);
    float _1019 = -_1011;
    float _1021 = _1019 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1023 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1025 = _1005 + _1023;
    float _1027 = fma(_1015, _1015, _1003);
    float _1029 = -_1017;
    float _1031 = _1029 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1033 = _1021 * _1021;
    float _1035 = fma(_1025, _933, (*spvDescriptorSet0.vp_c10)._m0[10].w);
    float _1037 = -_931;
    float _1039 = _1037 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1041 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1043 = _919 + _1041;
    float _1045 = fma(_1031, _1031, _1033);
    float _1047 = -_1035;
    float _1049 = _1047 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1051 = fma(_1039, _1039, _1027);
    float _1053 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1055 = _921 + _1053;
    float _1057 = _1043 * _1043;
    float _1059 = fma(_1049, _1049, _1045);
    float _1061 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1063 = _931 + _1061;
    float _1065 = sqrt(_1051);
    float _1067 = fma(_1055, _1055, _1057);
    float _1069 = fma(_1063, _1063, _1067);
    float _1071 = sqrt(_1059);
    float _1073 = rsqrt(_1069);
    float _1075 = -_1065;
    float _1077 = _1071 + _1075;
    float _1079 = _1073 * _1077;
    float _1081 = in.m_53.x;
    float _1083 = in.m_53.y;
    float _1085 = in.m_53.z;
    float _1087 = in.m_53.w;
    float _1089 = -_1079;
    float _1091 = fma(_1055, _1089, _1017);
    float _1093 = -_1079;
    float _1095 = fma(_1063, _1093, _1035);
    float _1097 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1099 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1101 = _1091 + _1099;
    float _1103 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1105 = _1095 + _1103;
    float _1107 = -_1079;
    float _1109 = fma(_1043, _1107, _1011);
    int _1111 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1113 = _1111 != 0;
    float _1115 = _1101 * _1101;
    float _1117 = _1105 * _1105;
    int _1119 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1121 = _1119 != 0;
    float _1123 = _1115 + _1117;
    float _1125 = sqrt(_1123);
    bool _1127 = _1083 > 0.5;
    bool _1129 = _1087 > 0.5;
    float _1131 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1133 = _1081 > 0.5;
    bool _1135 = _1085 > 0.5;
    float _1137 = -_925;
    int _1139 = _1133 ? as_type<int>(_1137) : as_type<int>(_925);
    float _1141 = -_903;
    int _1143 = _1127 ? as_type<int>(_1141) : as_type<int>(_903);
    float _1145 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1147 = _1125 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1149 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1151 = _1149 != 0;
    float _1153 = -_903;
    int _1155 = _1129 ? as_type<int>(_1153) : as_type<int>(_903);
    int _1157 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1159 = _1157 != 0;
    float _1161 = -_925;
    int _1163 = _1135 ? as_type<int>(_1161) : as_type<int>(_925);
    bool _1165 = !_1113;
    float _1167 = _1165 ? _925 : as_type<float>(_1139);
    bool _1169 = !_1121;
    float _1171 = _1169 ? _903 : as_type<float>(_1143);
    bool _1173 = !_1151;
    float _1175 = _1173 ? _903 : as_type<float>(_1155);
    bool _1177 = !_1159;
    float _1179 = _1177 ? _925 : as_type<float>(_1163);
    float _1181 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    float _1183 = _903;
    float _1185 = _1011;
    float _1187 = _1043;
    float _1189 = _1117;
    if (!_1147)
    {
        _1181 = _1115;
    }
    float _1191 = _1181;
    float _1193 = _1191;
    if (!_1147)
    {
        _1183 = _1091;
    }
    float _1195 = _1183;
    float _1197 = _1195;
    if (!_1147)
    {
        _1185 = _1095;
    }
    float _1199 = _1185;
    float _1201 = _1199;
    if (!_1147)
    {
        _1187 = _1109;
    }
    float _1203 = _1187;
    bool _1205 = !_1147;
    float _1207 = _1203;
    if (!_1205)
    {
        float _1209 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1211 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1213 = _1125 + _1211;
        float _1215 = _1109 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1217 = rsqrt(_1123);
        float _1219 = _1213 * _1209;
        float _1221 = _1219 * 0.15915493667125701904296875;
        float _1223 = _1221 * 6.283185482025146484375;
        float _1225 = sin(_1223);
        float _1227 = _1221 * 6.283185482025146484375;
        float _1229 = cos(_1227);
        float _1231 = fma(_1225, _1215, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1233 = _1217 * _1231;
        float _1235 = _1229 + (-1.0);
        float _1237 = fma(_1101, _1233, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1239 = fma(_1105, _1233, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1241 = _1235 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1243 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1245 = _1237 + _1243;
        float _1247 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1249 = _1239 + _1247;
        float _1251 = fma(_1109, _1229, _1241);
        float _1253 = _1245 * _1245;
        float _1255 = _1249 * _1249;
        _1207 = _1251;
        _1193 = _1253;
        _1189 = _1255;
        _1197 = _1237;
        _1201 = _1239;
    }
    float _1257 = _1207;
    float _1259 = _1193;
    float _1261 = _1189;
    float _1263 = _1197;
    float _1265 = _1201;
    float _1267 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1269 = _1257 + _1267;
    float _1271 = -_1171;
    float _1273 = _1271 + 0.5;
    float _1275 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1277 = _1167 + 0.5;
    float _1279 = fma(_1269, _1269, _1259);
    float _1281 = _1179 + 0.5;
    float _1283 = _1273 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1285 = _1277 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1287 = _1279 + _1261;
    float _1289 = _1281 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1291 = _1283 * _1131;
    float _1293 = -_1175;
    float _1295 = _1293 + 0.5;
    float _1297 = _1289 * _1145;
    float _1299 = sqrt(_1287);
    float _1301 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1303 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1305 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1307 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1309 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1311 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1313 = _1295 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1315 = _1285 * _1097;
    float _1317 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1319 = _1301 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1321 = _1303 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1323 = _1305 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1325 = _1307 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1327 = _1309 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1329 = _1311 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1331 = _1313 * _1275;
    out.m_58.x = _1319;
    out.m_58.y = _1321;
    out.m_58.z = _1323;
    out.m_58.w = _1317;
    bool _1333 = _1299 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1335 = isnan(_1299);
    bool _1337 = _1333 || _1335;
    bool _1339 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1341 = _1337 || _1339;
    out.m_60.x = _1325;
    out.m_60.y = _1327;
    out.m_60.z = _1329;
    out.m_62.x = _1315;
    out.m_62.y = _1291;
    out.m_62.z = _1297;
    out.m_62.w = _1331;
    float _1343 = _1313;
    float _1345 = _1331;
    float _1347 = _1329;
    float _1349 = _1319;
    if (!_1341)
    {
        _1343 = 1.0;
    }
    float _1351 = _1343;
    bool _1353 = !_1341;
    float _1355 = _1351;
    if (!_1353)
    {
        bool _1357 = _1299 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1359 = isnan(_1299);
        bool _1361 = _1357 || _1359;
        bool _1363 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1365 = _1361 || _1363;
        if (!_1365)
        {
            float _1367 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1369 = _1299 + _1367;
            float _1371 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1373 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1371;
            float _1375 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1377 = _1375 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1379 = 1.0 / _1373;
            float _1381 = _1369 * _1379;
            float _1383 = fma(_1381, _1377, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1355 = _1383;
            _1385 = true;
        }
        else
        {
            bool _1387 = _1299 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1389 = isnan(_1299);
            bool _1391 = _1387 || _1389;
            bool _1393 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1395 = _1391 || _1393;
            if (!_1395)
            {
                float _1397 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1399 = _1299 + _1397;
                float _1401 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1403 = _1401 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1405 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1407 = _1405 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1409 = 1.0 / _1403;
                float _1411 = _1399 * _1409;
                float _1413 = fma(_1411, _1407, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1355 = _1413;
                _1385 = true;
            }
            else
            {
                _1355 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1385 = false;
    float _1415 = _1355;
    float _1417 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1419 = _1257 + _1417;
    float _1421 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1423 = _1263 + _1421;
    float _1425 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1427 = _1265 + _1425;
    float _1429 = fma(_1419, _1415, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1431 = fma(_1423, _1415, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1433 = fma(_1427, _1415, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1435 = -_813;
    float _1437 = fma(_1435, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1429);
    float _1439 = -_815;
    float _1441 = fma(_1439, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1431);
    float _1443 = -_833;
    float _1445 = fma(_1443, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1433);
    float _1447 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1449 = _1437 + _1447;
    float _1451 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1453 = _1441 + _1451;
    float _1455 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1457 = _1445 + _1455;
    float _1459 = _1449 * _1449;
    float _1461 = fma(_1453, _1453, _1459);
    float _1463 = fma(_1457, _1457, _1461);
    float _1465 = rsqrt(_1463);
    float _1467 = _1465 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1469 = _1453 * _1467;
    float _1471 = _1457 * _1467;
    float _1473 = _1469 * _1469;
    float _1475 = _1471 * _1471;
    float _1477 = _1473 + _1475;
    float _1479 = sqrt(_1477);
    bool _1481 = _1479 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1483 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1485 = _1479 + _1483;
    float _1487 = _1465;
    float _1489 = _1477;
    float _1491 = _1485;
    float _1493 = _1449;
    if (_1481)
    {
        float _1495 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1487 = _1495;
    }
    float _1497 = _1487;
    if (_1481)
    {
        float _1499 = rsqrt(_1477);
        _1489 = _1499;
    }
    float _1501 = _1489;
    float _1503 = _1501;
    if (_1481)
    {
        float _1505 = _1485 * _1497;
        _1491 = _1505;
    }
    float _1507 = _1491;
    if (_1481)
    {
        float _1509 = _1507 * 0.15915493667125701904296875;
        _1345 = _1509;
    }
    float _1511 = _1345;
    float _1513 = _1457;
    if (_1481)
    {
        float _1515 = _1511 * 6.283185482025146484375;
        float _1517 = sin(_1515);
        _1513 = _1517;
    }
    float _1519 = _1513;
    float _1521 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1523 = precise::max(0.0, _1521);
    float _1525 = _1497;
    float _1527 = _1523;
    if (_1481)
    {
        float _1529 = _1511 * 6.283185482025146484375;
        float _1531 = cos(_1529);
        _1525 = _1531;
    }
    float _1533 = _1525;
    float _1535 = -_1467;
    float _1537 = -_1523;
    float _1539 = fma(_1449, _1535, _1537);
    if (_1481)
    {
        float _1541 = _1539 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1493 = _1541;
    }
    float _1543 = _1493;
    float _1545 = sqrt(_1463);
    float _1547 = _1543;
    float _1549 = _1519;
    if (_1481)
    {
        float _1551 = fma(_1519, _1543, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1547 = _1551;
    }
    float _1553 = _1547;
    float _1555 = _1553;
    if (!_1481)
    {
        _1549 = _1469;
    }
    float _1557 = _1549;
    float _1559 = _1557;
    float _1561 = _1533;
    if (_1481)
    {
        float _1563 = _1533 + (-1.0);
        _1527 = _1563;
    }
    float _1565 = _1527;
    float _1567 = _1565;
    if (_1481)
    {
        float _1569 = _1501 * _1553;
        _1347 = _1569;
    }
    float _1571 = _1347;
    if (!_1481)
    {
        _1555 = _1539;
    }
    float _1573 = _1555;
    float _1575 = _1573;
    if (_1481)
    {
        float _1577 = _1565 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1349 = _1577;
    }
    float _1579 = _1349;
    if (_1481)
    {
        float _1581 = _1469 * _1571;
        _1559 = _1581;
    }
    float _1583 = _1559;
    if (!_1481)
    {
        _1567 = _1471;
    }
    float _1585 = _1567;
    float _1587 = _1585;
    if (_1481)
    {
        float _1589 = _1471 * _1571;
        _1587 = _1589;
    }
    float _1591 = _1587;
    if (!_1481)
    {
        _1503 = _1473;
    }
    float _1593 = _1503;
    float _1595 = _1593;
    if (_1481)
    {
        float _1597 = fma(_1539, _1533, _1579);
        _1575 = _1597;
    }
    float _1599 = _1575;
    if (_1481)
    {
        float _1601 = _1583 * _1583;
        _1595 = _1601;
    }
    float _1603 = _1595;
    if (!_1481)
    {
        _1561 = _1475;
    }
    float _1605 = _1561;
    float _1607 = _1605;
    if (_1481)
    {
        float _1609 = _1591 * _1591;
        _1607 = _1609;
    }
    float _1611 = _1607;
    float _1613 = fma(_1599, _1599, _1603);
    float _1615 = _1437 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1617 = _1613 + _1611;
    float _1619 = _1437 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1621 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1623 = fma(_1545, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1621);
    float _1625 = precise::clamp(_1623, 0.0, 1.0);
    float _1627 = _1437 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1629 = rsqrt(_1617);
    float _1631 = fma(_1441, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1619);
    float _1633 = -_1625;
    float _1635 = _1633 + 1.0;
    float _1637 = _1437 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1639 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1641 = fma(_1445, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1631);
    float _1643 = fma(_1441, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1627);
    float _1645 = fma(_1441, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1637);
    float _1647 = abs(_1635);
    float _1649 = log2(_1647);
    float _1651 = _1641 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1653 = fma(_1445, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1643);
    float _1655 = fma(_1441, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1615);
    float _1657 = fma(_1445, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1645);
    float _1659 = _1651 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1661 = _1653 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1663 = fma(_1445, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1655);
    float _1665 = _1629 * _1583;
    float _1667 = _1629 * _1599;
    float _1669 = _1657 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1671 = -_1659;
    float _1673 = fma(_1671, _1639, 1.0);
    float _1675 = _1665 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1677 = _1661 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1679 = _1663 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1681 = _1629 * _1591;
    float _1683 = -_1675;
    float _1685 = fma(_1667, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1683);
    float _1687 = fma(_1669, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1677);
    float _1689 = _1649 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1691 = log2(_1673);
    float _1693 = -_1681;
    float _1695 = fma(_1693, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1685);
    float _1697 = fma(_1651, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1687);
    float _1699 = _1661 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1701 = _1661 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1703 = fma(_1695, -0.5, 0.5);
    float _1705 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1697);
    float _1707 = fma(_1695, 0.5, 0.5);
    float _1709 = exp2(_1689);
    float _1711 = fma(_1669, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1699);
    float _1713 = fma(_1669, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1701);
    float _1715 = fma(_1707, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1717 = _1667 + 1.0;
    float _1719 = fma(_1651, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1711);
    float _1721 = fma(_1651, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1713);
    float _1723 = fma(_1707, _1715, -0.212114393711090087890625);
    float _1725 = 1.0 / _1705;
    float _1727 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1719);
    float _1729 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1721);
    float _1731 = _1691 * 0.693147182464599609375;
    float _1733 = fma(_1707, _1723, 1.570728778839111328125);
    float _1735 = sqrt(_1703);
    float _1737 = -_1667;
    float _1739 = fma(_1709, _1717, _1737);
    float _1741 = _1731 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1743 = fma(_1739, 0.5, 0.5);
    float _1745 = _1727 * _1725;
    float _1747 = _1729 * _1725;
    float _1749 = fma(_1745, 0.5, 0.5);
    float _1751 = fma(_1747, -0.5, 0.5);
    float _1753 = _1735 * 0.636619746685028076171875;
    float _1755 = -_1733;
    float _1757 = fma(_1753, _1755, 1.0);
    float3 _4771 = float3(_1749, _1751, _1741);
    float _1759 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4771, float3(0.0), isnan(_4771)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4771, float3(0.0), isnan(_4771)), level(0.0)).x;
    float3 _4782 = float3(_1749, _1751, _1741);
    float4 _1762 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4782, float3(0.0), isnan(_4782)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4782, float3(0.0), isnan(_4782)), level(0.0)).xyzw;
    float _1764 = _1762.x;
    float _1766 = _1762.y;
    float _1768 = _1762.z;
    float _1770 = _1762.w;
    float2 _4799 = float2(_1757, _1743);
    float3 _1774 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4799, float2(0.0), isnan(_4799)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4799, float2(0.0), isnan(_4799)), level(0.0)).xyz;
    float _1776 = _1774.x;
    float _1778 = _1774.y;
    float _1780 = _1774.z;
    float _1782 = -_813;
    float _1784 = fma(_1782, (*spvDescriptorSet0.vp_c9)._m0[18].w, _647);
    float _1786 = -_815;
    float _1788 = fma(_1786, (*spvDescriptorSet0.vp_c9)._m0[18].w, _699);
    float _1790 = -_833;
    float _1792 = fma(_1790, (*spvDescriptorSet0.vp_c9)._m0[18].w, _703);
    float _1794 = _1649 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1796 = _1784 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1798 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1796);
    float _1800 = exp2(_1794);
    float _1802 = fma(_1792, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1798);
    float _1804 = _1784 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1806 = _1802 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1808 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1804);
    bool _1810 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1812 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1814 = _1810 || _1812;
    bool _1816 = isnan(0.5);
    bool _1818 = _1814 || _1816;
    float _1820 = 1.0 / _1806;
    float _1822 = fma(_1792, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1808);
    float _1824 = _1661 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1826 = _1822 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1828 = fma(_1669, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1824);
    float _1830 = _1826 + _1806;
    float _1832 = fma(_1651, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1828);
    float _1834 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1832);
    float _1836 = _1830 * _1820;
    float _1838 = _1836 * 0.5;
    float _1840 = _1820;
    if (_1818)
    {
        _1840 = 1.0;
    }
    float _1842 = _1840;
    float _1844 = _1842;
    if (!_1818)
    {
        float _1846 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1848 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1850 = fma(_1838, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1848);
        float _1852 = _1846 * 0.15915493667125701904296875;
        float _1854 = _1852 * 6.283185482025146484375;
        float _1856 = cos(_1854);
        float _1858 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1860 = _1858 * 0.15915493667125701904296875;
        float _1862 = _1852 * 6.283185482025146484375;
        float _1864 = sin(_1862);
        float _1866 = 1.0 / _1856;
        float _1868 = _1860 * 6.283185482025146484375;
        float _1870 = cos(_1868);
        float _1872 = _1864 * _1866;
        float _1874 = 1.0 / _1850;
        float _1876 = _1870 * _1872;
        float _1878 = _1860 * 6.283185482025146484375;
        float _1880 = sin(_1878);
        float _1882 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1884 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1882;
        float _1886 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1888 = _1874 * _1886;
        float _1890 = 1.0 / _1876;
        float _1892 = 1.0 / _1884;
        float _1894 = _1880 * _1890;
        float _1896 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1898 = fma(_1894, _1888, _1896);
        float _1900 = _1898 * _1892;
        float _1902 = precise::clamp(_1900, 0.0, 1.0);
        float _1904 = -_1902;
        float _1906 = _1904 + 1.0;
        _1844 = _1906;
    }
    float _1908 = _1844;
    float _1910 = -_1800;
    float _1912 = _1910 + 1.0;
    bool _1914 = _1908 > 0.0;
    bool _1916 = isnan(_1908);
    bool _1918 = _1914 || _1916;
    bool _1920 = isnan(0.0);
    bool _1922 = _1918 || _1920;
    float _1924 = _1705 * 0.5;
    float _1926 = _1908 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1928 = _1912 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1930 = _1834 + _1705;
    float _1932 = _1727 + _1705;
    float _1934 = fma(_1729, -0.5, _1924);
    float _1936 = _1928 * _1759;
    out.gl_Position.x = _1727;
    out.gl_Position.y = _1729;
    out.gl_Position.z = _1834;
    out.gl_Position.w = _1705;
    float _1938 = _1930 * 0.5;
    float _1940 = _1770 * _1936;
    float _1942 = _1780 * _1936;
    float _1944 = -_1928;
    float _1946 = _1944 + 1.0;
    float _1948 = _1932 * 0.5;
    float _1950 = fma(_1776, _1940, _1764);
    float _1952 = fma(_1778, _1940, _1766);
    float _1954 = _1926 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1956 = _1770 * _1946;
    float _1958 = fma(_1770, _1942, _1768);
    out.m_64.x = _1948;
    out.m_64.y = _1934;
    out.m_64.z = _1938;
    out.m_64.w = _1705;
    out.m_47.x = _1954;
    out.m_66.x = _1950;
    out.m_66.y = _1952;
    out.m_66.z = _1958;
    out.m_66.w = _1956;
    if (_1922)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _1960 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1960;
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
    bool _1385 = false;
    bool _609 = false;
    bool _459 = false;
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
    float _95 = _93;
    if (!_89)
    {
        out.m_47.x = 0.0;
    }
    int _97 = 0;
    if (!_89)
    {
        float _99 = _93 * 5.0;
        _97 = as_type<int>(_99);
    }
    int _101 = _97;
    int _103 = _101;
    if (!_89)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2017 = as_type<float>(_101);
        out.gl_Position.z = _2017;
    }
    if (!_89)
    {
        return out;
    }
    float _105 = in.m_49.w;
    bool _107 = _105 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _109 = isnan(_105);
    bool _111 = _107 || _109;
    bool _113 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _115 = _111 || _113;
    float _117 = -_105;
    float _119 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _121 = 0.0;
    float _123 = 0.0;
    if (_115)
    {
        float _125 = float(_85);
        _95 = _125;
    }
    float _127 = _95;
    bool _129 = _119 >= _127;
    bool _131 = !_115;
    bool _133 = _129 || _131;
    float _135 = _127;
    if (_133)
    {
        _135 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _137 = _135;
    if (_133)
    {
        out.m_47.x = 0.0;
    }
    if (_133)
    {
        float _139 = _137 * 5.0;
        _103 = as_type<int>(_139);
    }
    int _141 = _103;
    float _143 = as_type<float>(_141);
    if (_133)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2088 = as_type<float>(_141);
        out.gl_Position.z = _2088;
    }
    if (_133)
    {
        return out;
    }
    float _145 = in.m_49.x;
    float _147 = in.m_49.y;
    float _149 = in.m_49.z;
    float _151 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
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
        _143 = _167;
    }
    float _169 = _143;
    float _171 = 0.0;
    float _173 = _169;
    if (!_161)
    {
        float _175 = _119 * _119;
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
        _121 = _207;
        _187 = _217;
        _123 = _205;
    }
    float _219 = _121;
    float _221 = _187;
    float _223 = _123;
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
        _257 = _119;
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
        float _285 = _119 * _277;
        float _287 = 1.0 / _281;
        float _289 = _283 * 0.693147182464599609375;
        float _291 = exp2(_285);
        float _293 = 1.0 / _289;
        float _295 = _291 + (-1.0);
        float _297 = -_295;
        float _299 = fma(_297, _293, _119);
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
        float _319 = _119 * _311;
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
    float _363 = in.m_51.w;
    float _365 = -_355;
    float _367 = _353 + _365;
    float _369 = _351 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _371 = fma(_359, _359, _361);
    float _373 = _351 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _375 = _351 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _377 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[4].x, _369);
    float _379 = fma(_367, _367, _371);
    float _381 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[5].x, _373);
    float _383 = in.m_44.x;
    float _385 = in.m_44.y;
    float _387 = in.m_44.z;
    float _389 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[6].x, _375);
    float _391 = fma(_367, (*spvDescriptorSet0.vp_c10)._m0[4].z, _377);
    float _393 = sqrt(_379);
    float _395 = fma(_367, (*spvDescriptorSet0.vp_c10)._m0[5].z, _381);
    float _397 = fma(_367, (*spvDescriptorSet0.vp_c10)._m0[6].z, _389);
    bool _399 = _393 >= 9.9999999747524270787835121154785e-07;
    bool _401 = isnan(_393);
    bool _403 = _399 || _401;
    bool _405 = isnan(9.9999999747524270787835121154785e-07);
    bool _407 = _403 || _405;
    float _409 = fma(_345, _363, _383);
    float _411 = fma(_333, _363, _385);
    float _413 = fma(_353, _363, _387);
    float _415 = _395;
    float _417 = _391;
    float _419 = _397;
    if (!_407)
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
                float _479 = _385 * _385;
                float _481 = fma(_383, _383, _479);
                float _483 = fma(_387, _387, _481);
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
                    float _513 = _385 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _515 = _385 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _517 = _385 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _519 = fma(_383, (*spvDescriptorSet0.vp_c10)._m0[5].x, _513);
                    float _521 = fma(_383, (*spvDescriptorSet0.vp_c10)._m0[4].x, _515);
                    float _523 = fma(_383, (*spvDescriptorSet0.vp_c10)._m0[6].x, _517);
                    float _525 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[5].z, _519);
                    float _527 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[4].z, _521);
                    float _529 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[6].z, _523);
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
    bool _587 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _589 = !_587;
    float _607;
    if (!_589)
    {
        float _591 = in.m_53.x;
        float _593 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _595 = _591 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _597 = fma(_595, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _599 = _597 * _593;
        float _601 = floor(_599);
        float _603 = -_601;
        float _605 = _599 + _603;
        _607 = _605;
        _609 = true;
    }
    else
    {
        float _611 = float(_85);
        float _613 = 1.0 / _611;
        float _615 = _119 * _613;
        _607 = _615;
    }
    _609 = false;
    float _617 = _607;
    float _619 = as_type<float>(int(gl_VertexIndex));
    float _621 = _411 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _623 = 0.0 + (*spvDescriptorSet0.vp_c7)._m0[0].x;
    float _625 = precise::clamp(_623, 0.0, 1.0);
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _629 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _627;
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _633 = _631 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _635 = fma(_409, (*spvDescriptorSet0.vp_c10)._m0[5].x, _621);
    float _637 = fma(_625, -0.64999997615814208984375, 1.0);
    float _639 = 1.0 / _629;
    float _641 = _581 * _581;
    float _643 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[5].z, _635);
    float _645 = fma(_583, _583, _641);
    float _647 = _643 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _649 = 1.0 / _633;
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _653 = _617 + _651;
    float _655 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _657 = _647 + _655;
    float _659 = fma(_585, _585, _645);
    int _661 = as_type<int>(_619) & 1;
    bool _663 = _661 != 0;
    int _665 = as_type<int>(_619) & 2;
    bool _667 = _665 != 0;
    float _669 = _411 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _671 = _411 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _673 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _675 = _617 + _673;
    float _677 = _653 * _639;
    float _679 = fma(_409, (*spvDescriptorSet0.vp_c10)._m0[4].x, _669);
    float _681 = fma(_409, (*spvDescriptorSet0.vp_c10)._m0[6].x, _671);
    float _683 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _685 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _683;
    float _687 = rsqrt(_659);
    float _689 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[4].z, _679);
    float _691 = _675 * _649;
    float _693 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[6].z, _681);
    float _695 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _697 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _695;
    float _699 = _689 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _701 = _657 * _657;
    float _703 = _693 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _705 = fma(_685, _677, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _707 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _709 = _699 + _707;
    float _711 = fma(_697, _677, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _713 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _715 = _703 + _713;
    bool _717 = _617 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _719 = isnan(_617);
    bool _721 = _717 || _719;
    bool _723 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _725 = _721 || _723;
    float _727 = float(_725);
    float _729 = fma(_709, _709, _701);
    bool _731 = _617 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _733 = isnan(_617);
    bool _735 = _731 || _733;
    bool _737 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _739 = _735 || _737;
    float _741 = float(_739);
    bool _743 = _617 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _745 = isnan(_617);
    bool _747 = _743 || _745;
    bool _749 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _751 = _747 || _749;
    float _753 = float(_751);
    float _755 = fma(_715, _715, _729);
    float _757 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _759 = _757 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _761 = -_727;
    float _763 = _761 + 1.0;
    float _765 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _767 = _765 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _769 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _771 = (*spvDescriptorSet0.vp_c10)._m0[9].w + _769;
    float _773 = fma(_759, _691, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _775 = rsqrt(_755);
    float _777 = _741 * _763;
    float _779 = fma(_767, _691, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _781 = -_741;
    float _783 = _781 + 1.0;
    float _785 = _687 * _585;
    float _787 = _705 * _777;
    float _789 = _711 * _777;
    float _791 = -_753;
    float _793 = _791 + 1.0;
    float _795 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _797 = (*spvDescriptorSet0.vp_c10)._m0[8].w + _795;
    float _799 = _771 * _771;
    float _801 = _687 * _583;
    float _803 = _687 * _581;
    float _805 = fma(_783, (*spvDescriptorSet0.vp_c9)._m0[143].y, _789);
    float _807 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _809 = _785 * _807;
    float _811 = _727 * _793;
    float _813 = _657 * _775;
    float _815 = _709 * _775;
    float _817 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _819 = (*spvDescriptorSet0.vp_c10)._m0[10].w + _817;
    float _821 = fma(_797, _797, _799);
    float _823 = -_813;
    float _825 = fma(_823, (*spvDescriptorSet0.vp_c9)._m0[18].w, _657);
    float _827 = -_815;
    float _829 = fma(_827, (*spvDescriptorSet0.vp_c9)._m0[18].w, _709);
    float _831 = fma(_783, (*spvDescriptorSet0.vp_c9)._m0[143].x, _787);
    float _833 = _715 * _775;
    float _835 = _825 * _825;
    float _837 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _839 = -_809;
    float _841 = fma(_801, _837, _839);
    float _843 = fma(_819, _819, _821);
    float _845 = -_833;
    float _847 = fma(_845, (*spvDescriptorSet0.vp_c9)._m0[18].w, _715);
    float _849 = fma(_829, _829, _835);
    float _851 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _853 = _803 * _851;
    float _855 = in.m_51.x;
    float _857 = in.m_51.y;
    float _859 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _861 = _801 * _859;
    float _863 = _841 * _841;
    float _865 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _867 = -_853;
    float _869 = fma(_785, _865, _867);
    float _871 = fma(_847, _847, _849);
    float _873 = sqrt(_843);
    float _875 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _877 = -_861;
    float _879 = fma(_803, _875, _877);
    float _881 = fma(_869, _869, _863);
    float _883 = fma(_779, _811, _805);
    float _885 = fma(_773, _811, _831);
    float _887 = fma(_879, _879, _881);
    float _889 = fma(_753, (*spvDescriptorSet0.vp_c9)._m0[145].y, _883);
    float _891 = rsqrt(_843);
    float _893 = fma(_753, (*spvDescriptorSet0.vp_c9)._m0[145].x, _885);
    float _895 = sqrt(_871);
    float _897 = _873 * 0.066666670143604278564453125;
    float _899 = _889 * _857;
    bool _901 = !_667;
    float _903 = _901 ? (-0.5) : 0.5;
    float _905 = _893 * _855;
    float _907 = precise::max(_897, 1.0);
    float _909 = _899 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _911 = rsqrt(_887);
    float _913 = _891 * (-0.20000000298023223876953125);
    float _915 = _905 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _917 = precise::min(_907, 2.0);
    float _919 = fma(_771, _913, (*spvDescriptorSet0.vp_c10)._m0[9].w);
    float _921 = fma(_797, _913, (*spvDescriptorSet0.vp_c10)._m0[8].w);
    bool _923 = !_663;
    float _925 = _923 ? (-0.5) : 0.5;
    float _927 = _775 * _895;
    float _929 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _903);
    float _931 = fma(_819, _913, (*spvDescriptorSet0.vp_c10)._m0[10].w);
    float _933 = _917 * _637;
    float _935 = _909 * _927;
    float _937 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _925);
    float _939 = _915 * _927;
    float _941 = _927 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _943 = _941 * 0.5;
    float _945 = _869 * _911;
    float _947 = _935 * _929;
    float _949 = _879 * _911;
    float _951 = _841 * _911;
    float _953 = _939 * _937;
    float _955 = _785 * _945;
    float _957 = _947 * _803;
    float _959 = _803 * _949;
    float _961 = _947 * _801;
    float _963 = -_955;
    float _965 = fma(_801, _949, _963);
    float _967 = fma(_953, _951, _957);
    float _969 = _801 * _951;
    float _971 = -_959;
    float _973 = fma(_785, _951, _971);
    float _975 = _947 * _785;
    float _977 = fma(_953, _945, _961);
    float _979 = fma(_943, _965, _967);
    float _981 = -_969;
    float _983 = fma(_803, _945, _981);
    float _985 = fma(_953, _949, _975);
    float _987 = fma(_943, _973, _977);
    float _989 = _647 + _979;
    float _991 = -_919;
    float _993 = _991 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _995 = fma(_943, _983, _985);
    float _997 = _699 + _987;
    float _999 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1001 = _989 + _999;
    float _1003 = _993 * _993;
    float _1005 = _703 + _995;
    float _1007 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1009 = _997 + _1007;
    float _1011 = fma(_1001, _933, (*spvDescriptorSet0.vp_c10)._m0[9].w);
    float _1013 = -_921;
    float _1015 = _1013 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1017 = fma(_1009, _933, (*spvDescriptorSet0.vp_c10)._m0[8].w);
    float _1019 = -_1011;
    float _1021 = _1019 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1023 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1025 = _1005 + _1023;
    float _1027 = fma(_1015, _1015, _1003);
    float _1029 = -_1017;
    float _1031 = _1029 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1033 = _1021 * _1021;
    float _1035 = fma(_1025, _933, (*spvDescriptorSet0.vp_c10)._m0[10].w);
    float _1037 = -_931;
    float _1039 = _1037 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1041 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1043 = _919 + _1041;
    float _1045 = fma(_1031, _1031, _1033);
    float _1047 = -_1035;
    float _1049 = _1047 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1051 = fma(_1039, _1039, _1027);
    float _1053 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1055 = _921 + _1053;
    float _1057 = _1043 * _1043;
    float _1059 = fma(_1049, _1049, _1045);
    float _1061 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1063 = _931 + _1061;
    float _1065 = sqrt(_1051);
    float _1067 = fma(_1055, _1055, _1057);
    float _1069 = fma(_1063, _1063, _1067);
    float _1071 = sqrt(_1059);
    float _1073 = rsqrt(_1069);
    float _1075 = -_1065;
    float _1077 = _1071 + _1075;
    float _1079 = _1073 * _1077;
    float _1081 = in.m_53.x;
    float _1083 = in.m_53.y;
    float _1085 = in.m_53.z;
    float _1087 = in.m_53.w;
    float _1089 = -_1079;
    float _1091 = fma(_1055, _1089, _1017);
    float _1093 = -_1079;
    float _1095 = fma(_1063, _1093, _1035);
    float _1097 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1099 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1101 = _1091 + _1099;
    float _1103 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1105 = _1095 + _1103;
    float _1107 = -_1079;
    float _1109 = fma(_1043, _1107, _1011);
    int _1111 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1113 = _1111 != 0;
    float _1115 = _1101 * _1101;
    float _1117 = _1105 * _1105;
    int _1119 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1121 = _1119 != 0;
    float _1123 = _1115 + _1117;
    float _1125 = sqrt(_1123);
    bool _1127 = _1083 > 0.5;
    bool _1129 = _1087 > 0.5;
    float _1131 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1133 = _1081 > 0.5;
    bool _1135 = _1085 > 0.5;
    float _1137 = -_925;
    int _1139 = _1133 ? as_type<int>(_1137) : as_type<int>(_925);
    float _1141 = -_903;
    int _1143 = _1127 ? as_type<int>(_1141) : as_type<int>(_903);
    float _1145 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1147 = _1125 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1149 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1151 = _1149 != 0;
    float _1153 = -_903;
    int _1155 = _1129 ? as_type<int>(_1153) : as_type<int>(_903);
    int _1157 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1159 = _1157 != 0;
    float _1161 = -_925;
    int _1163 = _1135 ? as_type<int>(_1161) : as_type<int>(_925);
    bool _1165 = !_1113;
    float _1167 = _1165 ? _925 : as_type<float>(_1139);
    bool _1169 = !_1121;
    float _1171 = _1169 ? _903 : as_type<float>(_1143);
    bool _1173 = !_1151;
    float _1175 = _1173 ? _903 : as_type<float>(_1155);
    bool _1177 = !_1159;
    float _1179 = _1177 ? _925 : as_type<float>(_1163);
    float _1181 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    float _1183 = _903;
    float _1185 = _1011;
    float _1187 = _1043;
    float _1189 = _1117;
    if (!_1147)
    {
        _1181 = _1115;
    }
    float _1191 = _1181;
    float _1193 = _1191;
    if (!_1147)
    {
        _1183 = _1091;
    }
    float _1195 = _1183;
    float _1197 = _1195;
    if (!_1147)
    {
        _1185 = _1095;
    }
    float _1199 = _1185;
    float _1201 = _1199;
    if (!_1147)
    {
        _1187 = _1109;
    }
    float _1203 = _1187;
    bool _1205 = !_1147;
    float _1207 = _1203;
    if (!_1205)
    {
        float _1209 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1211 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1213 = _1125 + _1211;
        float _1215 = _1109 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1217 = rsqrt(_1123);
        float _1219 = _1213 * _1209;
        float _1221 = _1219 * 0.15915493667125701904296875;
        float _1223 = _1221 * 6.283185482025146484375;
        float _1225 = sin(_1223);
        float _1227 = _1221 * 6.283185482025146484375;
        float _1229 = cos(_1227);
        float _1231 = fma(_1225, _1215, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1233 = _1217 * _1231;
        float _1235 = _1229 + (-1.0);
        float _1237 = fma(_1101, _1233, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1239 = fma(_1105, _1233, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1241 = _1235 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1243 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1245 = _1237 + _1243;
        float _1247 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1249 = _1239 + _1247;
        float _1251 = fma(_1109, _1229, _1241);
        float _1253 = _1245 * _1245;
        float _1255 = _1249 * _1249;
        _1207 = _1251;
        _1193 = _1253;
        _1189 = _1255;
        _1197 = _1237;
        _1201 = _1239;
    }
    float _1257 = _1207;
    float _1259 = _1193;
    float _1261 = _1189;
    float _1263 = _1197;
    float _1265 = _1201;
    float _1267 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1269 = _1257 + _1267;
    float _1271 = -_1171;
    float _1273 = _1271 + 0.5;
    float _1275 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1277 = _1167 + 0.5;
    float _1279 = fma(_1269, _1269, _1259);
    float _1281 = _1179 + 0.5;
    float _1283 = _1273 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1285 = _1277 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1287 = _1279 + _1261;
    float _1289 = _1281 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1291 = _1283 * _1131;
    float _1293 = -_1175;
    float _1295 = _1293 + 0.5;
    float _1297 = _1289 * _1145;
    float _1299 = sqrt(_1287);
    float _1301 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1303 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1305 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1307 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1309 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1311 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1313 = _1295 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1315 = _1285 * _1097;
    float _1317 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1319 = _1301 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1321 = _1303 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1323 = _1305 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1325 = _1307 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1327 = _1309 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1329 = _1311 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1331 = _1313 * _1275;
    out.m_58.x = _1319;
    out.m_58.y = _1321;
    out.m_58.z = _1323;
    out.m_58.w = _1317;
    bool _1333 = _1299 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1335 = isnan(_1299);
    bool _1337 = _1333 || _1335;
    bool _1339 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1341 = _1337 || _1339;
    out.m_60.x = _1325;
    out.m_60.y = _1327;
    out.m_60.z = _1329;
    out.m_62.x = _1315;
    out.m_62.y = _1291;
    out.m_62.z = _1297;
    out.m_62.w = _1331;
    float _1343 = _1313;
    float _1345 = _1331;
    float _1347 = _1329;
    float _1349 = _1319;
    if (!_1341)
    {
        _1343 = 1.0;
    }
    float _1351 = _1343;
    bool _1353 = !_1341;
    float _1355 = _1351;
    if (!_1353)
    {
        bool _1357 = _1299 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1359 = isnan(_1299);
        bool _1361 = _1357 || _1359;
        bool _1363 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1365 = _1361 || _1363;
        if (!_1365)
        {
            float _1367 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1369 = _1299 + _1367;
            float _1371 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1373 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1371;
            float _1375 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1377 = _1375 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1379 = 1.0 / _1373;
            float _1381 = _1369 * _1379;
            float _1383 = fma(_1381, _1377, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1355 = _1383;
            _1385 = true;
        }
        else
        {
            bool _1387 = _1299 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1389 = isnan(_1299);
            bool _1391 = _1387 || _1389;
            bool _1393 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1395 = _1391 || _1393;
            if (!_1395)
            {
                float _1397 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1399 = _1299 + _1397;
                float _1401 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1403 = _1401 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1405 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1407 = _1405 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1409 = 1.0 / _1403;
                float _1411 = _1399 * _1409;
                float _1413 = fma(_1411, _1407, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1355 = _1413;
                _1385 = true;
            }
            else
            {
                _1355 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1385 = false;
    float _1415 = _1355;
    float _1417 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1419 = _1257 + _1417;
    float _1421 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1423 = _1263 + _1421;
    float _1425 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1427 = _1265 + _1425;
    float _1429 = fma(_1419, _1415, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1431 = fma(_1423, _1415, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1433 = fma(_1427, _1415, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1435 = -_813;
    float _1437 = fma(_1435, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1429);
    float _1439 = -_815;
    float _1441 = fma(_1439, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1431);
    float _1443 = -_833;
    float _1445 = fma(_1443, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1433);
    float _1447 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1449 = _1437 + _1447;
    float _1451 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1453 = _1441 + _1451;
    float _1455 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1457 = _1445 + _1455;
    float _1459 = _1449 * _1449;
    float _1461 = fma(_1453, _1453, _1459);
    float _1463 = fma(_1457, _1457, _1461);
    float _1465 = rsqrt(_1463);
    float _1467 = _1465 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1469 = _1453 * _1467;
    float _1471 = _1457 * _1467;
    float _1473 = _1469 * _1469;
    float _1475 = _1471 * _1471;
    float _1477 = _1473 + _1475;
    float _1479 = sqrt(_1477);
    bool _1481 = _1479 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1483 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1485 = _1479 + _1483;
    float _1487 = _1465;
    float _1489 = _1477;
    float _1491 = _1485;
    float _1493 = _1449;
    if (_1481)
    {
        float _1495 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1487 = _1495;
    }
    float _1497 = _1487;
    if (_1481)
    {
        float _1499 = rsqrt(_1477);
        _1489 = _1499;
    }
    float _1501 = _1489;
    float _1503 = _1501;
    if (_1481)
    {
        float _1505 = _1485 * _1497;
        _1491 = _1505;
    }
    float _1507 = _1491;
    if (_1481)
    {
        float _1509 = _1507 * 0.15915493667125701904296875;
        _1345 = _1509;
    }
    float _1511 = _1345;
    float _1513 = _1457;
    if (_1481)
    {
        float _1515 = _1511 * 6.283185482025146484375;
        float _1517 = sin(_1515);
        _1513 = _1517;
    }
    float _1519 = _1513;
    float _1521 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1523 = precise::max(0.0, _1521);
    float _1525 = _1497;
    float _1527 = _1523;
    if (_1481)
    {
        float _1529 = _1511 * 6.283185482025146484375;
        float _1531 = cos(_1529);
        _1525 = _1531;
    }
    float _1533 = _1525;
    float _1535 = -_1467;
    float _1537 = -_1523;
    float _1539 = fma(_1449, _1535, _1537);
    if (_1481)
    {
        float _1541 = _1539 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1493 = _1541;
    }
    float _1543 = _1493;
    float _1545 = sqrt(_1463);
    float _1547 = _1543;
    float _1549 = _1519;
    if (_1481)
    {
        float _1551 = fma(_1519, _1543, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1547 = _1551;
    }
    float _1553 = _1547;
    float _1555 = _1553;
    if (!_1481)
    {
        _1549 = _1469;
    }
    float _1557 = _1549;
    float _1559 = _1557;
    float _1561 = _1533;
    if (_1481)
    {
        float _1563 = _1533 + (-1.0);
        _1527 = _1563;
    }
    float _1565 = _1527;
    float _1567 = _1565;
    if (_1481)
    {
        float _1569 = _1501 * _1553;
        _1347 = _1569;
    }
    float _1571 = _1347;
    if (!_1481)
    {
        _1555 = _1539;
    }
    float _1573 = _1555;
    float _1575 = _1573;
    if (_1481)
    {
        float _1577 = _1565 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1349 = _1577;
    }
    float _1579 = _1349;
    if (_1481)
    {
        float _1581 = _1469 * _1571;
        _1559 = _1581;
    }
    float _1583 = _1559;
    if (!_1481)
    {
        _1567 = _1471;
    }
    float _1585 = _1567;
    float _1587 = _1585;
    if (_1481)
    {
        float _1589 = _1471 * _1571;
        _1587 = _1589;
    }
    float _1591 = _1587;
    if (!_1481)
    {
        _1503 = _1473;
    }
    float _1593 = _1503;
    float _1595 = _1593;
    if (_1481)
    {
        float _1597 = fma(_1539, _1533, _1579);
        _1575 = _1597;
    }
    float _1599 = _1575;
    if (_1481)
    {
        float _1601 = _1583 * _1583;
        _1595 = _1601;
    }
    float _1603 = _1595;
    if (!_1481)
    {
        _1561 = _1475;
    }
    float _1605 = _1561;
    float _1607 = _1605;
    if (_1481)
    {
        float _1609 = _1591 * _1591;
        _1607 = _1609;
    }
    float _1611 = _1607;
    float _1613 = fma(_1599, _1599, _1603);
    float _1615 = _1437 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1617 = _1613 + _1611;
    float _1619 = _1437 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1621 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1623 = fma(_1545, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1621);
    float _1625 = precise::clamp(_1623, 0.0, 1.0);
    float _1627 = _1437 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1629 = rsqrt(_1617);
    float _1631 = fma(_1441, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1619);
    float _1633 = -_1625;
    float _1635 = _1633 + 1.0;
    float _1637 = _1437 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1639 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1641 = fma(_1445, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1631);
    float _1643 = fma(_1441, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1627);
    float _1645 = fma(_1441, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1637);
    float _1647 = abs(_1635);
    float _1649 = log2(_1647);
    float _1651 = _1641 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1653 = fma(_1445, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1643);
    float _1655 = fma(_1441, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1615);
    float _1657 = fma(_1445, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1645);
    float _1659 = _1651 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1661 = _1653 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1663 = fma(_1445, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1655);
    float _1665 = _1629 * _1583;
    float _1667 = _1629 * _1599;
    float _1669 = _1657 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1671 = -_1659;
    float _1673 = fma(_1671, _1639, 1.0);
    float _1675 = _1665 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1677 = _1661 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1679 = _1663 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1681 = _1629 * _1591;
    float _1683 = -_1675;
    float _1685 = fma(_1667, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1683);
    float _1687 = fma(_1669, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1677);
    float _1689 = _1649 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1691 = log2(_1673);
    float _1693 = -_1681;
    float _1695 = fma(_1693, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1685);
    float _1697 = fma(_1651, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1687);
    float _1699 = _1661 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1701 = _1661 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1703 = fma(_1695, -0.5, 0.5);
    float _1705 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1697);
    float _1707 = fma(_1695, 0.5, 0.5);
    float _1709 = exp2(_1689);
    float _1711 = fma(_1669, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1699);
    float _1713 = fma(_1669, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1701);
    float _1715 = fma(_1707, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1717 = _1667 + 1.0;
    float _1719 = fma(_1651, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1711);
    float _1721 = fma(_1651, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1713);
    float _1723 = fma(_1707, _1715, -0.212114393711090087890625);
    float _1725 = 1.0 / _1705;
    float _1727 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1719);
    float _1729 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1721);
    float _1731 = _1691 * 0.693147182464599609375;
    float _1733 = fma(_1707, _1723, 1.570728778839111328125);
    float _1735 = sqrt(_1703);
    float _1737 = -_1667;
    float _1739 = fma(_1709, _1717, _1737);
    float _1741 = _1731 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1743 = fma(_1739, 0.5, 0.5);
    float _1745 = _1727 * _1725;
    float _1747 = _1729 * _1725;
    float _1749 = fma(_1745, 0.5, 0.5);
    float _1751 = fma(_1747, -0.5, 0.5);
    float _1753 = _1735 * 0.636619746685028076171875;
    float _1755 = -_1733;
    float _1757 = fma(_1753, _1755, 1.0);
    float3 _4771 = float3(_1749, _1751, _1741);
    float _1759 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4771, float3(0.0), isnan(_4771)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4771, float3(0.0), isnan(_4771)), level(0.0)).x;
    float3 _4782 = float3(_1749, _1751, _1741);
    float4 _1762 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4782, float3(0.0), isnan(_4782)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4782, float3(0.0), isnan(_4782)), level(0.0)).xyzw;
    float _1764 = _1762.x;
    float _1766 = _1762.y;
    float _1768 = _1762.z;
    float _1770 = _1762.w;
    float2 _4799 = float2(_1757, _1743);
    float3 _1774 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4799, float2(0.0), isnan(_4799)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4799, float2(0.0), isnan(_4799)), level(0.0)).xyz;
    float _1776 = _1774.x;
    float _1778 = _1774.y;
    float _1780 = _1774.z;
    float _1782 = -_813;
    float _1784 = fma(_1782, (*spvDescriptorSet0.vp_c9)._m0[18].w, _647);
    float _1786 = -_815;
    float _1788 = fma(_1786, (*spvDescriptorSet0.vp_c9)._m0[18].w, _699);
    float _1790 = -_833;
    float _1792 = fma(_1790, (*spvDescriptorSet0.vp_c9)._m0[18].w, _703);
    float _1794 = _1649 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1796 = _1784 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1798 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1796);
    float _1800 = exp2(_1794);
    float _1802 = fma(_1792, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1798);
    float _1804 = _1784 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1806 = _1802 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1808 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1804);
    bool _1810 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1812 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1814 = _1810 || _1812;
    bool _1816 = isnan(0.5);
    bool _1818 = _1814 || _1816;
    float _1820 = 1.0 / _1806;
    float _1822 = fma(_1792, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1808);
    float _1824 = _1661 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1826 = _1822 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1828 = fma(_1669, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1824);
    float _1830 = _1826 + _1806;
    float _1832 = fma(_1651, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1828);
    float _1834 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1832);
    float _1836 = _1830 * _1820;
    float _1838 = _1836 * 0.5;
    float _1840 = _1820;
    if (_1818)
    {
        _1840 = 1.0;
    }
    float _1842 = _1840;
    float _1844 = _1842;
    if (!_1818)
    {
        float _1846 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1848 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1850 = fma(_1838, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1848);
        float _1852 = _1846 * 0.15915493667125701904296875;
        float _1854 = _1852 * 6.283185482025146484375;
        float _1856 = cos(_1854);
        float _1858 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1860 = _1858 * 0.15915493667125701904296875;
        float _1862 = _1852 * 6.283185482025146484375;
        float _1864 = sin(_1862);
        float _1866 = 1.0 / _1856;
        float _1868 = _1860 * 6.283185482025146484375;
        float _1870 = cos(_1868);
        float _1872 = _1864 * _1866;
        float _1874 = 1.0 / _1850;
        float _1876 = _1870 * _1872;
        float _1878 = _1860 * 6.283185482025146484375;
        float _1880 = sin(_1878);
        float _1882 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1884 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1882;
        float _1886 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1888 = _1874 * _1886;
        float _1890 = 1.0 / _1876;
        float _1892 = 1.0 / _1884;
        float _1894 = _1880 * _1890;
        float _1896 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1898 = fma(_1894, _1888, _1896);
        float _1900 = _1898 * _1892;
        float _1902 = precise::clamp(_1900, 0.0, 1.0);
        float _1904 = -_1902;
        float _1906 = _1904 + 1.0;
        _1844 = _1906;
    }
    float _1908 = _1844;
    float _1910 = -_1800;
    float _1912 = _1910 + 1.0;
    bool _1914 = _1908 > 0.0;
    bool _1916 = isnan(_1908);
    bool _1918 = _1914 || _1916;
    bool _1920 = isnan(0.0);
    bool _1922 = _1918 || _1920;
    float _1924 = _1705 * 0.5;
    float _1926 = _1908 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1928 = _1912 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1930 = _1834 + _1705;
    float _1932 = _1727 + _1705;
    float _1934 = fma(_1729, -0.5, _1924);
    float _1936 = _1928 * _1759;
    out.gl_Position.x = _1727;
    out.gl_Position.y = _1729;
    out.gl_Position.z = _1834;
    out.gl_Position.w = _1705;
    float _1938 = _1930 * 0.5;
    float _1940 = _1770 * _1936;
    float _1942 = _1780 * _1936;
    float _1944 = -_1928;
    float _1946 = _1944 + 1.0;
    float _1948 = _1932 * 0.5;
    float _1950 = fma(_1776, _1940, _1764);
    float _1952 = fma(_1778, _1940, _1766);
    float _1954 = _1926 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1956 = _1770 * _1946;
    float _1958 = fma(_1770, _1942, _1768);
    out.m_64.x = _1948;
    out.m_64.y = _1934;
    out.m_64.z = _1938;
    out.m_64.w = _1705;
    out.m_47.x = _1954;
    out.m_66.x = _1950;
    out.m_66.y = _1952;
    out.m_66.z = _1958;
    out.m_66.w = _1956;
    if (_1922)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _1960 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1960;
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
    bool _1385 = false;
    bool _609 = false;
    bool _459 = false;
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
    float _95 = _93;
    if (!_89)
    {
        out.m_47.x = 0.0;
    }
    int _97 = 0;
    if (!_89)
    {
        float _99 = _93 * 5.0;
        _97 = as_type<int>(_99);
    }
    int _101 = _97;
    int _103 = _101;
    if (!_89)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2017 = as_type<float>(_101);
        out.gl_Position.z = _2017;
    }
    if (!_89)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _105 = in.m_49.w;
    bool _107 = _105 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _109 = isnan(_105);
    bool _111 = _107 || _109;
    bool _113 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _115 = _111 || _113;
    float _117 = -_105;
    float _119 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _121 = 0.0;
    float _123 = 0.0;
    if (_115)
    {
        float _125 = float(_85);
        _95 = _125;
    }
    float _127 = _95;
    bool _129 = _119 >= _127;
    bool _131 = !_115;
    bool _133 = _129 || _131;
    float _135 = _127;
    if (_133)
    {
        _135 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _137 = _135;
    if (_133)
    {
        out.m_47.x = 0.0;
    }
    if (_133)
    {
        float _139 = _137 * 5.0;
        _103 = as_type<int>(_139);
    }
    int _141 = _103;
    float _143 = as_type<float>(_141);
    if (_133)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2088 = as_type<float>(_141);
        out.gl_Position.z = _2088;
    }
    if (_133)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _145 = in.m_49.x;
    float _147 = in.m_49.y;
    float _149 = in.m_49.z;
    float _151 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
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
        _143 = _167;
    }
    float _169 = _143;
    float _171 = 0.0;
    float _173 = _169;
    if (!_161)
    {
        float _175 = _119 * _119;
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
        _121 = _207;
        _187 = _217;
        _123 = _205;
    }
    float _219 = _121;
    float _221 = _187;
    float _223 = _123;
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
        _257 = _119;
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
        float _285 = _119 * _277;
        float _287 = 1.0 / _281;
        float _289 = _283 * 0.693147182464599609375;
        float _291 = exp2(_285);
        float _293 = 1.0 / _289;
        float _295 = _291 + (-1.0);
        float _297 = -_295;
        float _299 = fma(_297, _293, _119);
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
        float _319 = _119 * _311;
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
    float _363 = in.m_51.w;
    float _365 = -_355;
    float _367 = _353 + _365;
    float _369 = _351 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _371 = fma(_359, _359, _361);
    float _373 = _351 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _375 = _351 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _377 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[4].x, _369);
    float _379 = fma(_367, _367, _371);
    float _381 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[5].x, _373);
    float _383 = in.m_44.x;
    float _385 = in.m_44.y;
    float _387 = in.m_44.z;
    float _389 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[6].x, _375);
    float _391 = fma(_367, (*spvDescriptorSet0.vp_c10)._m0[4].z, _377);
    float _393 = sqrt(_379);
    float _395 = fma(_367, (*spvDescriptorSet0.vp_c10)._m0[5].z, _381);
    float _397 = fma(_367, (*spvDescriptorSet0.vp_c10)._m0[6].z, _389);
    bool _399 = _393 >= 9.9999999747524270787835121154785e-07;
    bool _401 = isnan(_393);
    bool _403 = _399 || _401;
    bool _405 = isnan(9.9999999747524270787835121154785e-07);
    bool _407 = _403 || _405;
    float _409 = fma(_345, _363, _383);
    float _411 = fma(_333, _363, _385);
    float _413 = fma(_353, _363, _387);
    float _415 = _395;
    float _417 = _391;
    float _419 = _397;
    if (!_407)
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
                float _479 = _385 * _385;
                float _481 = fma(_383, _383, _479);
                float _483 = fma(_387, _387, _481);
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
                    float _513 = _385 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _515 = _385 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _517 = _385 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _519 = fma(_383, (*spvDescriptorSet0.vp_c10)._m0[5].x, _513);
                    float _521 = fma(_383, (*spvDescriptorSet0.vp_c10)._m0[4].x, _515);
                    float _523 = fma(_383, (*spvDescriptorSet0.vp_c10)._m0[6].x, _517);
                    float _525 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[5].z, _519);
                    float _527 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[4].z, _521);
                    float _529 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[6].z, _523);
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
    bool _587 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _589 = !_587;
    float _607;
    if (!_589)
    {
        float _591 = in.m_53.x;
        float _593 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _595 = _591 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _597 = fma(_595, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _599 = _597 * _593;
        float _601 = floor(_599);
        float _603 = -_601;
        float _605 = _599 + _603;
        _607 = _605;
        _609 = true;
    }
    else
    {
        float _611 = float(_85);
        float _613 = 1.0 / _611;
        float _615 = _119 * _613;
        _607 = _615;
    }
    _609 = false;
    float _617 = _607;
    float _619 = as_type<float>(int(gl_VertexIndex));
    float _621 = _411 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _623 = 0.0 + (*spvDescriptorSet0.vp_c7)._m0[0].x;
    float _625 = precise::clamp(_623, 0.0, 1.0);
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _629 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _627;
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _633 = _631 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _635 = fma(_409, (*spvDescriptorSet0.vp_c10)._m0[5].x, _621);
    float _637 = fma(_625, -0.64999997615814208984375, 1.0);
    float _639 = 1.0 / _629;
    float _641 = _581 * _581;
    float _643 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[5].z, _635);
    float _645 = fma(_583, _583, _641);
    float _647 = _643 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _649 = 1.0 / _633;
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _653 = _617 + _651;
    float _655 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _657 = _647 + _655;
    float _659 = fma(_585, _585, _645);
    int _661 = as_type<int>(_619) & 1;
    bool _663 = _661 != 0;
    int _665 = as_type<int>(_619) & 2;
    bool _667 = _665 != 0;
    float _669 = _411 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _671 = _411 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _673 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _675 = _617 + _673;
    float _677 = _653 * _639;
    float _679 = fma(_409, (*spvDescriptorSet0.vp_c10)._m0[4].x, _669);
    float _681 = fma(_409, (*spvDescriptorSet0.vp_c10)._m0[6].x, _671);
    float _683 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _685 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _683;
    float _687 = rsqrt(_659);
    float _689 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[4].z, _679);
    float _691 = _675 * _649;
    float _693 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[6].z, _681);
    float _695 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _697 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _695;
    float _699 = _689 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _701 = _657 * _657;
    float _703 = _693 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _705 = fma(_685, _677, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _707 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _709 = _699 + _707;
    float _711 = fma(_697, _677, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _713 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _715 = _703 + _713;
    bool _717 = _617 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _719 = isnan(_617);
    bool _721 = _717 || _719;
    bool _723 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _725 = _721 || _723;
    float _727 = float(_725);
    float _729 = fma(_709, _709, _701);
    bool _731 = _617 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _733 = isnan(_617);
    bool _735 = _731 || _733;
    bool _737 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _739 = _735 || _737;
    float _741 = float(_739);
    bool _743 = _617 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _745 = isnan(_617);
    bool _747 = _743 || _745;
    bool _749 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _751 = _747 || _749;
    float _753 = float(_751);
    float _755 = fma(_715, _715, _729);
    float _757 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _759 = _757 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _761 = -_727;
    float _763 = _761 + 1.0;
    float _765 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _767 = _765 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _769 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _771 = (*spvDescriptorSet0.vp_c10)._m0[9].w + _769;
    float _773 = fma(_759, _691, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _775 = rsqrt(_755);
    float _777 = _741 * _763;
    float _779 = fma(_767, _691, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _781 = -_741;
    float _783 = _781 + 1.0;
    float _785 = _687 * _585;
    float _787 = _705 * _777;
    float _789 = _711 * _777;
    float _791 = -_753;
    float _793 = _791 + 1.0;
    float _795 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _797 = (*spvDescriptorSet0.vp_c10)._m0[8].w + _795;
    float _799 = _771 * _771;
    float _801 = _687 * _583;
    float _803 = _687 * _581;
    float _805 = fma(_783, (*spvDescriptorSet0.vp_c9)._m0[143].y, _789);
    float _807 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _809 = _785 * _807;
    float _811 = _727 * _793;
    float _813 = _657 * _775;
    float _815 = _709 * _775;
    float _817 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _819 = (*spvDescriptorSet0.vp_c10)._m0[10].w + _817;
    float _821 = fma(_797, _797, _799);
    float _823 = -_813;
    float _825 = fma(_823, (*spvDescriptorSet0.vp_c9)._m0[18].w, _657);
    float _827 = -_815;
    float _829 = fma(_827, (*spvDescriptorSet0.vp_c9)._m0[18].w, _709);
    float _831 = fma(_783, (*spvDescriptorSet0.vp_c9)._m0[143].x, _787);
    float _833 = _715 * _775;
    float _835 = _825 * _825;
    float _837 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _839 = -_809;
    float _841 = fma(_801, _837, _839);
    float _843 = fma(_819, _819, _821);
    float _845 = -_833;
    float _847 = fma(_845, (*spvDescriptorSet0.vp_c9)._m0[18].w, _715);
    float _849 = fma(_829, _829, _835);
    float _851 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _853 = _803 * _851;
    float _855 = in.m_51.x;
    float _857 = in.m_51.y;
    float _859 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _861 = _801 * _859;
    float _863 = _841 * _841;
    float _865 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _867 = -_853;
    float _869 = fma(_785, _865, _867);
    float _871 = fma(_847, _847, _849);
    float _873 = sqrt(_843);
    float _875 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _877 = -_861;
    float _879 = fma(_803, _875, _877);
    float _881 = fma(_869, _869, _863);
    float _883 = fma(_779, _811, _805);
    float _885 = fma(_773, _811, _831);
    float _887 = fma(_879, _879, _881);
    float _889 = fma(_753, (*spvDescriptorSet0.vp_c9)._m0[145].y, _883);
    float _891 = rsqrt(_843);
    float _893 = fma(_753, (*spvDescriptorSet0.vp_c9)._m0[145].x, _885);
    float _895 = sqrt(_871);
    float _897 = _873 * 0.066666670143604278564453125;
    float _899 = _889 * _857;
    bool _901 = !_667;
    float _903 = _901 ? (-0.5) : 0.5;
    float _905 = _893 * _855;
    float _907 = precise::max(_897, 1.0);
    float _909 = _899 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _911 = rsqrt(_887);
    float _913 = _891 * (-0.20000000298023223876953125);
    float _915 = _905 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _917 = precise::min(_907, 2.0);
    float _919 = fma(_771, _913, (*spvDescriptorSet0.vp_c10)._m0[9].w);
    float _921 = fma(_797, _913, (*spvDescriptorSet0.vp_c10)._m0[8].w);
    bool _923 = !_663;
    float _925 = _923 ? (-0.5) : 0.5;
    float _927 = _775 * _895;
    float _929 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _903);
    float _931 = fma(_819, _913, (*spvDescriptorSet0.vp_c10)._m0[10].w);
    float _933 = _917 * _637;
    float _935 = _909 * _927;
    float _937 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _925);
    float _939 = _915 * _927;
    float _941 = _927 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _943 = _941 * 0.5;
    float _945 = _869 * _911;
    float _947 = _935 * _929;
    float _949 = _879 * _911;
    float _951 = _841 * _911;
    float _953 = _939 * _937;
    float _955 = _785 * _945;
    float _957 = _947 * _803;
    float _959 = _803 * _949;
    float _961 = _947 * _801;
    float _963 = -_955;
    float _965 = fma(_801, _949, _963);
    float _967 = fma(_953, _951, _957);
    float _969 = _801 * _951;
    float _971 = -_959;
    float _973 = fma(_785, _951, _971);
    float _975 = _947 * _785;
    float _977 = fma(_953, _945, _961);
    float _979 = fma(_943, _965, _967);
    float _981 = -_969;
    float _983 = fma(_803, _945, _981);
    float _985 = fma(_953, _949, _975);
    float _987 = fma(_943, _973, _977);
    float _989 = _647 + _979;
    float _991 = -_919;
    float _993 = _991 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _995 = fma(_943, _983, _985);
    float _997 = _699 + _987;
    float _999 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1001 = _989 + _999;
    float _1003 = _993 * _993;
    float _1005 = _703 + _995;
    float _1007 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1009 = _997 + _1007;
    float _1011 = fma(_1001, _933, (*spvDescriptorSet0.vp_c10)._m0[9].w);
    float _1013 = -_921;
    float _1015 = _1013 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1017 = fma(_1009, _933, (*spvDescriptorSet0.vp_c10)._m0[8].w);
    float _1019 = -_1011;
    float _1021 = _1019 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1023 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1025 = _1005 + _1023;
    float _1027 = fma(_1015, _1015, _1003);
    float _1029 = -_1017;
    float _1031 = _1029 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1033 = _1021 * _1021;
    float _1035 = fma(_1025, _933, (*spvDescriptorSet0.vp_c10)._m0[10].w);
    float _1037 = -_931;
    float _1039 = _1037 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1041 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1043 = _919 + _1041;
    float _1045 = fma(_1031, _1031, _1033);
    float _1047 = -_1035;
    float _1049 = _1047 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1051 = fma(_1039, _1039, _1027);
    float _1053 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1055 = _921 + _1053;
    float _1057 = _1043 * _1043;
    float _1059 = fma(_1049, _1049, _1045);
    float _1061 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1063 = _931 + _1061;
    float _1065 = sqrt(_1051);
    float _1067 = fma(_1055, _1055, _1057);
    float _1069 = fma(_1063, _1063, _1067);
    float _1071 = sqrt(_1059);
    float _1073 = rsqrt(_1069);
    float _1075 = -_1065;
    float _1077 = _1071 + _1075;
    float _1079 = _1073 * _1077;
    float _1081 = in.m_53.x;
    float _1083 = in.m_53.y;
    float _1085 = in.m_53.z;
    float _1087 = in.m_53.w;
    float _1089 = -_1079;
    float _1091 = fma(_1055, _1089, _1017);
    float _1093 = -_1079;
    float _1095 = fma(_1063, _1093, _1035);
    float _1097 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1099 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1101 = _1091 + _1099;
    float _1103 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1105 = _1095 + _1103;
    float _1107 = -_1079;
    float _1109 = fma(_1043, _1107, _1011);
    int _1111 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1113 = _1111 != 0;
    float _1115 = _1101 * _1101;
    float _1117 = _1105 * _1105;
    int _1119 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1121 = _1119 != 0;
    float _1123 = _1115 + _1117;
    float _1125 = sqrt(_1123);
    bool _1127 = _1083 > 0.5;
    bool _1129 = _1087 > 0.5;
    float _1131 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1133 = _1081 > 0.5;
    bool _1135 = _1085 > 0.5;
    float _1137 = -_925;
    int _1139 = _1133 ? as_type<int>(_1137) : as_type<int>(_925);
    float _1141 = -_903;
    int _1143 = _1127 ? as_type<int>(_1141) : as_type<int>(_903);
    float _1145 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1147 = _1125 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1149 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1151 = _1149 != 0;
    float _1153 = -_903;
    int _1155 = _1129 ? as_type<int>(_1153) : as_type<int>(_903);
    int _1157 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1159 = _1157 != 0;
    float _1161 = -_925;
    int _1163 = _1135 ? as_type<int>(_1161) : as_type<int>(_925);
    bool _1165 = !_1113;
    float _1167 = _1165 ? _925 : as_type<float>(_1139);
    bool _1169 = !_1121;
    float _1171 = _1169 ? _903 : as_type<float>(_1143);
    bool _1173 = !_1151;
    float _1175 = _1173 ? _903 : as_type<float>(_1155);
    bool _1177 = !_1159;
    float _1179 = _1177 ? _925 : as_type<float>(_1163);
    float _1181 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    float _1183 = _903;
    float _1185 = _1011;
    float _1187 = _1043;
    float _1189 = _1117;
    if (!_1147)
    {
        _1181 = _1115;
    }
    float _1191 = _1181;
    float _1193 = _1191;
    if (!_1147)
    {
        _1183 = _1091;
    }
    float _1195 = _1183;
    float _1197 = _1195;
    if (!_1147)
    {
        _1185 = _1095;
    }
    float _1199 = _1185;
    float _1201 = _1199;
    if (!_1147)
    {
        _1187 = _1109;
    }
    float _1203 = _1187;
    bool _1205 = !_1147;
    float _1207 = _1203;
    if (!_1205)
    {
        float _1209 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1211 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1213 = _1125 + _1211;
        float _1215 = _1109 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1217 = rsqrt(_1123);
        float _1219 = _1213 * _1209;
        float _1221 = _1219 * 0.15915493667125701904296875;
        float _1223 = _1221 * 6.283185482025146484375;
        float _1225 = sin(_1223);
        float _1227 = _1221 * 6.283185482025146484375;
        float _1229 = cos(_1227);
        float _1231 = fma(_1225, _1215, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1233 = _1217 * _1231;
        float _1235 = _1229 + (-1.0);
        float _1237 = fma(_1101, _1233, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1239 = fma(_1105, _1233, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1241 = _1235 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1243 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1245 = _1237 + _1243;
        float _1247 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1249 = _1239 + _1247;
        float _1251 = fma(_1109, _1229, _1241);
        float _1253 = _1245 * _1245;
        float _1255 = _1249 * _1249;
        _1207 = _1251;
        _1193 = _1253;
        _1189 = _1255;
        _1197 = _1237;
        _1201 = _1239;
    }
    float _1257 = _1207;
    float _1259 = _1193;
    float _1261 = _1189;
    float _1263 = _1197;
    float _1265 = _1201;
    float _1267 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1269 = _1257 + _1267;
    float _1271 = -_1171;
    float _1273 = _1271 + 0.5;
    float _1275 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1277 = _1167 + 0.5;
    float _1279 = fma(_1269, _1269, _1259);
    float _1281 = _1179 + 0.5;
    float _1283 = _1273 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1285 = _1277 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1287 = _1279 + _1261;
    float _1289 = _1281 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1291 = _1283 * _1131;
    float _1293 = -_1175;
    float _1295 = _1293 + 0.5;
    float _1297 = _1289 * _1145;
    float _1299 = sqrt(_1287);
    float _1301 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1303 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1305 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1307 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1309 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1311 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1313 = _1295 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1315 = _1285 * _1097;
    float _1317 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1319 = _1301 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1321 = _1303 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1323 = _1305 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1325 = _1307 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1327 = _1309 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1329 = _1311 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1331 = _1313 * _1275;
    out.m_58.x = _1319;
    out.m_58.y = _1321;
    out.m_58.z = _1323;
    out.m_58.w = _1317;
    bool _1333 = _1299 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1335 = isnan(_1299);
    bool _1337 = _1333 || _1335;
    bool _1339 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1341 = _1337 || _1339;
    out.m_60.x = _1325;
    out.m_60.y = _1327;
    out.m_60.z = _1329;
    out.m_62.x = _1315;
    out.m_62.y = _1291;
    out.m_62.z = _1297;
    out.m_62.w = _1331;
    float _1343 = _1313;
    float _1345 = _1331;
    float _1347 = _1329;
    float _1349 = _1319;
    if (!_1341)
    {
        _1343 = 1.0;
    }
    float _1351 = _1343;
    bool _1353 = !_1341;
    float _1355 = _1351;
    if (!_1353)
    {
        bool _1357 = _1299 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1359 = isnan(_1299);
        bool _1361 = _1357 || _1359;
        bool _1363 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1365 = _1361 || _1363;
        if (!_1365)
        {
            float _1367 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1369 = _1299 + _1367;
            float _1371 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1373 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1371;
            float _1375 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1377 = _1375 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1379 = 1.0 / _1373;
            float _1381 = _1369 * _1379;
            float _1383 = fma(_1381, _1377, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1355 = _1383;
            _1385 = true;
        }
        else
        {
            bool _1387 = _1299 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1389 = isnan(_1299);
            bool _1391 = _1387 || _1389;
            bool _1393 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1395 = _1391 || _1393;
            if (!_1395)
            {
                float _1397 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1399 = _1299 + _1397;
                float _1401 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1403 = _1401 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1405 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1407 = _1405 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1409 = 1.0 / _1403;
                float _1411 = _1399 * _1409;
                float _1413 = fma(_1411, _1407, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1355 = _1413;
                _1385 = true;
            }
            else
            {
                _1355 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1385 = false;
    float _1415 = _1355;
    float _1417 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1419 = _1257 + _1417;
    float _1421 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1423 = _1263 + _1421;
    float _1425 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1427 = _1265 + _1425;
    float _1429 = fma(_1419, _1415, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1431 = fma(_1423, _1415, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1433 = fma(_1427, _1415, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1435 = -_813;
    float _1437 = fma(_1435, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1429);
    float _1439 = -_815;
    float _1441 = fma(_1439, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1431);
    float _1443 = -_833;
    float _1445 = fma(_1443, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1433);
    float _1447 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1449 = _1437 + _1447;
    float _1451 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1453 = _1441 + _1451;
    float _1455 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1457 = _1445 + _1455;
    float _1459 = _1449 * _1449;
    float _1461 = fma(_1453, _1453, _1459);
    float _1463 = fma(_1457, _1457, _1461);
    float _1465 = rsqrt(_1463);
    float _1467 = _1465 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1469 = _1453 * _1467;
    float _1471 = _1457 * _1467;
    float _1473 = _1469 * _1469;
    float _1475 = _1471 * _1471;
    float _1477 = _1473 + _1475;
    float _1479 = sqrt(_1477);
    bool _1481 = _1479 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1483 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1485 = _1479 + _1483;
    float _1487 = _1465;
    float _1489 = _1477;
    float _1491 = _1485;
    float _1493 = _1449;
    if (_1481)
    {
        float _1495 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1487 = _1495;
    }
    float _1497 = _1487;
    if (_1481)
    {
        float _1499 = rsqrt(_1477);
        _1489 = _1499;
    }
    float _1501 = _1489;
    float _1503 = _1501;
    if (_1481)
    {
        float _1505 = _1485 * _1497;
        _1491 = _1505;
    }
    float _1507 = _1491;
    if (_1481)
    {
        float _1509 = _1507 * 0.15915493667125701904296875;
        _1345 = _1509;
    }
    float _1511 = _1345;
    float _1513 = _1457;
    if (_1481)
    {
        float _1515 = _1511 * 6.283185482025146484375;
        float _1517 = sin(_1515);
        _1513 = _1517;
    }
    float _1519 = _1513;
    float _1521 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1523 = precise::max(0.0, _1521);
    float _1525 = _1497;
    float _1527 = _1523;
    if (_1481)
    {
        float _1529 = _1511 * 6.283185482025146484375;
        float _1531 = cos(_1529);
        _1525 = _1531;
    }
    float _1533 = _1525;
    float _1535 = -_1467;
    float _1537 = -_1523;
    float _1539 = fma(_1449, _1535, _1537);
    if (_1481)
    {
        float _1541 = _1539 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1493 = _1541;
    }
    float _1543 = _1493;
    float _1545 = sqrt(_1463);
    float _1547 = _1543;
    float _1549 = _1519;
    if (_1481)
    {
        float _1551 = fma(_1519, _1543, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1547 = _1551;
    }
    float _1553 = _1547;
    float _1555 = _1553;
    if (!_1481)
    {
        _1549 = _1469;
    }
    float _1557 = _1549;
    float _1559 = _1557;
    float _1561 = _1533;
    if (_1481)
    {
        float _1563 = _1533 + (-1.0);
        _1527 = _1563;
    }
    float _1565 = _1527;
    float _1567 = _1565;
    if (_1481)
    {
        float _1569 = _1501 * _1553;
        _1347 = _1569;
    }
    float _1571 = _1347;
    if (!_1481)
    {
        _1555 = _1539;
    }
    float _1573 = _1555;
    float _1575 = _1573;
    if (_1481)
    {
        float _1577 = _1565 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1349 = _1577;
    }
    float _1579 = _1349;
    if (_1481)
    {
        float _1581 = _1469 * _1571;
        _1559 = _1581;
    }
    float _1583 = _1559;
    if (!_1481)
    {
        _1567 = _1471;
    }
    float _1585 = _1567;
    float _1587 = _1585;
    if (_1481)
    {
        float _1589 = _1471 * _1571;
        _1587 = _1589;
    }
    float _1591 = _1587;
    if (!_1481)
    {
        _1503 = _1473;
    }
    float _1593 = _1503;
    float _1595 = _1593;
    if (_1481)
    {
        float _1597 = fma(_1539, _1533, _1579);
        _1575 = _1597;
    }
    float _1599 = _1575;
    if (_1481)
    {
        float _1601 = _1583 * _1583;
        _1595 = _1601;
    }
    float _1603 = _1595;
    if (!_1481)
    {
        _1561 = _1475;
    }
    float _1605 = _1561;
    float _1607 = _1605;
    if (_1481)
    {
        float _1609 = _1591 * _1591;
        _1607 = _1609;
    }
    float _1611 = _1607;
    float _1613 = fma(_1599, _1599, _1603);
    float _1615 = _1437 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1617 = _1613 + _1611;
    float _1619 = _1437 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1621 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1623 = fma(_1545, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1621);
    float _1625 = precise::clamp(_1623, 0.0, 1.0);
    float _1627 = _1437 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1629 = rsqrt(_1617);
    float _1631 = fma(_1441, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1619);
    float _1633 = -_1625;
    float _1635 = _1633 + 1.0;
    float _1637 = _1437 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1639 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1641 = fma(_1445, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1631);
    float _1643 = fma(_1441, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1627);
    float _1645 = fma(_1441, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1637);
    float _1647 = abs(_1635);
    float _1649 = log2(_1647);
    float _1651 = _1641 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1653 = fma(_1445, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1643);
    float _1655 = fma(_1441, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1615);
    float _1657 = fma(_1445, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1645);
    float _1659 = _1651 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1661 = _1653 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1663 = fma(_1445, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1655);
    float _1665 = _1629 * _1583;
    float _1667 = _1629 * _1599;
    float _1669 = _1657 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1671 = -_1659;
    float _1673 = fma(_1671, _1639, 1.0);
    float _1675 = _1665 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1677 = _1661 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1679 = _1663 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1681 = _1629 * _1591;
    float _1683 = -_1675;
    float _1685 = fma(_1667, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1683);
    float _1687 = fma(_1669, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1677);
    float _1689 = _1649 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1691 = log2(_1673);
    float _1693 = -_1681;
    float _1695 = fma(_1693, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1685);
    float _1697 = fma(_1651, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1687);
    float _1699 = _1661 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1701 = _1661 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1703 = fma(_1695, -0.5, 0.5);
    float _1705 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1697);
    float _1707 = fma(_1695, 0.5, 0.5);
    float _1709 = exp2(_1689);
    float _1711 = fma(_1669, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1699);
    float _1713 = fma(_1669, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1701);
    float _1715 = fma(_1707, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1717 = _1667 + 1.0;
    float _1719 = fma(_1651, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1711);
    float _1721 = fma(_1651, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1713);
    float _1723 = fma(_1707, _1715, -0.212114393711090087890625);
    float _1725 = 1.0 / _1705;
    float _1727 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1719);
    float _1729 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1721);
    float _1731 = _1691 * 0.693147182464599609375;
    float _1733 = fma(_1707, _1723, 1.570728778839111328125);
    float _1735 = sqrt(_1703);
    float _1737 = -_1667;
    float _1739 = fma(_1709, _1717, _1737);
    float _1741 = _1731 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1743 = fma(_1739, 0.5, 0.5);
    float _1745 = _1727 * _1725;
    float _1747 = _1729 * _1725;
    float _1749 = fma(_1745, 0.5, 0.5);
    float _1751 = fma(_1747, -0.5, 0.5);
    float _1753 = _1735 * 0.636619746685028076171875;
    float _1755 = -_1733;
    float _1757 = fma(_1753, _1755, 1.0);
    float3 _4771 = float3(_1749, _1751, _1741);
    float _1759 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4771, float3(0.0), isnan(_4771)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4771, float3(0.0), isnan(_4771)), level(0.0)).x;
    float3 _4782 = float3(_1749, _1751, _1741);
    float4 _1762 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4782, float3(0.0), isnan(_4782)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4782, float3(0.0), isnan(_4782)), level(0.0)).xyzw;
    float _1764 = _1762.x;
    float _1766 = _1762.y;
    float _1768 = _1762.z;
    float _1770 = _1762.w;
    float2 _4799 = float2(_1757, _1743);
    float3 _1774 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4799, float2(0.0), isnan(_4799)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4799, float2(0.0), isnan(_4799)), level(0.0)).xyz;
    float _1776 = _1774.x;
    float _1778 = _1774.y;
    float _1780 = _1774.z;
    float _1782 = -_813;
    float _1784 = fma(_1782, (*spvDescriptorSet0.vp_c9)._m0[18].w, _647);
    float _1786 = -_815;
    float _1788 = fma(_1786, (*spvDescriptorSet0.vp_c9)._m0[18].w, _699);
    float _1790 = -_833;
    float _1792 = fma(_1790, (*spvDescriptorSet0.vp_c9)._m0[18].w, _703);
    float _1794 = _1649 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1796 = _1784 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1798 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1796);
    float _1800 = exp2(_1794);
    float _1802 = fma(_1792, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1798);
    float _1804 = _1784 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1806 = _1802 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1808 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1804);
    bool _1810 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1812 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1814 = _1810 || _1812;
    bool _1816 = isnan(0.5);
    bool _1818 = _1814 || _1816;
    float _1820 = 1.0 / _1806;
    float _1822 = fma(_1792, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1808);
    float _1824 = _1661 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1826 = _1822 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1828 = fma(_1669, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1824);
    float _1830 = _1826 + _1806;
    float _1832 = fma(_1651, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1828);
    float _1834 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1832);
    float _1836 = _1830 * _1820;
    float _1838 = _1836 * 0.5;
    float _1840 = _1820;
    if (_1818)
    {
        _1840 = 1.0;
    }
    float _1842 = _1840;
    float _1844 = _1842;
    if (!_1818)
    {
        float _1846 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1848 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1850 = fma(_1838, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1848);
        float _1852 = _1846 * 0.15915493667125701904296875;
        float _1854 = _1852 * 6.283185482025146484375;
        float _1856 = cos(_1854);
        float _1858 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1860 = _1858 * 0.15915493667125701904296875;
        float _1862 = _1852 * 6.283185482025146484375;
        float _1864 = sin(_1862);
        float _1866 = 1.0 / _1856;
        float _1868 = _1860 * 6.283185482025146484375;
        float _1870 = cos(_1868);
        float _1872 = _1864 * _1866;
        float _1874 = 1.0 / _1850;
        float _1876 = _1870 * _1872;
        float _1878 = _1860 * 6.283185482025146484375;
        float _1880 = sin(_1878);
        float _1882 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1884 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1882;
        float _1886 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1888 = _1874 * _1886;
        float _1890 = 1.0 / _1876;
        float _1892 = 1.0 / _1884;
        float _1894 = _1880 * _1890;
        float _1896 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1898 = fma(_1894, _1888, _1896);
        float _1900 = _1898 * _1892;
        float _1902 = precise::clamp(_1900, 0.0, 1.0);
        float _1904 = -_1902;
        float _1906 = _1904 + 1.0;
        _1844 = _1906;
    }
    float _1908 = _1844;
    float _1910 = -_1800;
    float _1912 = _1910 + 1.0;
    bool _1914 = _1908 > 0.0;
    bool _1916 = isnan(_1908);
    bool _1918 = _1914 || _1916;
    bool _1920 = isnan(0.0);
    bool _1922 = _1918 || _1920;
    float _1924 = _1705 * 0.5;
    float _1926 = _1908 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1928 = _1912 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1930 = _1834 + _1705;
    float _1932 = _1727 + _1705;
    float _1934 = fma(_1729, -0.5, _1924);
    float _1936 = _1928 * _1759;
    out.gl_Position.x = _1727;
    out.gl_Position.y = _1729;
    out.gl_Position.z = _1834;
    out.gl_Position.w = _1705;
    float _1938 = _1930 * 0.5;
    float _1940 = _1770 * _1936;
    float _1942 = _1780 * _1936;
    float _1944 = -_1928;
    float _1946 = _1944 + 1.0;
    float _1948 = _1932 * 0.5;
    float _1950 = fma(_1776, _1940, _1764);
    float _1952 = fma(_1778, _1940, _1766);
    float _1954 = _1926 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1956 = _1770 * _1946;
    float _1958 = fma(_1770, _1942, _1768);
    out.m_64.x = _1948;
    out.m_64.y = _1934;
    out.m_64.z = _1938;
    out.m_64.w = _1705;
    out.m_47.x = _1954;
    out.m_66.x = _1950;
    out.m_66.y = _1952;
    out.m_66.z = _1958;
    out.m_66.w = _1956;
    if (_1922)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _1960 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1960;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

