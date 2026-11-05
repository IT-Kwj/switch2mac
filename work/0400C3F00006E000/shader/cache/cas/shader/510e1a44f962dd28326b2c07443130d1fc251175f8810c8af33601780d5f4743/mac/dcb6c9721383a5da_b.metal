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
    float4 m_56 [[user(locn0)]];
    float4 m_60 [[user(locn1)]];
    float4 m_62 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_58 [[user(locn4)]];
    float4 m_64 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_54 [[attribute(4)]];
    float4 m_52 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    bool _811 = false;
    bool _627 = false;
    bool _477 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _78 = in.m_42.w;
    float _80 = trunc(_78);
    int _83 = int(_80);
    bool _87 = _83 >= 1;
    float _89 = 0.0;
    if (!_87)
    {
        _89 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _91 = _89;
    float _93 = _91;
    if (!_87)
    {
        out.m_45.x = 0.0;
    }
    int _95 = 0;
    if (!_87)
    {
        float _97 = _91 * 5.0;
        _95 = as_type<int>(_97);
    }
    int _99 = _95;
    if (!_87)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1760 = as_type<float>(_99);
        out.gl_Position.z = _1760;
    }
    if (!_87)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _101 = in.m_47.w;
    bool _103 = _101 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _105 = isnan(_101);
    bool _107 = _103 || _105;
    bool _109 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _111 = _107 || _109;
    float _113 = -_101;
    float _115 = _113 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _117 = 0.0;
    float _119 = 0.0;
    float _121 = 0.0;
    if (_111)
    {
        float _123 = float(_83);
        _117 = _123;
    }
    float _125 = _117;
    bool _127 = _115 >= _125;
    bool _129 = !_111;
    bool _131 = _127 || _129;
    if (_131)
    {
        _93 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _93;
    if (_131)
    {
        out.m_45.x = 0.0;
    }
    int _135 = 0;
    if (_131)
    {
        float _137 = _133 * 5.0;
        _135 = as_type<int>(_137);
    }
    int _139 = _135;
    float _141 = as_type<float>(_139);
    if (_131)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1830 = as_type<float>(_139);
        out.gl_Position.z = _1830;
    }
    if (_131)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _143 = as_type<float>(int(gl_VertexIndex));
    float _145 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _147 = in.m_47.x;
    float _149 = in.m_47.y;
    float _151 = in.m_47.z;
    bool _153 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _155 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _157 = _153 || _155;
    bool _159 = isnan(1.0);
    bool _161 = _157 || _159;
    float _163 = _145;
    if (!_161)
    {
        float _165 = _145 * _145;
        float _167 = _165 * 0.5;
        _141 = _167;
    }
    float _169 = _141;
    float _171 = 0.0;
    float _173 = _169;
    if (!_161)
    {
        float _175 = _115 * _115;
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
    int _185 = as_type<int>(_143) & 1;
    bool _187 = _185 != 0;
    int _189 = as_type<int>(_143) & 2;
    bool _191 = _189 != 0;
    bool _193 = !_187;
    float _195 = _193 ? (-0.5) : 0.5;
    bool _197 = !_191;
    float _199 = _197 ? (-0.5) : 0.5;
    bool _201 = !_161;
    float _203 = _183;
    if (!_201)
    {
        float _205 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _207 = log2(_205);
        float _209 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _211 = _209 + 1.0;
        float _213 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _215 = _145 * _207;
        float _217 = 1.0 / _211;
        float _219 = _213 * 0.693147182464599609375;
        float _221 = exp2(_215);
        float _223 = 1.0 / _219;
        float _225 = _221 + (-1.0);
        float _227 = -_225;
        float _229 = fma(_227, _223, _145);
        float _231 = _229 * _217;
        float _233 = _231 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _119 = _223;
        _203 = _233;
        _121 = _221;
    }
    float _235 = _119;
    float _237 = _203;
    float _239 = _121;
    bool _241 = !_161;
    float _243 = _235;
    float _245 = _239;
    if (!_241)
    {
        float _247 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _249 = log2(_247);
        float _251 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _253 = _251 + 1.0;
        float _255 = 1.0 / _253;
        float _257 = _145 * _249;
        float _259 = exp2(_257);
        float _261 = -_259;
        float _263 = _261 + 1.0;
        float _265 = _263 * _255;
        _243 = _259;
        _245 = _253;
        _163 = _265;
    }
    float _267 = _243;
    float _269 = _245;
    float _271 = _163;
    float _273 = _269;
    float _275 = _267;
    if (!_161)
    {
        _273 = _115;
    }
    float _277 = _273;
    float _279 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _281 = _277;
    if (!_161)
    {
        float _283 = _179 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _275 = _283;
    }
    float _285 = _275;
    bool _287 = !_161;
    float _289 = _285;
    if (!_287)
    {
        float _291 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _293 = log2(_291);
        float _295 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _297 = _295 + 1.0;
        float _299 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _301 = _115 * _293;
        float _303 = exp2(_301);
        float _305 = _299 * 0.693147182464599609375;
        float _307 = 1.0 / _305;
        float _309 = 1.0 / _297;
        float _311 = _303 + (-1.0);
        float _313 = -_311;
        float _315 = fma(_313, _307, _115);
        float _317 = _315 * _309;
        float _319 = _317 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _289 = _319;
    }
    float _321 = _289;
    bool _323 = !_161;
    if (!_323)
    {
        float _325 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _327 = log2(_325);
        float _329 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _331 = _329 + 1.0;
        float _333 = 1.0 / _331;
        float _335 = _115 * _327;
        float _337 = exp2(_335);
        float _339 = -_337;
        float _341 = _339 + 1.0;
        float _343 = _341 * _333;
        _281 = _343;
    }
    float _345 = _281;
    float _347 = _321 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _349 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _351 = fma(_271, _149, _279);
    float _353 = _321 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _355 = fma(_345, _149, _347);
    float _357 = fma(_271, _147, _349);
    float _359 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _361 = _321 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _363 = fma(_345, _147, _353);
    float _365 = -_355;
    float _367 = _351 + _365;
    float _369 = fma(_271, _151, _359);
    float _371 = fma(_345, _151, _361);
    float _373 = -_363;
    float _375 = _357 + _373;
    float _377 = _367 * _367;
    float _379 = in.m_52.w;
    float _381 = -_371;
    float _383 = _369 + _381;
    float _385 = _367 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _387 = fma(_375, _375, _377);
    float _389 = _367 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _391 = _367 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _393 = fma(_375, (*spvDescriptorSet0.vp_c10)._m0[4].x, _385);
    float _395 = fma(_383, _383, _387);
    float _397 = fma(_375, (*spvDescriptorSet0.vp_c10)._m0[5].x, _389);
    float _399 = in.m_42.x;
    float _401 = in.m_42.y;
    float _403 = in.m_42.z;
    float _405 = fma(_375, (*spvDescriptorSet0.vp_c10)._m0[6].x, _391);
    float _407 = fma(_383, (*spvDescriptorSet0.vp_c10)._m0[4].z, _393);
    float _409 = sqrt(_395);
    bool _411 = _409 >= 9.9999999747524270787835121154785e-07;
    bool _413 = isnan(_409);
    bool _415 = _411 || _413;
    bool _417 = isnan(9.9999999747524270787835121154785e-07);
    bool _419 = _415 || _417;
    float _421 = fma(_383, (*spvDescriptorSet0.vp_c10)._m0[5].z, _397);
    float _423 = fma(_383, (*spvDescriptorSet0.vp_c10)._m0[6].z, _405);
    float _425 = fma(_357, _379, _399);
    float _427 = fma(_351, _379, _401);
    float _429 = fma(_369, _379, _403);
    float _431 = _421;
    float _433 = _407;
    float _435 = _423;
    float _437 = _429;
    if (!_419)
    {
        bool _439 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _441 = !_439;
        if (!_441)
        {
            float _443 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _445 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _447 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _449 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _443);
            float _451 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _445);
            float _453 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _447);
            float _455 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _449);
            float _457 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _451);
            float _459 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _453);
            float _461 = _455 * _455;
            float _463 = fma(_457, _457, _461);
            float _465 = fma(_459, _459, _463);
            float _467 = rsqrt(_465);
            float _469 = _467 * 9.9999999747524270787835121154785e-07;
            float _471 = _457 * _469;
            float _473 = _455 * _469;
            float _475 = _459 * _469;
            _431 = _473;
            _433 = _471;
            _435 = _475;
            _477 = true;
        }
        else
        {
            float _479 = _149 * _149;
            float _481 = fma(_147, _147, _479);
            float _483 = fma(_151, _151, _481);
            float _485 = sqrt(_483);
            bool _487 = _485 >= 9.9999999747524270787835121154785e-07;
            bool _489 = isnan(_485);
            bool _491 = _487 || _489;
            bool _493 = isnan(9.9999999747524270787835121154785e-07);
            bool _495 = _491 || _493;
            if (!_495)
            {
                float _497 = _401 * _401;
                float _499 = fma(_399, _399, _497);
                float _501 = fma(_403, _403, _499);
                float _503 = sqrt(_501);
                bool _505 = _503 >= 9.9999999747524270787835121154785e-07;
                bool _507 = isnan(_503);
                bool _509 = _505 || _507;
                bool _511 = isnan(9.9999999747524270787835121154785e-07);
                bool _513 = _509 || _511;
                if (!_513)
                {
                    float _515 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _517 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _515);
                    float _519 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _517);
                    float _521 = rsqrt(_519);
                    float _523 = _521 * 9.9999999747524270787835121154785e-07;
                    float _525 = _523 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _527 = _523 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _529 = _523 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _431 = _527;
                    _433 = _525;
                    _435 = _529;
                    _477 = true;
                }
                else
                {
                    float _531 = _401 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _533 = _401 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _535 = _401 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _537 = fma(_399, (*spvDescriptorSet0.vp_c10)._m0[5].x, _531);
                    float _539 = fma(_399, (*spvDescriptorSet0.vp_c10)._m0[4].x, _533);
                    float _541 = fma(_399, (*spvDescriptorSet0.vp_c10)._m0[6].x, _535);
                    float _543 = fma(_403, (*spvDescriptorSet0.vp_c10)._m0[5].z, _537);
                    float _545 = fma(_403, (*spvDescriptorSet0.vp_c10)._m0[4].z, _539);
                    float _547 = fma(_403, (*spvDescriptorSet0.vp_c10)._m0[6].z, _541);
                    float _549 = _543 * _543;
                    float _551 = fma(_545, _545, _549);
                    float _553 = fma(_547, _547, _551);
                    float _555 = rsqrt(_553);
                    float _557 = _555 * 9.9999999747524270787835121154785e-07;
                    float _559 = _545 * _557;
                    float _561 = _543 * _557;
                    float _563 = _547 * _557;
                    _431 = _561;
                    _433 = _559;
                    _435 = _563;
                    _477 = true;
                }
            }
            else
            {
                float _565 = _149 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _567 = _149 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _569 = _149 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _571 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[5].x, _565);
                float _573 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[4].x, _567);
                float _575 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[6].x, _569);
                float _577 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[5].z, _571);
                float _579 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[4].z, _573);
                float _581 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[6].z, _575);
                float _583 = _577 * _577;
                float _585 = fma(_579, _579, _583);
                float _587 = fma(_581, _581, _585);
                float _589 = rsqrt(_587);
                float _591 = _589 * 9.9999999747524270787835121154785e-07;
                float _593 = _579 * _591;
                float _595 = _577 * _591;
                float _597 = _581 * _591;
                _431 = _595;
                _433 = _593;
                _435 = _597;
            }
        }
    }
    _477 = false;
    float _599 = _431;
    float _601 = _433;
    float _603 = _435;
    bool _605 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    bool _607 = !_605;
    float _625;
    if (!_607)
    {
        float _609 = in.m_54.x;
        float _611 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _613 = _609 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _615 = fma(_613, (*spvDescriptorSet0.vp_c9)._m0[11].y, _115);
        float _617 = _615 * _611;
        float _619 = floor(_617);
        float _621 = -_619;
        float _623 = _617 + _621;
        _625 = _623;
        _627 = true;
    }
    else
    {
        float _629 = float(_83);
        float _631 = 1.0 / _629;
        float _633 = _115 * _631;
        _625 = _633;
    }
    _627 = false;
    float _635 = _625;
    float _637 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _639 = _635 + _637;
    float _641 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _643 = _641 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _645 = _635 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _647 = isnan(_635);
    bool _649 = _645 || _647;
    bool _651 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _653 = _649 || _651;
    float _655 = float(_653);
    float _657 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _659 = _657 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _661 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _663 = _661 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _665 = _635 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _667 = isnan(_635);
    bool _669 = _665 || _667;
    bool _671 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _673 = _669 || _671;
    float _675 = float(_673);
    float _677 = 1.0 / _643;
    float _679 = -_655;
    float _681 = _679 + 1.0;
    float _683 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _685 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _683;
    bool _687 = _635 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _689 = isnan(_635);
    bool _691 = _687 || _689;
    bool _693 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _695 = _691 || _693;
    float _697 = float(_695);
    float _699 = _675 * _681;
    float _701 = -_675;
    float _703 = _701 + 1.0;
    bool _705 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _707 = 1.0 / _659;
    float _709 = _697 * _703;
    float _711 = -_697;
    float _713 = _711 + 1.0;
    float _715 = 1.0 / _663;
    float _717 = _685 * _677;
    float _719 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _721 = _719 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _723 = fma(_717, _639, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _725 = _721 * _707;
    bool _727 = _635 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _729 = isnan(_635);
    bool _731 = _727 || _729;
    bool _733 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _735 = _731 || _733;
    float _737 = float(_735);
    float _739 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _741 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _739;
    float _743 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _745 = _635 + _743;
    float _747 = _723 * _709;
    float _749 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _751 = _635 + _749;
    float _753 = -_737;
    float _755 = _753 + 1.0;
    float _757 = fma(_725, _745, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _759 = _741 * _715;
    float _761 = fma(_713, (*spvDescriptorSet0.vp_c9)._m0[115].x, _747);
    float _763 = _655 * _755;
    float _765 = fma(_759, _751, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _767 = fma(_757, _699, _761);
    float _769 = fma(_765, _763, _767);
    float _771 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _773 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _775 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _777 = fma(_737, (*spvDescriptorSet0.vp_c9)._m0[118].x, _769);
    float _779 = _771 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _781 = _773 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _783 = _775 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _785 = _777 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_56.x = _779;
    out.m_56.y = _781;
    out.m_56.z = _783;
    out.m_56.w = _785;
    bool _787 = !_705;
    float _789 = _771;
    float _791 = _773;
    float _809;
    if (!_787)
    {
        float _793 = in.m_54.x;
        float _795 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _797 = _793 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _799 = fma(_797, (*spvDescriptorSet0.vp_c9)._m0[11].z, _115);
        float _801 = _799 * _795;
        float _803 = floor(_801);
        float _805 = -_803;
        float _807 = _801 + _805;
        _789 = _795;
        _809 = _807;
        _811 = true;
    }
    else
    {
        float _813 = float(_83);
        float _815 = 1.0 / _813;
        float _817 = _115 * _815;
        _809 = _817;
    }
    _811 = false;
    float _819 = _789;
    float _821 = _809;
    float _823 = _599 * _599;
    float _825 = in.m_52.x;
    float _827 = in.m_52.y;
    float _829 = fma(_601, _601, _823);
    float _831 = fma(_603, _603, _829);
    float _833 = rsqrt(_831);
    float _835 = _833 * _599;
    float _837 = _833 * _601;
    float _839 = _833 * _603;
    float _841 = _835 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _843 = fma(_837, (*spvDescriptorSet0.vp_c10)._m0[8].y, _841);
    float _845 = fma(_839, (*spvDescriptorSet0.vp_c10)._m0[10].y, _843);
    float _847 = abs(_845);
    bool _849 = _847 > 0.99989998340606689453125;
    float _851 = _845;
    float _853 = _819;
    float _855 = _833;
    if (_849)
    {
        _851 = 0.001000000047497451305389404296875;
    }
    float _857 = _851;
    if (!_849)
    {
        _791 = (*spvDescriptorSet0.vp_c10)._m0[8].y;
    }
    float _859 = _791;
    float _861 = _859;
    if (!_849)
    {
        _853 = (*spvDescriptorSet0.vp_c10)._m0[10].y;
    }
    float _863 = _853;
    float _865 = _863;
    if (_849)
    {
        float _867 = fma(_857, (*spvDescriptorSet0.vp_c10)._m0[8].z, (*spvDescriptorSet0.vp_c10)._m0[8].y);
        _861 = _867;
    }
    float _869 = _861;
    if (_849)
    {
        float _871 = fma(_857, (*spvDescriptorSet0.vp_c10)._m0[10].z, (*spvDescriptorSet0.vp_c10)._m0[10].y);
        _865 = _871;
    }
    float _873 = _865;
    if (!_849)
    {
        _855 = (*spvDescriptorSet0.vp_c10)._m0[9].y;
    }
    float _875 = _855;
    float _877 = _875;
    if (_849)
    {
        float _879 = fma(_857, (*spvDescriptorSet0.vp_c10)._m0[9].z, (*spvDescriptorSet0.vp_c10)._m0[9].y);
        _877 = _879;
    }
    float _881 = _877;
    float _883 = -_869;
    float _885 = _839 * _883;
    float _887 = -_873;
    float _889 = _835 * _887;
    float _891 = -_873;
    float _893 = -_885;
    float _895 = fma(_837, _891, _893);
    float _897 = -_881;
    float _899 = -_889;
    float _901 = fma(_839, _897, _899);
    float _903 = -_881;
    float _905 = _837 * _903;
    float _907 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _195);
    float _909 = _895 * _895;
    float _911 = -_869;
    float _913 = -_905;
    float _915 = fma(_835, _911, _913);
    float _917 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _199);
    float _919 = fma(_901, _901, _909);
    float _921 = _827 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _923 = fma(_915, _915, _919);
    float _925 = _825 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _927 = _921 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _929 = rsqrt(_923);
    float _931 = _925 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _933 = _927 * _917;
    float _935 = _427 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _937 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _939 = _931 * _907;
    float _941 = fma(_425, (*spvDescriptorSet0.vp_c10)._m0[6].x, _935);
    float _943 = _933 * _839;
    float _945 = fma(_429, (*spvDescriptorSet0.vp_c10)._m0[6].z, _941);
    float _947 = _945 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _949 = _895 * _929;
    float _951 = _915 * _929;
    float _953 = _901 * _929;
    float _955 = _837 * _949;
    float _957 = fma(_939, _951, _943);
    float _959 = _835 * _951;
    float _961 = -_955;
    float _963 = fma(_835, _953, _961);
    float _965 = _427 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _967 = _427 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _969 = fma(_937, _963, _957);
    float _971 = _933 * _837;
    float _973 = fma(_425, (*spvDescriptorSet0.vp_c10)._m0[4].x, _965);
    float _975 = fma(_425, (*spvDescriptorSet0.vp_c10)._m0[5].x, _967);
    float _977 = _947 + _969;
    float _979 = fma(_939, _953, _971);
    float _981 = -_959;
    float _983 = fma(_839, _949, _981);
    float _985 = fma(_429, (*spvDescriptorSet0.vp_c10)._m0[4].z, _973);
    float _987 = fma(_429, (*spvDescriptorSet0.vp_c10)._m0[5].z, _975);
    float _989 = fma(_937, _983, _979);
    float _991 = _985 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _993 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _995 = _977 + _993;
    float _997 = _991 + _989;
    float _999 = _995 * _995;
    float _1001 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1003 = _997 + _1001;
    float _1005 = fma(_1003, _1003, _999);
    float _1007 = _933 * _835;
    float _1009 = _839 * _953;
    float _1011 = sqrt(_1005);
    float _1013 = fma(_939, _949, _1007);
    float _1015 = -_1009;
    float _1017 = fma(_837, _951, _1015);
    float _1019 = _987 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1021 = fma(_937, _1017, _1013);
    float _1023 = _1019 + _1021;
    bool _1025 = _1011 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1027 = _1021;
    float _1029 = _937;
    float _1031 = _977;
    float _1033 = _987;
    float _1035 = _1003;
    if (!_1025)
    {
        _1027 = _977;
    }
    float _1037 = _1027;
    float _1039 = _1037;
    if (!_1025)
    {
        _1029 = _997;
    }
    float _1041 = _1029;
    float _1043 = _1041;
    if (!_1025)
    {
        _1031 = _1023;
    }
    float _1045 = _1031;
    bool _1047 = !_1025;
    float _1049 = _1045;
    if (!_1047)
    {
        float _1051 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1053 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1055 = _1011 + _1053;
        float _1057 = _1023 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1059 = rsqrt(_1005);
        float _1061 = _1055 * _1051;
        float _1063 = _1061 * 0.15915493667125701904296875;
        float _1065 = _1063 * 6.283185482025146484375;
        float _1067 = cos(_1065);
        float _1069 = _1063 * 6.283185482025146484375;
        float _1071 = sin(_1069);
        float _1073 = _1067 + (-1.0);
        float _1075 = _1073 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1077 = fma(_1071, _1057, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1079 = fma(_1023, _1067, _1075);
        float _1081 = _1059 * _1077;
        float _1083 = fma(_1003, _1081, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1085 = fma(_995, _1081, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1049 = _1079;
        _1043 = _1083;
        _1039 = _1085;
    }
    float _1087 = _1049;
    float _1089 = _1043;
    float _1091 = _1039;
    float _1093 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1095 = _1087 + _1093;
    float _1097 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1099 = _1089 + _1097;
    float _1101 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1103 = _1091 + _1101;
    float _1105 = _1095 * _1095;
    float _1107 = fma(_1099, _1099, _1105);
    float _1109 = fma(_1103, _1103, _1107);
    float _1111 = rsqrt(_1109);
    float _1113 = _1111 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1115 = _1099 * _1113;
    float _1117 = _1103 * _1113;
    float _1119 = _1115 * _1115;
    float _1121 = _1117 * _1117;
    float _1123 = _1119 + _1121;
    float _1125 = sqrt(_1123);
    bool _1127 = _1125 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1129 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1131 = _1125 + _1129;
    float _1133 = _1111;
    float _1135 = _1123;
    float _1137 = _1131;
    float _1139 = _1095;
    if (_1127)
    {
        float _1141 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1133 = _1141;
    }
    float _1143 = _1133;
    if (_1127)
    {
        float _1145 = rsqrt(_1123);
        _1135 = _1145;
    }
    float _1147 = _1135;
    float _1149 = _1147;
    if (_1127)
    {
        float _1151 = _1131 * _1143;
        _1137 = _1151;
    }
    float _1153 = _1137;
    if (_1127)
    {
        float _1155 = _1153 * 0.15915493667125701904296875;
        _1033 = _1155;
    }
    float _1157 = _1033;
    float _1159 = _1103;
    if (_1127)
    {
        float _1161 = _1157 * 6.283185482025146484375;
        float _1163 = sin(_1161);
        _1159 = _1163;
    }
    float _1165 = _1159;
    float _1167 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1169 = precise::max(0.0, _1167);
    float _1171 = _1143;
    float _1173 = _1169;
    if (_1127)
    {
        float _1175 = _1157 * 6.283185482025146484375;
        float _1177 = cos(_1175);
        _1171 = _1177;
    }
    float _1179 = _1171;
    float _1181 = -_1113;
    float _1183 = -_1169;
    float _1185 = fma(_1095, _1181, _1183);
    if (_1127)
    {
        float _1187 = _1185 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1139 = _1187;
    }
    float _1189 = _1139;
    float _1191 = sqrt(_1109);
    float _1193 = _1189;
    float _1195 = _1165;
    if (_1127)
    {
        float _1197 = fma(_1165, _1189, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1193 = _1197;
    }
    float _1199 = _1193;
    float _1201 = _1199;
    if (!_1127)
    {
        _1195 = _1115;
    }
    float _1203 = _1195;
    float _1205 = _1203;
    float _1207 = _1179;
    if (_1127)
    {
        float _1209 = _1179 + (-1.0);
        _1173 = _1209;
    }
    float _1211 = _1173;
    float _1213 = _1211;
    if (_1127)
    {
        float _1215 = _1147 * _1199;
        _1035 = _1215;
    }
    float _1217 = _1035;
    if (!_1127)
    {
        _1201 = _1185;
    }
    float _1219 = _1201;
    float _1221 = _1219;
    if (_1127)
    {
        float _1223 = _1211 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _437 = _1223;
    }
    float _1225 = _437;
    if (_1127)
    {
        float _1227 = _1115 * _1217;
        _1205 = _1227;
    }
    float _1229 = _1205;
    if (!_1127)
    {
        _1213 = _1117;
    }
    float _1231 = _1213;
    float _1233 = _1231;
    if (_1127)
    {
        float _1235 = _1117 * _1217;
        _1233 = _1235;
    }
    float _1237 = _1233;
    if (!_1127)
    {
        _1149 = _1119;
    }
    float _1239 = _1149;
    float _1241 = _1239;
    if (_1127)
    {
        float _1243 = fma(_1185, _1179, _1225);
        _1221 = _1243;
    }
    float _1245 = _1221;
    if (_1127)
    {
        float _1247 = _1229 * _1229;
        _1241 = _1247;
    }
    float _1249 = _1241;
    if (!_1127)
    {
        _1207 = _1121;
    }
    float _1251 = _1207;
    float _1253 = _1251;
    if (_1127)
    {
        float _1255 = _1237 * _1237;
        _1253 = _1255;
    }
    float _1257 = _1253;
    float _1259 = fma(_1245, _1245, _1249);
    float _1261 = _1259 + _1257;
    float _1263 = _1087 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1265 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1267 = fma(_1191, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1265);
    float _1269 = precise::clamp(_1267, 0.0, 1.0);
    float _1271 = _1087 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1273 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1275 = fma(_1089, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1263);
    float _1277 = rsqrt(_1261);
    float _1279 = -_1269;
    float _1281 = _1279 + 1.0;
    float _1283 = _1087 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1285 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1275);
    float _1287 = fma(_1089, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1271);
    float _1289 = _1087 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1291 = _1285 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1293 = fma(_1089, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1283);
    float _1295 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1287);
    float _1297 = abs(_1281);
    float _1299 = log2(_1297);
    float _1301 = fma(_1089, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1289);
    float _1303 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1293);
    float _1305 = _1295 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1307 = _1291 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1309 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1301);
    float _1311 = _1303 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1313 = _1305 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1315 = _1277 * _1229;
    float _1317 = _1309 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1319 = _1277 * _1245;
    float _1321 = fma(_1311, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1313);
    float _1323 = _1315 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1325 = _1277 * _1237;
    float _1327 = -_1307;
    float _1329 = fma(_1327, _1273, 1.0);
    float _1331 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1321);
    float _1333 = _1299 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1335 = -_1323;
    float _1337 = fma(_1319, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1335);
    float _1339 = _1305 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1341 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1331);
    float _1343 = log2(_1329);
    float _1345 = -_1325;
    float _1347 = fma(_1345, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1337);
    float _1349 = _1305 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1351 = fma(_1311, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1339);
    float _1353 = fma(_1347, -0.5, 0.5);
    float _1355 = fma(_1311, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1349);
    float _1357 = fma(_1347, 0.5, 0.5);
    float _1359 = exp2(_1333);
    float _1361 = _1319 + 1.0;
    float _1363 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1351);
    float _1365 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1355);
    float _1367 = fma(_1357, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1369 = 1.0 / _1341;
    float _1371 = fma(_1357, _1367, -0.212114393711090087890625);
    float _1373 = fma(_1357, _1371, 1.570728778839111328125);
    float _1375 = sqrt(_1353);
    float _1377 = -_1319;
    float _1379 = fma(_1359, _1361, _1377);
    float _1381 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1363);
    float _1383 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1365);
    float _1385 = _1343 * 0.693147182464599609375;
    float _1387 = fma(_1379, 0.5, 0.5);
    float _1389 = _1381 * _1369;
    float _1391 = _1383 * _1369;
    float _1393 = _1385 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1395 = fma(_1389, 0.5, 0.5);
    float _1397 = fma(_1391, -0.5, 0.5);
    float _1399 = _1375 * 0.636619746685028076171875;
    float3 _3909 = float3(_1395, _1397, _1393);
    float _1401 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3909, float3(0.0), isnan(_3909)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3909, float3(0.0), isnan(_3909)), level(0.0)).x;
    float3 _3920 = float3(_1395, _1397, _1393);
    float4 _1404 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3920, float3(0.0), isnan(_3920)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3920, float3(0.0), isnan(_3920)), level(0.0)).xyzw;
    float _1406 = _1404.x;
    float _1408 = _1404.y;
    float _1410 = _1404.z;
    float _1412 = _1404.w;
    float _1414 = -_1373;
    float _1416 = fma(_1399, _1414, 1.0);
    float2 _3942 = float2(_1416, _1387);
    float3 _1420 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3942, float2(0.0), isnan(_3942)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3942, float2(0.0), isnan(_3942)), level(0.0)).xyz;
    float _1422 = _1420.x;
    float _1424 = _1420.y;
    float _1426 = _1420.z;
    float _1428 = in.m_54.z;
    float _1430 = in.m_54.w;
    float _1432 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _1434 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1436 = _1434 != 0;
    float _1438 = _1299 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1440 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1442 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1440;
    int _1444 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1446 = _1444 != 0;
    float _1448 = 1.0 / _1442;
    int _1450 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1452 = _1450 != 0;
    float _1454 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1456 = _821 + _1454;
    float _1458 = _1121;
    float _1460 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    float _1462 = _1442;
    if (!_1436)
    {
        float _1464 = in.m_54.z;
        _1458 = _1464;
    }
    float _1466 = _1458;
    float _1468 = exp2(_1438);
    if (!_1436)
    {
        float _1470 = in.m_54.y;
        _1460 = _1470;
    }
    float _1472 = _1460;
    bool _1474 = _1430 > 0.5;
    bool _1476 = _1428 > 0.5;
    float _1478 = _1456 * _1448;
    float _1480 = -_199;
    int _1482 = _1474 ? as_type<int>(_1480) : as_type<int>(_199);
    float _1484 = -_195;
    int _1486 = _1476 ? as_type<int>(_1484) : as_type<int>(_195);
    bool _1488 = !_1452;
    float _1490 = _1488 ? _199 : as_type<float>(_1482);
    bool _1492 = !_1446;
    float _1494 = _1492 ? _195 : as_type<float>(_1486);
    float _1496 = -_1468;
    float _1498 = _1496 + 1.0;
    bool _1500 = _821 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1502 = isnan(_821);
    bool _1504 = _1500 || _1502;
    bool _1506 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1508 = _1504 || _1506;
    float _1510 = float(_1508);
    float _1512 = _1498 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1514 = _1466;
    if (!_1436)
    {
        _1462 = _1466;
    }
    float _1516 = _1462;
    float _1518 = -_1510;
    float _1520 = _1518 + 1.0;
    float _1522 = _1472;
    float _1524 = _1516;
    if (_1436)
    {
        float _1526 = in.m_54.x;
        float _1528 = in.m_54.y;
        _1522 = _1526;
        _1524 = _1528;
    }
    float _1530 = _1522;
    float _1532 = _1524;
    bool _1534 = _821 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1536 = isnan(_821);
    bool _1538 = _1534 || _1536;
    bool _1540 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1542 = _1538 || _1540;
    float _1544 = float(_1542);
    float _1546 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1548 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1546;
    float _1550 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1552 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1550;
    float _1554 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1556 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1554;
    float _1558 = _1544 * _1520;
    float _1560 = fma(_1548, _1478, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1562 = fma(_1552, _1478, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1564 = fma(_1556, _1478, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1566 = -_1544;
    float _1568 = _1566 + 1.0;
    float _1570 = _1560 * _1558;
    float _1572 = _1562 * _1558;
    float _1574 = _1564 * _1558;
    float _1576 = fma(_1568, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1570);
    float _1578 = fma(_1568, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1572);
    float _1580 = fma(_1568, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1574);
    float _1582 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1584 = fma(_1510, (*spvDescriptorSet0.vp_c9)._m0[124].x, _1576);
    float _1586 = fma(_1510, (*spvDescriptorSet0.vp_c9)._m0[124].y, _1578);
    if (_1436)
    {
        _1514 = _1532;
    }
    float _1588 = _1514;
    float _1590 = _1532 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1592 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1594 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1596 = fma(_1530, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1582);
    float _1598 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1600 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1602 = _1530 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1604 = fma(_1590, -2.0, _1592);
    float _1606 = fma(_1588, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1594);
    float _1608 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1596);
    float _1610 = -_1600;
    float _1612 = fma(_1602, 2.0, _1610);
    float _1614 = _1305 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1616 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1604);
    float _1618 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1606);
    float _1620 = -_115;
    float _1622 = fma(_1620, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1612);
    float _1624 = fma(_1311, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1614);
    float _1626 = _1432 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1628 = _1494 + 0.5;
    float _1630 = -_1618;
    float _1632 = _1630 + 1.0;
    float _1634 = -_1608;
    float _1636 = _1634 + 1.0;
    float _1638 = _1598 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1640 = fma(_1626, _1628, _1622);
    float _1642 = _1490 + (-0.5);
    float _1644 = fma(_1510, (*spvDescriptorSet0.vp_c9)._m0[124].z, _1580);
    float _1646 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1624);
    float _1648 = _1586 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1650 = -_1638;
    float _1652 = -_1616;
    float _1654 = fma(_1650, _1642, _1652);
    float _1656 = -_1636;
    float _1658 = fma(_1494, _1656, _1640);
    float _1660 = _1381 + _1341;
    float _1662 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1646);
    float _1664 = fma(_1490, _1632, _1654);
    float _1666 = _1341 * 0.5;
    float _1668 = _1660 * 0.5;
    float _1670 = _1644 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1672 = fma(_1383, -0.5, _1666);
    float _1674 = _1584 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1676 = _1662 + _1341;
    out.m_58.z = _1658;
    out.m_58.w = _1664;
    float _1678 = _1648 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1680 = _1674 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1682 = _1670 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1684 = _1676 * 0.5;
    float _1686 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _1381;
    out.gl_Position.y = _1383;
    out.gl_Position.z = _1662;
    out.gl_Position.w = _1341;
    out.m_60.x = _1680;
    out.m_60.y = _1678;
    out.m_60.z = _1682;
    out.m_62.x = _1668;
    out.m_62.y = _1672;
    out.m_62.z = _1684;
    out.m_62.w = _1341;
    out.m_45.x = _1686;
    float _1688 = _1512 * _1401;
    float _1690 = -_1512;
    float _1692 = _1690 + 1.0;
    float _1694 = _1412 * _1688;
    float _1696 = _1412 * _1692;
    float _1698 = _1426 * _1688;
    float _1700 = fma(_1422, _1694, _1406);
    float _1702 = fma(_1424, _1694, _1408);
    float _1704 = fma(_1412, _1698, _1410);
    out.m_64.x = _1700;
    out.m_64.y = _1702;
    out.m_64.z = _1704;
    out.m_64.w = _1696;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    bool _811 = false;
    bool _627 = false;
    bool _477 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _78 = in.m_42.w;
    float _80 = trunc(_78);
    int _83 = int(_80);
    bool _87 = _83 >= 1;
    float _89 = 0.0;
    if (!_87)
    {
        _89 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _91 = _89;
    float _93 = _91;
    if (!_87)
    {
        out.m_45.x = 0.0;
    }
    int _95 = 0;
    if (!_87)
    {
        float _97 = _91 * 5.0;
        _95 = as_type<int>(_97);
    }
    int _99 = _95;
    if (!_87)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1760 = as_type<float>(_99);
        out.gl_Position.z = _1760;
    }
    if (!_87)
    {
        return out;
    }
    float _101 = in.m_47.w;
    bool _103 = _101 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _105 = isnan(_101);
    bool _107 = _103 || _105;
    bool _109 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _111 = _107 || _109;
    float _113 = -_101;
    float _115 = _113 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _117 = 0.0;
    float _119 = 0.0;
    float _121 = 0.0;
    if (_111)
    {
        float _123 = float(_83);
        _117 = _123;
    }
    float _125 = _117;
    bool _127 = _115 >= _125;
    bool _129 = !_111;
    bool _131 = _127 || _129;
    if (_131)
    {
        _93 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _93;
    if (_131)
    {
        out.m_45.x = 0.0;
    }
    int _135 = 0;
    if (_131)
    {
        float _137 = _133 * 5.0;
        _135 = as_type<int>(_137);
    }
    int _139 = _135;
    float _141 = as_type<float>(_139);
    if (_131)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1830 = as_type<float>(_139);
        out.gl_Position.z = _1830;
    }
    if (_131)
    {
        return out;
    }
    float _143 = as_type<float>(int(gl_VertexIndex));
    float _145 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _147 = in.m_47.x;
    float _149 = in.m_47.y;
    float _151 = in.m_47.z;
    bool _153 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _155 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _157 = _153 || _155;
    bool _159 = isnan(1.0);
    bool _161 = _157 || _159;
    float _163 = _145;
    if (!_161)
    {
        float _165 = _145 * _145;
        float _167 = _165 * 0.5;
        _141 = _167;
    }
    float _169 = _141;
    float _171 = 0.0;
    float _173 = _169;
    if (!_161)
    {
        float _175 = _115 * _115;
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
    int _185 = as_type<int>(_143) & 1;
    bool _187 = _185 != 0;
    int _189 = as_type<int>(_143) & 2;
    bool _191 = _189 != 0;
    bool _193 = !_187;
    float _195 = _193 ? (-0.5) : 0.5;
    bool _197 = !_191;
    float _199 = _197 ? (-0.5) : 0.5;
    bool _201 = !_161;
    float _203 = _183;
    if (!_201)
    {
        float _205 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _207 = log2(_205);
        float _209 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _211 = _209 + 1.0;
        float _213 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _215 = _145 * _207;
        float _217 = 1.0 / _211;
        float _219 = _213 * 0.693147182464599609375;
        float _221 = exp2(_215);
        float _223 = 1.0 / _219;
        float _225 = _221 + (-1.0);
        float _227 = -_225;
        float _229 = fma(_227, _223, _145);
        float _231 = _229 * _217;
        float _233 = _231 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _119 = _223;
        _203 = _233;
        _121 = _221;
    }
    float _235 = _119;
    float _237 = _203;
    float _239 = _121;
    bool _241 = !_161;
    float _243 = _235;
    float _245 = _239;
    if (!_241)
    {
        float _247 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _249 = log2(_247);
        float _251 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _253 = _251 + 1.0;
        float _255 = 1.0 / _253;
        float _257 = _145 * _249;
        float _259 = exp2(_257);
        float _261 = -_259;
        float _263 = _261 + 1.0;
        float _265 = _263 * _255;
        _243 = _259;
        _245 = _253;
        _163 = _265;
    }
    float _267 = _243;
    float _269 = _245;
    float _271 = _163;
    float _273 = _269;
    float _275 = _267;
    if (!_161)
    {
        _273 = _115;
    }
    float _277 = _273;
    float _279 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _281 = _277;
    if (!_161)
    {
        float _283 = _179 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _275 = _283;
    }
    float _285 = _275;
    bool _287 = !_161;
    float _289 = _285;
    if (!_287)
    {
        float _291 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _293 = log2(_291);
        float _295 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _297 = _295 + 1.0;
        float _299 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _301 = _115 * _293;
        float _303 = exp2(_301);
        float _305 = _299 * 0.693147182464599609375;
        float _307 = 1.0 / _305;
        float _309 = 1.0 / _297;
        float _311 = _303 + (-1.0);
        float _313 = -_311;
        float _315 = fma(_313, _307, _115);
        float _317 = _315 * _309;
        float _319 = _317 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _289 = _319;
    }
    float _321 = _289;
    bool _323 = !_161;
    if (!_323)
    {
        float _325 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _327 = log2(_325);
        float _329 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _331 = _329 + 1.0;
        float _333 = 1.0 / _331;
        float _335 = _115 * _327;
        float _337 = exp2(_335);
        float _339 = -_337;
        float _341 = _339 + 1.0;
        float _343 = _341 * _333;
        _281 = _343;
    }
    float _345 = _281;
    float _347 = _321 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _349 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _351 = fma(_271, _149, _279);
    float _353 = _321 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _355 = fma(_345, _149, _347);
    float _357 = fma(_271, _147, _349);
    float _359 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _361 = _321 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _363 = fma(_345, _147, _353);
    float _365 = -_355;
    float _367 = _351 + _365;
    float _369 = fma(_271, _151, _359);
    float _371 = fma(_345, _151, _361);
    float _373 = -_363;
    float _375 = _357 + _373;
    float _377 = _367 * _367;
    float _379 = in.m_52.w;
    float _381 = -_371;
    float _383 = _369 + _381;
    float _385 = _367 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _387 = fma(_375, _375, _377);
    float _389 = _367 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _391 = _367 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _393 = fma(_375, (*spvDescriptorSet0.vp_c10)._m0[4].x, _385);
    float _395 = fma(_383, _383, _387);
    float _397 = fma(_375, (*spvDescriptorSet0.vp_c10)._m0[5].x, _389);
    float _399 = in.m_42.x;
    float _401 = in.m_42.y;
    float _403 = in.m_42.z;
    float _405 = fma(_375, (*spvDescriptorSet0.vp_c10)._m0[6].x, _391);
    float _407 = fma(_383, (*spvDescriptorSet0.vp_c10)._m0[4].z, _393);
    float _409 = sqrt(_395);
    bool _411 = _409 >= 9.9999999747524270787835121154785e-07;
    bool _413 = isnan(_409);
    bool _415 = _411 || _413;
    bool _417 = isnan(9.9999999747524270787835121154785e-07);
    bool _419 = _415 || _417;
    float _421 = fma(_383, (*spvDescriptorSet0.vp_c10)._m0[5].z, _397);
    float _423 = fma(_383, (*spvDescriptorSet0.vp_c10)._m0[6].z, _405);
    float _425 = fma(_357, _379, _399);
    float _427 = fma(_351, _379, _401);
    float _429 = fma(_369, _379, _403);
    float _431 = _421;
    float _433 = _407;
    float _435 = _423;
    float _437 = _429;
    if (!_419)
    {
        bool _439 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _441 = !_439;
        if (!_441)
        {
            float _443 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _445 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _447 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _449 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _443);
            float _451 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _445);
            float _453 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _447);
            float _455 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _449);
            float _457 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _451);
            float _459 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _453);
            float _461 = _455 * _455;
            float _463 = fma(_457, _457, _461);
            float _465 = fma(_459, _459, _463);
            float _467 = rsqrt(_465);
            float _469 = _467 * 9.9999999747524270787835121154785e-07;
            float _471 = _457 * _469;
            float _473 = _455 * _469;
            float _475 = _459 * _469;
            _431 = _473;
            _433 = _471;
            _435 = _475;
            _477 = true;
        }
        else
        {
            float _479 = _149 * _149;
            float _481 = fma(_147, _147, _479);
            float _483 = fma(_151, _151, _481);
            float _485 = sqrt(_483);
            bool _487 = _485 >= 9.9999999747524270787835121154785e-07;
            bool _489 = isnan(_485);
            bool _491 = _487 || _489;
            bool _493 = isnan(9.9999999747524270787835121154785e-07);
            bool _495 = _491 || _493;
            if (!_495)
            {
                float _497 = _401 * _401;
                float _499 = fma(_399, _399, _497);
                float _501 = fma(_403, _403, _499);
                float _503 = sqrt(_501);
                bool _505 = _503 >= 9.9999999747524270787835121154785e-07;
                bool _507 = isnan(_503);
                bool _509 = _505 || _507;
                bool _511 = isnan(9.9999999747524270787835121154785e-07);
                bool _513 = _509 || _511;
                if (!_513)
                {
                    float _515 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _517 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _515);
                    float _519 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _517);
                    float _521 = rsqrt(_519);
                    float _523 = _521 * 9.9999999747524270787835121154785e-07;
                    float _525 = _523 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _527 = _523 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _529 = _523 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _431 = _527;
                    _433 = _525;
                    _435 = _529;
                    _477 = true;
                }
                else
                {
                    float _531 = _401 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _533 = _401 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _535 = _401 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _537 = fma(_399, (*spvDescriptorSet0.vp_c10)._m0[5].x, _531);
                    float _539 = fma(_399, (*spvDescriptorSet0.vp_c10)._m0[4].x, _533);
                    float _541 = fma(_399, (*spvDescriptorSet0.vp_c10)._m0[6].x, _535);
                    float _543 = fma(_403, (*spvDescriptorSet0.vp_c10)._m0[5].z, _537);
                    float _545 = fma(_403, (*spvDescriptorSet0.vp_c10)._m0[4].z, _539);
                    float _547 = fma(_403, (*spvDescriptorSet0.vp_c10)._m0[6].z, _541);
                    float _549 = _543 * _543;
                    float _551 = fma(_545, _545, _549);
                    float _553 = fma(_547, _547, _551);
                    float _555 = rsqrt(_553);
                    float _557 = _555 * 9.9999999747524270787835121154785e-07;
                    float _559 = _545 * _557;
                    float _561 = _543 * _557;
                    float _563 = _547 * _557;
                    _431 = _561;
                    _433 = _559;
                    _435 = _563;
                    _477 = true;
                }
            }
            else
            {
                float _565 = _149 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _567 = _149 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _569 = _149 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _571 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[5].x, _565);
                float _573 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[4].x, _567);
                float _575 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[6].x, _569);
                float _577 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[5].z, _571);
                float _579 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[4].z, _573);
                float _581 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[6].z, _575);
                float _583 = _577 * _577;
                float _585 = fma(_579, _579, _583);
                float _587 = fma(_581, _581, _585);
                float _589 = rsqrt(_587);
                float _591 = _589 * 9.9999999747524270787835121154785e-07;
                float _593 = _579 * _591;
                float _595 = _577 * _591;
                float _597 = _581 * _591;
                _431 = _595;
                _433 = _593;
                _435 = _597;
            }
        }
    }
    _477 = false;
    float _599 = _431;
    float _601 = _433;
    float _603 = _435;
    bool _605 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    bool _607 = !_605;
    float _625;
    if (!_607)
    {
        float _609 = in.m_54.x;
        float _611 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _613 = _609 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _615 = fma(_613, (*spvDescriptorSet0.vp_c9)._m0[11].y, _115);
        float _617 = _615 * _611;
        float _619 = floor(_617);
        float _621 = -_619;
        float _623 = _617 + _621;
        _625 = _623;
        _627 = true;
    }
    else
    {
        float _629 = float(_83);
        float _631 = 1.0 / _629;
        float _633 = _115 * _631;
        _625 = _633;
    }
    _627 = false;
    float _635 = _625;
    float _637 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _639 = _635 + _637;
    float _641 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _643 = _641 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _645 = _635 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _647 = isnan(_635);
    bool _649 = _645 || _647;
    bool _651 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _653 = _649 || _651;
    float _655 = float(_653);
    float _657 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _659 = _657 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _661 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _663 = _661 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _665 = _635 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _667 = isnan(_635);
    bool _669 = _665 || _667;
    bool _671 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _673 = _669 || _671;
    float _675 = float(_673);
    float _677 = 1.0 / _643;
    float _679 = -_655;
    float _681 = _679 + 1.0;
    float _683 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _685 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _683;
    bool _687 = _635 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _689 = isnan(_635);
    bool _691 = _687 || _689;
    bool _693 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _695 = _691 || _693;
    float _697 = float(_695);
    float _699 = _675 * _681;
    float _701 = -_675;
    float _703 = _701 + 1.0;
    bool _705 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _707 = 1.0 / _659;
    float _709 = _697 * _703;
    float _711 = -_697;
    float _713 = _711 + 1.0;
    float _715 = 1.0 / _663;
    float _717 = _685 * _677;
    float _719 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _721 = _719 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _723 = fma(_717, _639, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _725 = _721 * _707;
    bool _727 = _635 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _729 = isnan(_635);
    bool _731 = _727 || _729;
    bool _733 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _735 = _731 || _733;
    float _737 = float(_735);
    float _739 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _741 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _739;
    float _743 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _745 = _635 + _743;
    float _747 = _723 * _709;
    float _749 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _751 = _635 + _749;
    float _753 = -_737;
    float _755 = _753 + 1.0;
    float _757 = fma(_725, _745, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _759 = _741 * _715;
    float _761 = fma(_713, (*spvDescriptorSet0.vp_c9)._m0[115].x, _747);
    float _763 = _655 * _755;
    float _765 = fma(_759, _751, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _767 = fma(_757, _699, _761);
    float _769 = fma(_765, _763, _767);
    float _771 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _773 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _775 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _777 = fma(_737, (*spvDescriptorSet0.vp_c9)._m0[118].x, _769);
    float _779 = _771 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _781 = _773 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _783 = _775 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _785 = _777 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_56.x = _779;
    out.m_56.y = _781;
    out.m_56.z = _783;
    out.m_56.w = _785;
    bool _787 = !_705;
    float _789 = _771;
    float _791 = _773;
    float _809;
    if (!_787)
    {
        float _793 = in.m_54.x;
        float _795 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _797 = _793 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _799 = fma(_797, (*spvDescriptorSet0.vp_c9)._m0[11].z, _115);
        float _801 = _799 * _795;
        float _803 = floor(_801);
        float _805 = -_803;
        float _807 = _801 + _805;
        _789 = _795;
        _809 = _807;
        _811 = true;
    }
    else
    {
        float _813 = float(_83);
        float _815 = 1.0 / _813;
        float _817 = _115 * _815;
        _809 = _817;
    }
    _811 = false;
    float _819 = _789;
    float _821 = _809;
    float _823 = _599 * _599;
    float _825 = in.m_52.x;
    float _827 = in.m_52.y;
    float _829 = fma(_601, _601, _823);
    float _831 = fma(_603, _603, _829);
    float _833 = rsqrt(_831);
    float _835 = _833 * _599;
    float _837 = _833 * _601;
    float _839 = _833 * _603;
    float _841 = _835 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _843 = fma(_837, (*spvDescriptorSet0.vp_c10)._m0[8].y, _841);
    float _845 = fma(_839, (*spvDescriptorSet0.vp_c10)._m0[10].y, _843);
    float _847 = abs(_845);
    bool _849 = _847 > 0.99989998340606689453125;
    float _851 = _845;
    float _853 = _819;
    float _855 = _833;
    if (_849)
    {
        _851 = 0.001000000047497451305389404296875;
    }
    float _857 = _851;
    if (!_849)
    {
        _791 = (*spvDescriptorSet0.vp_c10)._m0[8].y;
    }
    float _859 = _791;
    float _861 = _859;
    if (!_849)
    {
        _853 = (*spvDescriptorSet0.vp_c10)._m0[10].y;
    }
    float _863 = _853;
    float _865 = _863;
    if (_849)
    {
        float _867 = fma(_857, (*spvDescriptorSet0.vp_c10)._m0[8].z, (*spvDescriptorSet0.vp_c10)._m0[8].y);
        _861 = _867;
    }
    float _869 = _861;
    if (_849)
    {
        float _871 = fma(_857, (*spvDescriptorSet0.vp_c10)._m0[10].z, (*spvDescriptorSet0.vp_c10)._m0[10].y);
        _865 = _871;
    }
    float _873 = _865;
    if (!_849)
    {
        _855 = (*spvDescriptorSet0.vp_c10)._m0[9].y;
    }
    float _875 = _855;
    float _877 = _875;
    if (_849)
    {
        float _879 = fma(_857, (*spvDescriptorSet0.vp_c10)._m0[9].z, (*spvDescriptorSet0.vp_c10)._m0[9].y);
        _877 = _879;
    }
    float _881 = _877;
    float _883 = -_869;
    float _885 = _839 * _883;
    float _887 = -_873;
    float _889 = _835 * _887;
    float _891 = -_873;
    float _893 = -_885;
    float _895 = fma(_837, _891, _893);
    float _897 = -_881;
    float _899 = -_889;
    float _901 = fma(_839, _897, _899);
    float _903 = -_881;
    float _905 = _837 * _903;
    float _907 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _195);
    float _909 = _895 * _895;
    float _911 = -_869;
    float _913 = -_905;
    float _915 = fma(_835, _911, _913);
    float _917 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _199);
    float _919 = fma(_901, _901, _909);
    float _921 = _827 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _923 = fma(_915, _915, _919);
    float _925 = _825 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _927 = _921 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _929 = rsqrt(_923);
    float _931 = _925 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _933 = _927 * _917;
    float _935 = _427 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _937 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _939 = _931 * _907;
    float _941 = fma(_425, (*spvDescriptorSet0.vp_c10)._m0[6].x, _935);
    float _943 = _933 * _839;
    float _945 = fma(_429, (*spvDescriptorSet0.vp_c10)._m0[6].z, _941);
    float _947 = _945 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _949 = _895 * _929;
    float _951 = _915 * _929;
    float _953 = _901 * _929;
    float _955 = _837 * _949;
    float _957 = fma(_939, _951, _943);
    float _959 = _835 * _951;
    float _961 = -_955;
    float _963 = fma(_835, _953, _961);
    float _965 = _427 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _967 = _427 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _969 = fma(_937, _963, _957);
    float _971 = _933 * _837;
    float _973 = fma(_425, (*spvDescriptorSet0.vp_c10)._m0[4].x, _965);
    float _975 = fma(_425, (*spvDescriptorSet0.vp_c10)._m0[5].x, _967);
    float _977 = _947 + _969;
    float _979 = fma(_939, _953, _971);
    float _981 = -_959;
    float _983 = fma(_839, _949, _981);
    float _985 = fma(_429, (*spvDescriptorSet0.vp_c10)._m0[4].z, _973);
    float _987 = fma(_429, (*spvDescriptorSet0.vp_c10)._m0[5].z, _975);
    float _989 = fma(_937, _983, _979);
    float _991 = _985 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _993 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _995 = _977 + _993;
    float _997 = _991 + _989;
    float _999 = _995 * _995;
    float _1001 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1003 = _997 + _1001;
    float _1005 = fma(_1003, _1003, _999);
    float _1007 = _933 * _835;
    float _1009 = _839 * _953;
    float _1011 = sqrt(_1005);
    float _1013 = fma(_939, _949, _1007);
    float _1015 = -_1009;
    float _1017 = fma(_837, _951, _1015);
    float _1019 = _987 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1021 = fma(_937, _1017, _1013);
    float _1023 = _1019 + _1021;
    bool _1025 = _1011 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1027 = _1021;
    float _1029 = _937;
    float _1031 = _977;
    float _1033 = _987;
    float _1035 = _1003;
    if (!_1025)
    {
        _1027 = _977;
    }
    float _1037 = _1027;
    float _1039 = _1037;
    if (!_1025)
    {
        _1029 = _997;
    }
    float _1041 = _1029;
    float _1043 = _1041;
    if (!_1025)
    {
        _1031 = _1023;
    }
    float _1045 = _1031;
    bool _1047 = !_1025;
    float _1049 = _1045;
    if (!_1047)
    {
        float _1051 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1053 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1055 = _1011 + _1053;
        float _1057 = _1023 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1059 = rsqrt(_1005);
        float _1061 = _1055 * _1051;
        float _1063 = _1061 * 0.15915493667125701904296875;
        float _1065 = _1063 * 6.283185482025146484375;
        float _1067 = cos(_1065);
        float _1069 = _1063 * 6.283185482025146484375;
        float _1071 = sin(_1069);
        float _1073 = _1067 + (-1.0);
        float _1075 = _1073 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1077 = fma(_1071, _1057, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1079 = fma(_1023, _1067, _1075);
        float _1081 = _1059 * _1077;
        float _1083 = fma(_1003, _1081, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1085 = fma(_995, _1081, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1049 = _1079;
        _1043 = _1083;
        _1039 = _1085;
    }
    float _1087 = _1049;
    float _1089 = _1043;
    float _1091 = _1039;
    float _1093 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1095 = _1087 + _1093;
    float _1097 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1099 = _1089 + _1097;
    float _1101 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1103 = _1091 + _1101;
    float _1105 = _1095 * _1095;
    float _1107 = fma(_1099, _1099, _1105);
    float _1109 = fma(_1103, _1103, _1107);
    float _1111 = rsqrt(_1109);
    float _1113 = _1111 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1115 = _1099 * _1113;
    float _1117 = _1103 * _1113;
    float _1119 = _1115 * _1115;
    float _1121 = _1117 * _1117;
    float _1123 = _1119 + _1121;
    float _1125 = sqrt(_1123);
    bool _1127 = _1125 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1129 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1131 = _1125 + _1129;
    float _1133 = _1111;
    float _1135 = _1123;
    float _1137 = _1131;
    float _1139 = _1095;
    if (_1127)
    {
        float _1141 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1133 = _1141;
    }
    float _1143 = _1133;
    if (_1127)
    {
        float _1145 = rsqrt(_1123);
        _1135 = _1145;
    }
    float _1147 = _1135;
    float _1149 = _1147;
    if (_1127)
    {
        float _1151 = _1131 * _1143;
        _1137 = _1151;
    }
    float _1153 = _1137;
    if (_1127)
    {
        float _1155 = _1153 * 0.15915493667125701904296875;
        _1033 = _1155;
    }
    float _1157 = _1033;
    float _1159 = _1103;
    if (_1127)
    {
        float _1161 = _1157 * 6.283185482025146484375;
        float _1163 = sin(_1161);
        _1159 = _1163;
    }
    float _1165 = _1159;
    float _1167 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1169 = precise::max(0.0, _1167);
    float _1171 = _1143;
    float _1173 = _1169;
    if (_1127)
    {
        float _1175 = _1157 * 6.283185482025146484375;
        float _1177 = cos(_1175);
        _1171 = _1177;
    }
    float _1179 = _1171;
    float _1181 = -_1113;
    float _1183 = -_1169;
    float _1185 = fma(_1095, _1181, _1183);
    if (_1127)
    {
        float _1187 = _1185 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1139 = _1187;
    }
    float _1189 = _1139;
    float _1191 = sqrt(_1109);
    float _1193 = _1189;
    float _1195 = _1165;
    if (_1127)
    {
        float _1197 = fma(_1165, _1189, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1193 = _1197;
    }
    float _1199 = _1193;
    float _1201 = _1199;
    if (!_1127)
    {
        _1195 = _1115;
    }
    float _1203 = _1195;
    float _1205 = _1203;
    float _1207 = _1179;
    if (_1127)
    {
        float _1209 = _1179 + (-1.0);
        _1173 = _1209;
    }
    float _1211 = _1173;
    float _1213 = _1211;
    if (_1127)
    {
        float _1215 = _1147 * _1199;
        _1035 = _1215;
    }
    float _1217 = _1035;
    if (!_1127)
    {
        _1201 = _1185;
    }
    float _1219 = _1201;
    float _1221 = _1219;
    if (_1127)
    {
        float _1223 = _1211 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _437 = _1223;
    }
    float _1225 = _437;
    if (_1127)
    {
        float _1227 = _1115 * _1217;
        _1205 = _1227;
    }
    float _1229 = _1205;
    if (!_1127)
    {
        _1213 = _1117;
    }
    float _1231 = _1213;
    float _1233 = _1231;
    if (_1127)
    {
        float _1235 = _1117 * _1217;
        _1233 = _1235;
    }
    float _1237 = _1233;
    if (!_1127)
    {
        _1149 = _1119;
    }
    float _1239 = _1149;
    float _1241 = _1239;
    if (_1127)
    {
        float _1243 = fma(_1185, _1179, _1225);
        _1221 = _1243;
    }
    float _1245 = _1221;
    if (_1127)
    {
        float _1247 = _1229 * _1229;
        _1241 = _1247;
    }
    float _1249 = _1241;
    if (!_1127)
    {
        _1207 = _1121;
    }
    float _1251 = _1207;
    float _1253 = _1251;
    if (_1127)
    {
        float _1255 = _1237 * _1237;
        _1253 = _1255;
    }
    float _1257 = _1253;
    float _1259 = fma(_1245, _1245, _1249);
    float _1261 = _1259 + _1257;
    float _1263 = _1087 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1265 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1267 = fma(_1191, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1265);
    float _1269 = precise::clamp(_1267, 0.0, 1.0);
    float _1271 = _1087 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1273 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1275 = fma(_1089, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1263);
    float _1277 = rsqrt(_1261);
    float _1279 = -_1269;
    float _1281 = _1279 + 1.0;
    float _1283 = _1087 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1285 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1275);
    float _1287 = fma(_1089, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1271);
    float _1289 = _1087 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1291 = _1285 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1293 = fma(_1089, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1283);
    float _1295 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1287);
    float _1297 = abs(_1281);
    float _1299 = log2(_1297);
    float _1301 = fma(_1089, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1289);
    float _1303 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1293);
    float _1305 = _1295 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1307 = _1291 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1309 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1301);
    float _1311 = _1303 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1313 = _1305 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1315 = _1277 * _1229;
    float _1317 = _1309 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1319 = _1277 * _1245;
    float _1321 = fma(_1311, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1313);
    float _1323 = _1315 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1325 = _1277 * _1237;
    float _1327 = -_1307;
    float _1329 = fma(_1327, _1273, 1.0);
    float _1331 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1321);
    float _1333 = _1299 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1335 = -_1323;
    float _1337 = fma(_1319, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1335);
    float _1339 = _1305 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1341 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1331);
    float _1343 = log2(_1329);
    float _1345 = -_1325;
    float _1347 = fma(_1345, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1337);
    float _1349 = _1305 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1351 = fma(_1311, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1339);
    float _1353 = fma(_1347, -0.5, 0.5);
    float _1355 = fma(_1311, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1349);
    float _1357 = fma(_1347, 0.5, 0.5);
    float _1359 = exp2(_1333);
    float _1361 = _1319 + 1.0;
    float _1363 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1351);
    float _1365 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1355);
    float _1367 = fma(_1357, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1369 = 1.0 / _1341;
    float _1371 = fma(_1357, _1367, -0.212114393711090087890625);
    float _1373 = fma(_1357, _1371, 1.570728778839111328125);
    float _1375 = sqrt(_1353);
    float _1377 = -_1319;
    float _1379 = fma(_1359, _1361, _1377);
    float _1381 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1363);
    float _1383 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1365);
    float _1385 = _1343 * 0.693147182464599609375;
    float _1387 = fma(_1379, 0.5, 0.5);
    float _1389 = _1381 * _1369;
    float _1391 = _1383 * _1369;
    float _1393 = _1385 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1395 = fma(_1389, 0.5, 0.5);
    float _1397 = fma(_1391, -0.5, 0.5);
    float _1399 = _1375 * 0.636619746685028076171875;
    float3 _3909 = float3(_1395, _1397, _1393);
    float _1401 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3909, float3(0.0), isnan(_3909)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3909, float3(0.0), isnan(_3909)), level(0.0)).x;
    float3 _3920 = float3(_1395, _1397, _1393);
    float4 _1404 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3920, float3(0.0), isnan(_3920)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3920, float3(0.0), isnan(_3920)), level(0.0)).xyzw;
    float _1406 = _1404.x;
    float _1408 = _1404.y;
    float _1410 = _1404.z;
    float _1412 = _1404.w;
    float _1414 = -_1373;
    float _1416 = fma(_1399, _1414, 1.0);
    float2 _3942 = float2(_1416, _1387);
    float3 _1420 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3942, float2(0.0), isnan(_3942)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3942, float2(0.0), isnan(_3942)), level(0.0)).xyz;
    float _1422 = _1420.x;
    float _1424 = _1420.y;
    float _1426 = _1420.z;
    float _1428 = in.m_54.z;
    float _1430 = in.m_54.w;
    float _1432 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _1434 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1436 = _1434 != 0;
    float _1438 = _1299 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1440 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1442 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1440;
    int _1444 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1446 = _1444 != 0;
    float _1448 = 1.0 / _1442;
    int _1450 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1452 = _1450 != 0;
    float _1454 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1456 = _821 + _1454;
    float _1458 = _1121;
    float _1460 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    float _1462 = _1442;
    if (!_1436)
    {
        float _1464 = in.m_54.z;
        _1458 = _1464;
    }
    float _1466 = _1458;
    float _1468 = exp2(_1438);
    if (!_1436)
    {
        float _1470 = in.m_54.y;
        _1460 = _1470;
    }
    float _1472 = _1460;
    bool _1474 = _1430 > 0.5;
    bool _1476 = _1428 > 0.5;
    float _1478 = _1456 * _1448;
    float _1480 = -_199;
    int _1482 = _1474 ? as_type<int>(_1480) : as_type<int>(_199);
    float _1484 = -_195;
    int _1486 = _1476 ? as_type<int>(_1484) : as_type<int>(_195);
    bool _1488 = !_1452;
    float _1490 = _1488 ? _199 : as_type<float>(_1482);
    bool _1492 = !_1446;
    float _1494 = _1492 ? _195 : as_type<float>(_1486);
    float _1496 = -_1468;
    float _1498 = _1496 + 1.0;
    bool _1500 = _821 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1502 = isnan(_821);
    bool _1504 = _1500 || _1502;
    bool _1506 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1508 = _1504 || _1506;
    float _1510 = float(_1508);
    float _1512 = _1498 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1514 = _1466;
    if (!_1436)
    {
        _1462 = _1466;
    }
    float _1516 = _1462;
    float _1518 = -_1510;
    float _1520 = _1518 + 1.0;
    float _1522 = _1472;
    float _1524 = _1516;
    if (_1436)
    {
        float _1526 = in.m_54.x;
        float _1528 = in.m_54.y;
        _1522 = _1526;
        _1524 = _1528;
    }
    float _1530 = _1522;
    float _1532 = _1524;
    bool _1534 = _821 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1536 = isnan(_821);
    bool _1538 = _1534 || _1536;
    bool _1540 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1542 = _1538 || _1540;
    float _1544 = float(_1542);
    float _1546 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1548 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1546;
    float _1550 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1552 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1550;
    float _1554 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1556 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1554;
    float _1558 = _1544 * _1520;
    float _1560 = fma(_1548, _1478, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1562 = fma(_1552, _1478, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1564 = fma(_1556, _1478, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1566 = -_1544;
    float _1568 = _1566 + 1.0;
    float _1570 = _1560 * _1558;
    float _1572 = _1562 * _1558;
    float _1574 = _1564 * _1558;
    float _1576 = fma(_1568, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1570);
    float _1578 = fma(_1568, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1572);
    float _1580 = fma(_1568, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1574);
    float _1582 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1584 = fma(_1510, (*spvDescriptorSet0.vp_c9)._m0[124].x, _1576);
    float _1586 = fma(_1510, (*spvDescriptorSet0.vp_c9)._m0[124].y, _1578);
    if (_1436)
    {
        _1514 = _1532;
    }
    float _1588 = _1514;
    float _1590 = _1532 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1592 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1594 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1596 = fma(_1530, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1582);
    float _1598 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1600 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1602 = _1530 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1604 = fma(_1590, -2.0, _1592);
    float _1606 = fma(_1588, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1594);
    float _1608 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1596);
    float _1610 = -_1600;
    float _1612 = fma(_1602, 2.0, _1610);
    float _1614 = _1305 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1616 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1604);
    float _1618 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1606);
    float _1620 = -_115;
    float _1622 = fma(_1620, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1612);
    float _1624 = fma(_1311, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1614);
    float _1626 = _1432 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1628 = _1494 + 0.5;
    float _1630 = -_1618;
    float _1632 = _1630 + 1.0;
    float _1634 = -_1608;
    float _1636 = _1634 + 1.0;
    float _1638 = _1598 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1640 = fma(_1626, _1628, _1622);
    float _1642 = _1490 + (-0.5);
    float _1644 = fma(_1510, (*spvDescriptorSet0.vp_c9)._m0[124].z, _1580);
    float _1646 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1624);
    float _1648 = _1586 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1650 = -_1638;
    float _1652 = -_1616;
    float _1654 = fma(_1650, _1642, _1652);
    float _1656 = -_1636;
    float _1658 = fma(_1494, _1656, _1640);
    float _1660 = _1381 + _1341;
    float _1662 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1646);
    float _1664 = fma(_1490, _1632, _1654);
    float _1666 = _1341 * 0.5;
    float _1668 = _1660 * 0.5;
    float _1670 = _1644 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1672 = fma(_1383, -0.5, _1666);
    float _1674 = _1584 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1676 = _1662 + _1341;
    out.m_58.z = _1658;
    out.m_58.w = _1664;
    float _1678 = _1648 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1680 = _1674 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1682 = _1670 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1684 = _1676 * 0.5;
    float _1686 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _1381;
    out.gl_Position.y = _1383;
    out.gl_Position.z = _1662;
    out.gl_Position.w = _1341;
    out.m_60.x = _1680;
    out.m_60.y = _1678;
    out.m_60.z = _1682;
    out.m_62.x = _1668;
    out.m_62.y = _1672;
    out.m_62.z = _1684;
    out.m_62.w = _1341;
    out.m_45.x = _1686;
    float _1688 = _1512 * _1401;
    float _1690 = -_1512;
    float _1692 = _1690 + 1.0;
    float _1694 = _1412 * _1688;
    float _1696 = _1412 * _1692;
    float _1698 = _1426 * _1688;
    float _1700 = fma(_1422, _1694, _1406);
    float _1702 = fma(_1424, _1694, _1408);
    float _1704 = fma(_1412, _1698, _1410);
    out.m_64.x = _1700;
    out.m_64.y = _1702;
    out.m_64.z = _1704;
    out.m_64.w = _1696;
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
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    bool _811 = false;
    bool _627 = false;
    bool _477 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _78 = in.m_42.w;
    float _80 = trunc(_78);
    int _83 = int(_80);
    bool _87 = _83 >= 1;
    float _89 = 0.0;
    if (!_87)
    {
        _89 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _91 = _89;
    float _93 = _91;
    if (!_87)
    {
        out.m_45.x = 0.0;
    }
    int _95 = 0;
    if (!_87)
    {
        float _97 = _91 * 5.0;
        _95 = as_type<int>(_97);
    }
    int _99 = _95;
    if (!_87)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1760 = as_type<float>(_99);
        out.gl_Position.z = _1760;
    }
    if (!_87)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _101 = in.m_47.w;
    bool _103 = _101 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _105 = isnan(_101);
    bool _107 = _103 || _105;
    bool _109 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _111 = _107 || _109;
    float _113 = -_101;
    float _115 = _113 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _117 = 0.0;
    float _119 = 0.0;
    float _121 = 0.0;
    if (_111)
    {
        float _123 = float(_83);
        _117 = _123;
    }
    float _125 = _117;
    bool _127 = _115 >= _125;
    bool _129 = !_111;
    bool _131 = _127 || _129;
    if (_131)
    {
        _93 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _93;
    if (_131)
    {
        out.m_45.x = 0.0;
    }
    int _135 = 0;
    if (_131)
    {
        float _137 = _133 * 5.0;
        _135 = as_type<int>(_137);
    }
    int _139 = _135;
    float _141 = as_type<float>(_139);
    if (_131)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1830 = as_type<float>(_139);
        out.gl_Position.z = _1830;
    }
    if (_131)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _143 = as_type<float>(int(gl_VertexIndex));
    float _145 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _147 = in.m_47.x;
    float _149 = in.m_47.y;
    float _151 = in.m_47.z;
    bool _153 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _155 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _157 = _153 || _155;
    bool _159 = isnan(1.0);
    bool _161 = _157 || _159;
    float _163 = _145;
    if (!_161)
    {
        float _165 = _145 * _145;
        float _167 = _165 * 0.5;
        _141 = _167;
    }
    float _169 = _141;
    float _171 = 0.0;
    float _173 = _169;
    if (!_161)
    {
        float _175 = _115 * _115;
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
    int _185 = as_type<int>(_143) & 1;
    bool _187 = _185 != 0;
    int _189 = as_type<int>(_143) & 2;
    bool _191 = _189 != 0;
    bool _193 = !_187;
    float _195 = _193 ? (-0.5) : 0.5;
    bool _197 = !_191;
    float _199 = _197 ? (-0.5) : 0.5;
    bool _201 = !_161;
    float _203 = _183;
    if (!_201)
    {
        float _205 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _207 = log2(_205);
        float _209 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _211 = _209 + 1.0;
        float _213 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _215 = _145 * _207;
        float _217 = 1.0 / _211;
        float _219 = _213 * 0.693147182464599609375;
        float _221 = exp2(_215);
        float _223 = 1.0 / _219;
        float _225 = _221 + (-1.0);
        float _227 = -_225;
        float _229 = fma(_227, _223, _145);
        float _231 = _229 * _217;
        float _233 = _231 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _119 = _223;
        _203 = _233;
        _121 = _221;
    }
    float _235 = _119;
    float _237 = _203;
    float _239 = _121;
    bool _241 = !_161;
    float _243 = _235;
    float _245 = _239;
    if (!_241)
    {
        float _247 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _249 = log2(_247);
        float _251 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _253 = _251 + 1.0;
        float _255 = 1.0 / _253;
        float _257 = _145 * _249;
        float _259 = exp2(_257);
        float _261 = -_259;
        float _263 = _261 + 1.0;
        float _265 = _263 * _255;
        _243 = _259;
        _245 = _253;
        _163 = _265;
    }
    float _267 = _243;
    float _269 = _245;
    float _271 = _163;
    float _273 = _269;
    float _275 = _267;
    if (!_161)
    {
        _273 = _115;
    }
    float _277 = _273;
    float _279 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _281 = _277;
    if (!_161)
    {
        float _283 = _179 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _275 = _283;
    }
    float _285 = _275;
    bool _287 = !_161;
    float _289 = _285;
    if (!_287)
    {
        float _291 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _293 = log2(_291);
        float _295 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _297 = _295 + 1.0;
        float _299 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _301 = _115 * _293;
        float _303 = exp2(_301);
        float _305 = _299 * 0.693147182464599609375;
        float _307 = 1.0 / _305;
        float _309 = 1.0 / _297;
        float _311 = _303 + (-1.0);
        float _313 = -_311;
        float _315 = fma(_313, _307, _115);
        float _317 = _315 * _309;
        float _319 = _317 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _289 = _319;
    }
    float _321 = _289;
    bool _323 = !_161;
    if (!_323)
    {
        float _325 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _327 = log2(_325);
        float _329 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _331 = _329 + 1.0;
        float _333 = 1.0 / _331;
        float _335 = _115 * _327;
        float _337 = exp2(_335);
        float _339 = -_337;
        float _341 = _339 + 1.0;
        float _343 = _341 * _333;
        _281 = _343;
    }
    float _345 = _281;
    float _347 = _321 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _349 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _351 = fma(_271, _149, _279);
    float _353 = _321 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _355 = fma(_345, _149, _347);
    float _357 = fma(_271, _147, _349);
    float _359 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _361 = _321 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _363 = fma(_345, _147, _353);
    float _365 = -_355;
    float _367 = _351 + _365;
    float _369 = fma(_271, _151, _359);
    float _371 = fma(_345, _151, _361);
    float _373 = -_363;
    float _375 = _357 + _373;
    float _377 = _367 * _367;
    float _379 = in.m_52.w;
    float _381 = -_371;
    float _383 = _369 + _381;
    float _385 = _367 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _387 = fma(_375, _375, _377);
    float _389 = _367 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _391 = _367 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _393 = fma(_375, (*spvDescriptorSet0.vp_c10)._m0[4].x, _385);
    float _395 = fma(_383, _383, _387);
    float _397 = fma(_375, (*spvDescriptorSet0.vp_c10)._m0[5].x, _389);
    float _399 = in.m_42.x;
    float _401 = in.m_42.y;
    float _403 = in.m_42.z;
    float _405 = fma(_375, (*spvDescriptorSet0.vp_c10)._m0[6].x, _391);
    float _407 = fma(_383, (*spvDescriptorSet0.vp_c10)._m0[4].z, _393);
    float _409 = sqrt(_395);
    bool _411 = _409 >= 9.9999999747524270787835121154785e-07;
    bool _413 = isnan(_409);
    bool _415 = _411 || _413;
    bool _417 = isnan(9.9999999747524270787835121154785e-07);
    bool _419 = _415 || _417;
    float _421 = fma(_383, (*spvDescriptorSet0.vp_c10)._m0[5].z, _397);
    float _423 = fma(_383, (*spvDescriptorSet0.vp_c10)._m0[6].z, _405);
    float _425 = fma(_357, _379, _399);
    float _427 = fma(_351, _379, _401);
    float _429 = fma(_369, _379, _403);
    float _431 = _421;
    float _433 = _407;
    float _435 = _423;
    float _437 = _429;
    if (!_419)
    {
        bool _439 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _441 = !_439;
        if (!_441)
        {
            float _443 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _445 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _447 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _449 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _443);
            float _451 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _445);
            float _453 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _447);
            float _455 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _449);
            float _457 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _451);
            float _459 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _453);
            float _461 = _455 * _455;
            float _463 = fma(_457, _457, _461);
            float _465 = fma(_459, _459, _463);
            float _467 = rsqrt(_465);
            float _469 = _467 * 9.9999999747524270787835121154785e-07;
            float _471 = _457 * _469;
            float _473 = _455 * _469;
            float _475 = _459 * _469;
            _431 = _473;
            _433 = _471;
            _435 = _475;
            _477 = true;
        }
        else
        {
            float _479 = _149 * _149;
            float _481 = fma(_147, _147, _479);
            float _483 = fma(_151, _151, _481);
            float _485 = sqrt(_483);
            bool _487 = _485 >= 9.9999999747524270787835121154785e-07;
            bool _489 = isnan(_485);
            bool _491 = _487 || _489;
            bool _493 = isnan(9.9999999747524270787835121154785e-07);
            bool _495 = _491 || _493;
            if (!_495)
            {
                float _497 = _401 * _401;
                float _499 = fma(_399, _399, _497);
                float _501 = fma(_403, _403, _499);
                float _503 = sqrt(_501);
                bool _505 = _503 >= 9.9999999747524270787835121154785e-07;
                bool _507 = isnan(_503);
                bool _509 = _505 || _507;
                bool _511 = isnan(9.9999999747524270787835121154785e-07);
                bool _513 = _509 || _511;
                if (!_513)
                {
                    float _515 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _517 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _515);
                    float _519 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _517);
                    float _521 = rsqrt(_519);
                    float _523 = _521 * 9.9999999747524270787835121154785e-07;
                    float _525 = _523 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _527 = _523 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _529 = _523 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _431 = _527;
                    _433 = _525;
                    _435 = _529;
                    _477 = true;
                }
                else
                {
                    float _531 = _401 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _533 = _401 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _535 = _401 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _537 = fma(_399, (*spvDescriptorSet0.vp_c10)._m0[5].x, _531);
                    float _539 = fma(_399, (*spvDescriptorSet0.vp_c10)._m0[4].x, _533);
                    float _541 = fma(_399, (*spvDescriptorSet0.vp_c10)._m0[6].x, _535);
                    float _543 = fma(_403, (*spvDescriptorSet0.vp_c10)._m0[5].z, _537);
                    float _545 = fma(_403, (*spvDescriptorSet0.vp_c10)._m0[4].z, _539);
                    float _547 = fma(_403, (*spvDescriptorSet0.vp_c10)._m0[6].z, _541);
                    float _549 = _543 * _543;
                    float _551 = fma(_545, _545, _549);
                    float _553 = fma(_547, _547, _551);
                    float _555 = rsqrt(_553);
                    float _557 = _555 * 9.9999999747524270787835121154785e-07;
                    float _559 = _545 * _557;
                    float _561 = _543 * _557;
                    float _563 = _547 * _557;
                    _431 = _561;
                    _433 = _559;
                    _435 = _563;
                    _477 = true;
                }
            }
            else
            {
                float _565 = _149 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _567 = _149 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _569 = _149 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _571 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[5].x, _565);
                float _573 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[4].x, _567);
                float _575 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[6].x, _569);
                float _577 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[5].z, _571);
                float _579 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[4].z, _573);
                float _581 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[6].z, _575);
                float _583 = _577 * _577;
                float _585 = fma(_579, _579, _583);
                float _587 = fma(_581, _581, _585);
                float _589 = rsqrt(_587);
                float _591 = _589 * 9.9999999747524270787835121154785e-07;
                float _593 = _579 * _591;
                float _595 = _577 * _591;
                float _597 = _581 * _591;
                _431 = _595;
                _433 = _593;
                _435 = _597;
            }
        }
    }
    _477 = false;
    float _599 = _431;
    float _601 = _433;
    float _603 = _435;
    bool _605 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    bool _607 = !_605;
    float _625;
    if (!_607)
    {
        float _609 = in.m_54.x;
        float _611 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _613 = _609 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _615 = fma(_613, (*spvDescriptorSet0.vp_c9)._m0[11].y, _115);
        float _617 = _615 * _611;
        float _619 = floor(_617);
        float _621 = -_619;
        float _623 = _617 + _621;
        _625 = _623;
        _627 = true;
    }
    else
    {
        float _629 = float(_83);
        float _631 = 1.0 / _629;
        float _633 = _115 * _631;
        _625 = _633;
    }
    _627 = false;
    float _635 = _625;
    float _637 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _639 = _635 + _637;
    float _641 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _643 = _641 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _645 = _635 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _647 = isnan(_635);
    bool _649 = _645 || _647;
    bool _651 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _653 = _649 || _651;
    float _655 = float(_653);
    float _657 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _659 = _657 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _661 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _663 = _661 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _665 = _635 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _667 = isnan(_635);
    bool _669 = _665 || _667;
    bool _671 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _673 = _669 || _671;
    float _675 = float(_673);
    float _677 = 1.0 / _643;
    float _679 = -_655;
    float _681 = _679 + 1.0;
    float _683 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _685 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _683;
    bool _687 = _635 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _689 = isnan(_635);
    bool _691 = _687 || _689;
    bool _693 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _695 = _691 || _693;
    float _697 = float(_695);
    float _699 = _675 * _681;
    float _701 = -_675;
    float _703 = _701 + 1.0;
    bool _705 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _707 = 1.0 / _659;
    float _709 = _697 * _703;
    float _711 = -_697;
    float _713 = _711 + 1.0;
    float _715 = 1.0 / _663;
    float _717 = _685 * _677;
    float _719 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _721 = _719 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _723 = fma(_717, _639, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _725 = _721 * _707;
    bool _727 = _635 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _729 = isnan(_635);
    bool _731 = _727 || _729;
    bool _733 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _735 = _731 || _733;
    float _737 = float(_735);
    float _739 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _741 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _739;
    float _743 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _745 = _635 + _743;
    float _747 = _723 * _709;
    float _749 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _751 = _635 + _749;
    float _753 = -_737;
    float _755 = _753 + 1.0;
    float _757 = fma(_725, _745, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _759 = _741 * _715;
    float _761 = fma(_713, (*spvDescriptorSet0.vp_c9)._m0[115].x, _747);
    float _763 = _655 * _755;
    float _765 = fma(_759, _751, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _767 = fma(_757, _699, _761);
    float _769 = fma(_765, _763, _767);
    float _771 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _773 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _775 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _777 = fma(_737, (*spvDescriptorSet0.vp_c9)._m0[118].x, _769);
    float _779 = _771 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _781 = _773 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _783 = _775 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _785 = _777 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_56.x = _779;
    out.m_56.y = _781;
    out.m_56.z = _783;
    out.m_56.w = _785;
    bool _787 = !_705;
    float _789 = _771;
    float _791 = _773;
    float _809;
    if (!_787)
    {
        float _793 = in.m_54.x;
        float _795 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _797 = _793 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _799 = fma(_797, (*spvDescriptorSet0.vp_c9)._m0[11].z, _115);
        float _801 = _799 * _795;
        float _803 = floor(_801);
        float _805 = -_803;
        float _807 = _801 + _805;
        _789 = _795;
        _809 = _807;
        _811 = true;
    }
    else
    {
        float _813 = float(_83);
        float _815 = 1.0 / _813;
        float _817 = _115 * _815;
        _809 = _817;
    }
    _811 = false;
    float _819 = _789;
    float _821 = _809;
    float _823 = _599 * _599;
    float _825 = in.m_52.x;
    float _827 = in.m_52.y;
    float _829 = fma(_601, _601, _823);
    float _831 = fma(_603, _603, _829);
    float _833 = rsqrt(_831);
    float _835 = _833 * _599;
    float _837 = _833 * _601;
    float _839 = _833 * _603;
    float _841 = _835 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _843 = fma(_837, (*spvDescriptorSet0.vp_c10)._m0[8].y, _841);
    float _845 = fma(_839, (*spvDescriptorSet0.vp_c10)._m0[10].y, _843);
    float _847 = abs(_845);
    bool _849 = _847 > 0.99989998340606689453125;
    float _851 = _845;
    float _853 = _819;
    float _855 = _833;
    if (_849)
    {
        _851 = 0.001000000047497451305389404296875;
    }
    float _857 = _851;
    if (!_849)
    {
        _791 = (*spvDescriptorSet0.vp_c10)._m0[8].y;
    }
    float _859 = _791;
    float _861 = _859;
    if (!_849)
    {
        _853 = (*spvDescriptorSet0.vp_c10)._m0[10].y;
    }
    float _863 = _853;
    float _865 = _863;
    if (_849)
    {
        float _867 = fma(_857, (*spvDescriptorSet0.vp_c10)._m0[8].z, (*spvDescriptorSet0.vp_c10)._m0[8].y);
        _861 = _867;
    }
    float _869 = _861;
    if (_849)
    {
        float _871 = fma(_857, (*spvDescriptorSet0.vp_c10)._m0[10].z, (*spvDescriptorSet0.vp_c10)._m0[10].y);
        _865 = _871;
    }
    float _873 = _865;
    if (!_849)
    {
        _855 = (*spvDescriptorSet0.vp_c10)._m0[9].y;
    }
    float _875 = _855;
    float _877 = _875;
    if (_849)
    {
        float _879 = fma(_857, (*spvDescriptorSet0.vp_c10)._m0[9].z, (*spvDescriptorSet0.vp_c10)._m0[9].y);
        _877 = _879;
    }
    float _881 = _877;
    float _883 = -_869;
    float _885 = _839 * _883;
    float _887 = -_873;
    float _889 = _835 * _887;
    float _891 = -_873;
    float _893 = -_885;
    float _895 = fma(_837, _891, _893);
    float _897 = -_881;
    float _899 = -_889;
    float _901 = fma(_839, _897, _899);
    float _903 = -_881;
    float _905 = _837 * _903;
    float _907 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _195);
    float _909 = _895 * _895;
    float _911 = -_869;
    float _913 = -_905;
    float _915 = fma(_835, _911, _913);
    float _917 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _199);
    float _919 = fma(_901, _901, _909);
    float _921 = _827 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _923 = fma(_915, _915, _919);
    float _925 = _825 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _927 = _921 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _929 = rsqrt(_923);
    float _931 = _925 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _933 = _927 * _917;
    float _935 = _427 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _937 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _939 = _931 * _907;
    float _941 = fma(_425, (*spvDescriptorSet0.vp_c10)._m0[6].x, _935);
    float _943 = _933 * _839;
    float _945 = fma(_429, (*spvDescriptorSet0.vp_c10)._m0[6].z, _941);
    float _947 = _945 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _949 = _895 * _929;
    float _951 = _915 * _929;
    float _953 = _901 * _929;
    float _955 = _837 * _949;
    float _957 = fma(_939, _951, _943);
    float _959 = _835 * _951;
    float _961 = -_955;
    float _963 = fma(_835, _953, _961);
    float _965 = _427 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _967 = _427 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _969 = fma(_937, _963, _957);
    float _971 = _933 * _837;
    float _973 = fma(_425, (*spvDescriptorSet0.vp_c10)._m0[4].x, _965);
    float _975 = fma(_425, (*spvDescriptorSet0.vp_c10)._m0[5].x, _967);
    float _977 = _947 + _969;
    float _979 = fma(_939, _953, _971);
    float _981 = -_959;
    float _983 = fma(_839, _949, _981);
    float _985 = fma(_429, (*spvDescriptorSet0.vp_c10)._m0[4].z, _973);
    float _987 = fma(_429, (*spvDescriptorSet0.vp_c10)._m0[5].z, _975);
    float _989 = fma(_937, _983, _979);
    float _991 = _985 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _993 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _995 = _977 + _993;
    float _997 = _991 + _989;
    float _999 = _995 * _995;
    float _1001 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1003 = _997 + _1001;
    float _1005 = fma(_1003, _1003, _999);
    float _1007 = _933 * _835;
    float _1009 = _839 * _953;
    float _1011 = sqrt(_1005);
    float _1013 = fma(_939, _949, _1007);
    float _1015 = -_1009;
    float _1017 = fma(_837, _951, _1015);
    float _1019 = _987 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1021 = fma(_937, _1017, _1013);
    float _1023 = _1019 + _1021;
    bool _1025 = _1011 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1027 = _1021;
    float _1029 = _937;
    float _1031 = _977;
    float _1033 = _987;
    float _1035 = _1003;
    if (!_1025)
    {
        _1027 = _977;
    }
    float _1037 = _1027;
    float _1039 = _1037;
    if (!_1025)
    {
        _1029 = _997;
    }
    float _1041 = _1029;
    float _1043 = _1041;
    if (!_1025)
    {
        _1031 = _1023;
    }
    float _1045 = _1031;
    bool _1047 = !_1025;
    float _1049 = _1045;
    if (!_1047)
    {
        float _1051 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1053 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1055 = _1011 + _1053;
        float _1057 = _1023 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1059 = rsqrt(_1005);
        float _1061 = _1055 * _1051;
        float _1063 = _1061 * 0.15915493667125701904296875;
        float _1065 = _1063 * 6.283185482025146484375;
        float _1067 = cos(_1065);
        float _1069 = _1063 * 6.283185482025146484375;
        float _1071 = sin(_1069);
        float _1073 = _1067 + (-1.0);
        float _1075 = _1073 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1077 = fma(_1071, _1057, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1079 = fma(_1023, _1067, _1075);
        float _1081 = _1059 * _1077;
        float _1083 = fma(_1003, _1081, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1085 = fma(_995, _1081, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1049 = _1079;
        _1043 = _1083;
        _1039 = _1085;
    }
    float _1087 = _1049;
    float _1089 = _1043;
    float _1091 = _1039;
    float _1093 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1095 = _1087 + _1093;
    float _1097 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1099 = _1089 + _1097;
    float _1101 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1103 = _1091 + _1101;
    float _1105 = _1095 * _1095;
    float _1107 = fma(_1099, _1099, _1105);
    float _1109 = fma(_1103, _1103, _1107);
    float _1111 = rsqrt(_1109);
    float _1113 = _1111 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1115 = _1099 * _1113;
    float _1117 = _1103 * _1113;
    float _1119 = _1115 * _1115;
    float _1121 = _1117 * _1117;
    float _1123 = _1119 + _1121;
    float _1125 = sqrt(_1123);
    bool _1127 = _1125 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1129 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1131 = _1125 + _1129;
    float _1133 = _1111;
    float _1135 = _1123;
    float _1137 = _1131;
    float _1139 = _1095;
    if (_1127)
    {
        float _1141 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1133 = _1141;
    }
    float _1143 = _1133;
    if (_1127)
    {
        float _1145 = rsqrt(_1123);
        _1135 = _1145;
    }
    float _1147 = _1135;
    float _1149 = _1147;
    if (_1127)
    {
        float _1151 = _1131 * _1143;
        _1137 = _1151;
    }
    float _1153 = _1137;
    if (_1127)
    {
        float _1155 = _1153 * 0.15915493667125701904296875;
        _1033 = _1155;
    }
    float _1157 = _1033;
    float _1159 = _1103;
    if (_1127)
    {
        float _1161 = _1157 * 6.283185482025146484375;
        float _1163 = sin(_1161);
        _1159 = _1163;
    }
    float _1165 = _1159;
    float _1167 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1169 = precise::max(0.0, _1167);
    float _1171 = _1143;
    float _1173 = _1169;
    if (_1127)
    {
        float _1175 = _1157 * 6.283185482025146484375;
        float _1177 = cos(_1175);
        _1171 = _1177;
    }
    float _1179 = _1171;
    float _1181 = -_1113;
    float _1183 = -_1169;
    float _1185 = fma(_1095, _1181, _1183);
    if (_1127)
    {
        float _1187 = _1185 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1139 = _1187;
    }
    float _1189 = _1139;
    float _1191 = sqrt(_1109);
    float _1193 = _1189;
    float _1195 = _1165;
    if (_1127)
    {
        float _1197 = fma(_1165, _1189, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1193 = _1197;
    }
    float _1199 = _1193;
    float _1201 = _1199;
    if (!_1127)
    {
        _1195 = _1115;
    }
    float _1203 = _1195;
    float _1205 = _1203;
    float _1207 = _1179;
    if (_1127)
    {
        float _1209 = _1179 + (-1.0);
        _1173 = _1209;
    }
    float _1211 = _1173;
    float _1213 = _1211;
    if (_1127)
    {
        float _1215 = _1147 * _1199;
        _1035 = _1215;
    }
    float _1217 = _1035;
    if (!_1127)
    {
        _1201 = _1185;
    }
    float _1219 = _1201;
    float _1221 = _1219;
    if (_1127)
    {
        float _1223 = _1211 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _437 = _1223;
    }
    float _1225 = _437;
    if (_1127)
    {
        float _1227 = _1115 * _1217;
        _1205 = _1227;
    }
    float _1229 = _1205;
    if (!_1127)
    {
        _1213 = _1117;
    }
    float _1231 = _1213;
    float _1233 = _1231;
    if (_1127)
    {
        float _1235 = _1117 * _1217;
        _1233 = _1235;
    }
    float _1237 = _1233;
    if (!_1127)
    {
        _1149 = _1119;
    }
    float _1239 = _1149;
    float _1241 = _1239;
    if (_1127)
    {
        float _1243 = fma(_1185, _1179, _1225);
        _1221 = _1243;
    }
    float _1245 = _1221;
    if (_1127)
    {
        float _1247 = _1229 * _1229;
        _1241 = _1247;
    }
    float _1249 = _1241;
    if (!_1127)
    {
        _1207 = _1121;
    }
    float _1251 = _1207;
    float _1253 = _1251;
    if (_1127)
    {
        float _1255 = _1237 * _1237;
        _1253 = _1255;
    }
    float _1257 = _1253;
    float _1259 = fma(_1245, _1245, _1249);
    float _1261 = _1259 + _1257;
    float _1263 = _1087 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1265 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1267 = fma(_1191, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1265);
    float _1269 = precise::clamp(_1267, 0.0, 1.0);
    float _1271 = _1087 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1273 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1275 = fma(_1089, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1263);
    float _1277 = rsqrt(_1261);
    float _1279 = -_1269;
    float _1281 = _1279 + 1.0;
    float _1283 = _1087 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1285 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1275);
    float _1287 = fma(_1089, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1271);
    float _1289 = _1087 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1291 = _1285 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1293 = fma(_1089, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1283);
    float _1295 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1287);
    float _1297 = abs(_1281);
    float _1299 = log2(_1297);
    float _1301 = fma(_1089, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1289);
    float _1303 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1293);
    float _1305 = _1295 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1307 = _1291 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1309 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1301);
    float _1311 = _1303 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1313 = _1305 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1315 = _1277 * _1229;
    float _1317 = _1309 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1319 = _1277 * _1245;
    float _1321 = fma(_1311, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1313);
    float _1323 = _1315 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1325 = _1277 * _1237;
    float _1327 = -_1307;
    float _1329 = fma(_1327, _1273, 1.0);
    float _1331 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1321);
    float _1333 = _1299 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1335 = -_1323;
    float _1337 = fma(_1319, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1335);
    float _1339 = _1305 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1341 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1331);
    float _1343 = log2(_1329);
    float _1345 = -_1325;
    float _1347 = fma(_1345, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1337);
    float _1349 = _1305 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1351 = fma(_1311, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1339);
    float _1353 = fma(_1347, -0.5, 0.5);
    float _1355 = fma(_1311, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1349);
    float _1357 = fma(_1347, 0.5, 0.5);
    float _1359 = exp2(_1333);
    float _1361 = _1319 + 1.0;
    float _1363 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1351);
    float _1365 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1355);
    float _1367 = fma(_1357, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1369 = 1.0 / _1341;
    float _1371 = fma(_1357, _1367, -0.212114393711090087890625);
    float _1373 = fma(_1357, _1371, 1.570728778839111328125);
    float _1375 = sqrt(_1353);
    float _1377 = -_1319;
    float _1379 = fma(_1359, _1361, _1377);
    float _1381 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1363);
    float _1383 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1365);
    float _1385 = _1343 * 0.693147182464599609375;
    float _1387 = fma(_1379, 0.5, 0.5);
    float _1389 = _1381 * _1369;
    float _1391 = _1383 * _1369;
    float _1393 = _1385 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1395 = fma(_1389, 0.5, 0.5);
    float _1397 = fma(_1391, -0.5, 0.5);
    float _1399 = _1375 * 0.636619746685028076171875;
    float3 _3909 = float3(_1395, _1397, _1393);
    float _1401 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3909, float3(0.0), isnan(_3909)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3909, float3(0.0), isnan(_3909)), level(0.0)).x;
    float3 _3920 = float3(_1395, _1397, _1393);
    float4 _1404 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3920, float3(0.0), isnan(_3920)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3920, float3(0.0), isnan(_3920)), level(0.0)).xyzw;
    float _1406 = _1404.x;
    float _1408 = _1404.y;
    float _1410 = _1404.z;
    float _1412 = _1404.w;
    float _1414 = -_1373;
    float _1416 = fma(_1399, _1414, 1.0);
    float2 _3942 = float2(_1416, _1387);
    float3 _1420 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3942, float2(0.0), isnan(_3942)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3942, float2(0.0), isnan(_3942)), level(0.0)).xyz;
    float _1422 = _1420.x;
    float _1424 = _1420.y;
    float _1426 = _1420.z;
    float _1428 = in.m_54.z;
    float _1430 = in.m_54.w;
    float _1432 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _1434 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1436 = _1434 != 0;
    float _1438 = _1299 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1440 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1442 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1440;
    int _1444 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1446 = _1444 != 0;
    float _1448 = 1.0 / _1442;
    int _1450 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1452 = _1450 != 0;
    float _1454 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1456 = _821 + _1454;
    float _1458 = _1121;
    float _1460 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    float _1462 = _1442;
    if (!_1436)
    {
        float _1464 = in.m_54.z;
        _1458 = _1464;
    }
    float _1466 = _1458;
    float _1468 = exp2(_1438);
    if (!_1436)
    {
        float _1470 = in.m_54.y;
        _1460 = _1470;
    }
    float _1472 = _1460;
    bool _1474 = _1430 > 0.5;
    bool _1476 = _1428 > 0.5;
    float _1478 = _1456 * _1448;
    float _1480 = -_199;
    int _1482 = _1474 ? as_type<int>(_1480) : as_type<int>(_199);
    float _1484 = -_195;
    int _1486 = _1476 ? as_type<int>(_1484) : as_type<int>(_195);
    bool _1488 = !_1452;
    float _1490 = _1488 ? _199 : as_type<float>(_1482);
    bool _1492 = !_1446;
    float _1494 = _1492 ? _195 : as_type<float>(_1486);
    float _1496 = -_1468;
    float _1498 = _1496 + 1.0;
    bool _1500 = _821 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1502 = isnan(_821);
    bool _1504 = _1500 || _1502;
    bool _1506 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1508 = _1504 || _1506;
    float _1510 = float(_1508);
    float _1512 = _1498 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1514 = _1466;
    if (!_1436)
    {
        _1462 = _1466;
    }
    float _1516 = _1462;
    float _1518 = -_1510;
    float _1520 = _1518 + 1.0;
    float _1522 = _1472;
    float _1524 = _1516;
    if (_1436)
    {
        float _1526 = in.m_54.x;
        float _1528 = in.m_54.y;
        _1522 = _1526;
        _1524 = _1528;
    }
    float _1530 = _1522;
    float _1532 = _1524;
    bool _1534 = _821 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1536 = isnan(_821);
    bool _1538 = _1534 || _1536;
    bool _1540 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1542 = _1538 || _1540;
    float _1544 = float(_1542);
    float _1546 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1548 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1546;
    float _1550 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1552 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1550;
    float _1554 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1556 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1554;
    float _1558 = _1544 * _1520;
    float _1560 = fma(_1548, _1478, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1562 = fma(_1552, _1478, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1564 = fma(_1556, _1478, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1566 = -_1544;
    float _1568 = _1566 + 1.0;
    float _1570 = _1560 * _1558;
    float _1572 = _1562 * _1558;
    float _1574 = _1564 * _1558;
    float _1576 = fma(_1568, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1570);
    float _1578 = fma(_1568, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1572);
    float _1580 = fma(_1568, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1574);
    float _1582 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1584 = fma(_1510, (*spvDescriptorSet0.vp_c9)._m0[124].x, _1576);
    float _1586 = fma(_1510, (*spvDescriptorSet0.vp_c9)._m0[124].y, _1578);
    if (_1436)
    {
        _1514 = _1532;
    }
    float _1588 = _1514;
    float _1590 = _1532 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1592 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1594 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1596 = fma(_1530, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1582);
    float _1598 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1600 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1602 = _1530 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1604 = fma(_1590, -2.0, _1592);
    float _1606 = fma(_1588, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1594);
    float _1608 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1596);
    float _1610 = -_1600;
    float _1612 = fma(_1602, 2.0, _1610);
    float _1614 = _1305 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1616 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1604);
    float _1618 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1606);
    float _1620 = -_115;
    float _1622 = fma(_1620, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1612);
    float _1624 = fma(_1311, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1614);
    float _1626 = _1432 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1628 = _1494 + 0.5;
    float _1630 = -_1618;
    float _1632 = _1630 + 1.0;
    float _1634 = -_1608;
    float _1636 = _1634 + 1.0;
    float _1638 = _1598 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1640 = fma(_1626, _1628, _1622);
    float _1642 = _1490 + (-0.5);
    float _1644 = fma(_1510, (*spvDescriptorSet0.vp_c9)._m0[124].z, _1580);
    float _1646 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1624);
    float _1648 = _1586 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1650 = -_1638;
    float _1652 = -_1616;
    float _1654 = fma(_1650, _1642, _1652);
    float _1656 = -_1636;
    float _1658 = fma(_1494, _1656, _1640);
    float _1660 = _1381 + _1341;
    float _1662 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1646);
    float _1664 = fma(_1490, _1632, _1654);
    float _1666 = _1341 * 0.5;
    float _1668 = _1660 * 0.5;
    float _1670 = _1644 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1672 = fma(_1383, -0.5, _1666);
    float _1674 = _1584 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1676 = _1662 + _1341;
    out.m_58.z = _1658;
    out.m_58.w = _1664;
    float _1678 = _1648 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1680 = _1674 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1682 = _1670 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1684 = _1676 * 0.5;
    float _1686 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _1381;
    out.gl_Position.y = _1383;
    out.gl_Position.z = _1662;
    out.gl_Position.w = _1341;
    out.m_60.x = _1680;
    out.m_60.y = _1678;
    out.m_60.z = _1682;
    out.m_62.x = _1668;
    out.m_62.y = _1672;
    out.m_62.z = _1684;
    out.m_62.w = _1341;
    out.m_45.x = _1686;
    float _1688 = _1512 * _1401;
    float _1690 = -_1512;
    float _1692 = _1690 + 1.0;
    float _1694 = _1412 * _1688;
    float _1696 = _1412 * _1692;
    float _1698 = _1426 * _1688;
    float _1700 = fma(_1422, _1694, _1406);
    float _1702 = fma(_1424, _1694, _1408);
    float _1704 = fma(_1412, _1698, _1410);
    out.m_64.x = _1700;
    out.m_64.y = _1702;
    out.m_64.z = _1704;
    out.m_64.w = _1696;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

