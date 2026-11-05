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
    float4 m_60 [[user(locn0)]];
    float4 m_58 [[user(locn1)]];
    float4 m_56 [[user(locn2)]];
    float4 m_64 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_62 [[user(locn5)]];
    float4 m_66 [[user(locn7)]];
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
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _889 = false;
    bool _633 = false;
    bool _477 = false;
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
    if (!_89)
    {
        _91 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _93 = _91;
    float _95 = _93;
    if (!_89)
    {
        out.m_45.x = 0.0;
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
        float _2728 = as_type<float>(_101);
        out.gl_Position.z = _2728;
    }
    if (!_89)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _105 = in.m_47.w;
    bool _107 = _105 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _109 = isnan(_105);
    bool _111 = _107 || _109;
    bool _113 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _115 = _111 || _113;
    float _117 = -_105;
    float _119 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _121 = 0.0;
    if (_115)
    {
        float _123 = float(_85);
        _95 = _123;
    }
    float _125 = _95;
    bool _127 = _119 >= _125;
    bool _129 = !_115;
    bool _131 = _127 || _129;
    float _133 = _125;
    if (_131)
    {
        _133 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _135 = _133;
    if (_131)
    {
        out.m_45.x = 0.0;
    }
    if (_131)
    {
        float _137 = _135 * 5.0;
        _103 = as_type<int>(_137);
    }
    int _139 = _103;
    float _141 = as_type<float>(_139);
    if (_131)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2799 = as_type<float>(_139);
        out.gl_Position.z = _2799;
    }
    if (_131)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _143 = as_type<float>(int(gl_VertexIndex));
    float _145 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _147 = in.m_47.x;
    float _149 = in.m_47.y;
    float _151 = in.m_47.z;
    bool _153 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _155 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _157 = _153 || _155;
    bool _159 = isnan(1.0);
    bool _161 = _157 || _159;
    float _163 = 0.0;
    float _165 = _145;
    if (!_161)
    {
        float _167 = _145 * _145;
        float _169 = _167 * 0.5;
        _163 = _169;
    }
    float _171 = _163;
    float _173 = 0.0;
    float _175 = _171;
    if (!_161)
    {
        float _177 = _119 * _119;
        float _179 = _177 * 0.5;
        _173 = _179;
    }
    float _181 = _173;
    if (!_161)
    {
        float _183 = _171 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _175 = _183;
    }
    float _185 = _175;
    int _187 = as_type<int>(_143) & 1;
    bool _189 = _187 != 0;
    int _191 = as_type<int>(_143) & 2;
    bool _193 = _191 != 0;
    bool _195 = !_189;
    float _197 = _195 ? (-0.5) : 0.5;
    bool _199 = !_193;
    float _201 = _199 ? (-0.5) : 0.5;
    bool _203 = !_161;
    float _205 = _185;
    if (!_203)
    {
        float _207 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _209 = log2(_207);
        float _211 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _213 = _211 + 1.0;
        float _215 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _217 = _145 * _209;
        float _219 = 1.0 / _213;
        float _221 = _215 * 0.693147182464599609375;
        float _223 = exp2(_217);
        float _225 = 1.0 / _221;
        float _227 = _223 + (-1.0);
        float _229 = -_227;
        float _231 = fma(_229, _225, _145);
        float _233 = _231 * _219;
        float _235 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _141 = _223;
        _205 = _235;
        _121 = _225;
    }
    float _237 = _141;
    float _239 = _205;
    float _241 = _121;
    bool _243 = !_161;
    float _245 = _237;
    float _247 = _241;
    if (!_243)
    {
        float _249 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _251 = log2(_249);
        float _253 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _255 = _253 + 1.0;
        float _257 = 1.0 / _255;
        float _259 = _145 * _251;
        float _261 = exp2(_259);
        float _263 = -_261;
        float _265 = _263 + 1.0;
        float _267 = _265 * _257;
        _245 = _261;
        _247 = _255;
        _165 = _267;
    }
    float _269 = _245;
    float _271 = _247;
    float _273 = _165;
    float _275 = _271;
    float _277 = _269;
    if (!_161)
    {
        _275 = _119;
    }
    float _279 = _275;
    float _281 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _283 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _285 = _279;
    if (!_161)
    {
        float _287 = _181 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _277 = _287;
    }
    float _289 = _277;
    bool _291 = !_161;
    float _293 = _289;
    if (!_291)
    {
        float _295 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _297 = log2(_295);
        float _299 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _301 = _299 + 1.0;
        float _303 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _305 = _119 * _297;
        float _307 = 1.0 / _301;
        float _309 = _303 * 0.693147182464599609375;
        float _311 = exp2(_305);
        float _313 = 1.0 / _309;
        float _315 = _311 + (-1.0);
        float _317 = -_315;
        float _319 = fma(_317, _313, _119);
        float _321 = _319 * _307;
        float _323 = _321 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _293 = _323;
    }
    float _325 = _293;
    bool _327 = !_161;
    if (!_327)
    {
        float _329 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _331 = log2(_329);
        float _333 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _335 = _333 + 1.0;
        float _337 = 1.0 / _335;
        float _339 = _119 * _331;
        float _341 = exp2(_339);
        float _343 = -_341;
        float _345 = _343 + 1.0;
        float _347 = _345 * _337;
        _285 = _347;
    }
    float _349 = _285;
    float _351 = _325 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _353 = fma(_273, _149, _283);
    float _355 = _325 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _357 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _359 = fma(_349, _149, _351);
    float _361 = _325 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _363 = fma(_273, _147, _281);
    float _365 = fma(_349, _147, _355);
    float _367 = -_359;
    float _369 = _353 + _367;
    float _371 = fma(_273, _151, _357);
    float _373 = fma(_349, _151, _361);
    float _375 = -_365;
    float _377 = _363 + _375;
    float _379 = _369 * _369;
    float _381 = in.m_52.w;
    float _383 = -_373;
    float _385 = _371 + _383;
    float _387 = _369 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _389 = fma(_377, _377, _379);
    float _391 = _369 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _393 = _369 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _395 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[4].x, _387);
    float _397 = fma(_385, _385, _389);
    float _399 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[5].x, _391);
    float _401 = in.m_42.x;
    float _403 = in.m_42.y;
    float _405 = in.m_42.z;
    float _407 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[6].x, _393);
    float _409 = fma(_385, (*spvDescriptorSet0.vp_c10)._m0[4].z, _395);
    float _411 = sqrt(_397);
    float _413 = fma(_385, (*spvDescriptorSet0.vp_c10)._m0[5].z, _399);
    float _415 = fma(_385, (*spvDescriptorSet0.vp_c10)._m0[6].z, _407);
    bool _417 = _411 >= 9.9999999747524270787835121154785e-07;
    bool _419 = isnan(_411);
    bool _421 = _417 || _419;
    bool _423 = isnan(9.9999999747524270787835121154785e-07);
    bool _425 = _421 || _423;
    float _427 = fma(_363, _381, _401);
    float _429 = fma(_353, _381, _403);
    float _431 = fma(_371, _381, _405);
    float _433 = _413;
    float _435 = _409;
    float _437 = _415;
    if (!_425)
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
            _433 = _473;
            _435 = _471;
            _437 = _475;
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
                float _497 = _403 * _403;
                float _499 = fma(_401, _401, _497);
                float _501 = fma(_405, _405, _499);
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
                    _433 = _527;
                    _435 = _525;
                    _437 = _529;
                    _477 = true;
                }
                else
                {
                    float _531 = _403 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _533 = _403 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _535 = _403 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _537 = fma(_401, (*spvDescriptorSet0.vp_c10)._m0[5].x, _531);
                    float _539 = fma(_401, (*spvDescriptorSet0.vp_c10)._m0[4].x, _533);
                    float _541 = fma(_401, (*spvDescriptorSet0.vp_c10)._m0[6].x, _535);
                    float _543 = fma(_405, (*spvDescriptorSet0.vp_c10)._m0[5].z, _537);
                    float _545 = fma(_405, (*spvDescriptorSet0.vp_c10)._m0[4].z, _539);
                    float _547 = fma(_405, (*spvDescriptorSet0.vp_c10)._m0[6].z, _541);
                    float _549 = _543 * _543;
                    float _551 = fma(_545, _545, _549);
                    float _553 = fma(_547, _547, _551);
                    float _555 = rsqrt(_553);
                    float _557 = _555 * 9.9999999747524270787835121154785e-07;
                    float _559 = _545 * _557;
                    float _561 = _543 * _557;
                    float _563 = _547 * _557;
                    _433 = _561;
                    _435 = _559;
                    _437 = _563;
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
                _433 = _595;
                _435 = _593;
                _437 = _597;
            }
        }
    }
    _477 = false;
    float _599 = _433;
    float _601 = _435;
    float _603 = _437;
    bool _605 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _607 = !_605;
    float _609 = _599;
    float _611 = _601;
    float _613 = _603;
    float _631;
    if (!_607)
    {
        float _615 = in.m_54.x;
        float _617 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _619 = _615 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _621 = fma(_619, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _623 = _621 * _617;
        float _625 = floor(_623);
        float _627 = -_625;
        float _629 = _623 + _627;
        _631 = _629;
        _633 = true;
    }
    else
    {
        float _635 = float(_85);
        float _637 = 1.0 / _635;
        float _639 = _119 * _637;
        _631 = _639;
    }
    _633 = false;
    float _641 = _631;
    float _643 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _645 = _641 + _643;
    float _647 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _649 = _641 + _647;
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _653 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _651;
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _657 = _655 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _659 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _661 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _659;
    float _663 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _665 = _663 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _667 = 1.0 / _657;
    float _669 = in.m_52.x;
    float _671 = in.m_52.y;
    bool _673 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _675 = 1.0 / _653;
    bool _677 = _641 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _679 = isnan(_641);
    bool _681 = _677 || _679;
    bool _683 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _685 = _681 || _683;
    float _687 = float(_685);
    float _689 = 1.0 / _661;
    float _691 = _649 * _667;
    bool _693 = _641 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _695 = isnan(_641);
    bool _697 = _693 || _695;
    bool _699 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _701 = _697 || _699;
    float _703 = float(_701);
    float _705 = 1.0 / _665;
    float _707 = _645 * _675;
    float _709 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _711 = _641 + _709;
    float _713 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _715 = _641 + _713;
    float _717 = _711 * _689;
    float _719 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _721 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _719;
    float _723 = -_703;
    float _725 = _723 + 1.0;
    float _727 = fma(_721, _707, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _729 = _687 * _725;
    bool _731 = _641 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _733 = isnan(_641);
    bool _735 = _731 || _733;
    bool _737 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _739 = _735 || _737;
    float _741 = float(_739);
    float _743 = _715 * _705;
    float _745 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _747 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _745;
    bool _749 = _641 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _751 = isnan(_641);
    bool _753 = _749 || _751;
    bool _755 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _757 = _753 || _755;
    float _759 = float(_757);
    bool _761 = _641 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _763 = isnan(_641);
    bool _765 = _761 || _763;
    bool _767 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _769 = _765 || _767;
    float _771 = float(_769);
    float _773 = fma(_747, _707, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _775 = -_687;
    float _777 = _775 + 1.0;
    float _779 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _781 = _779 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _783 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _785 = _783 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _787 = _759 * _777;
    float _789 = -_759;
    float _791 = _789 + 1.0;
    float _793 = fma(_781, _691, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _795 = fma(_785, _691, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _797 = _741 * _791;
    float _799 = -_741;
    float _801 = _799 + 1.0;
    float _803 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _805 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _803;
    float _807 = _771 * _801;
    float _809 = -_771;
    float _811 = _809 + 1.0;
    float _813 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _815 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _813;
    float _817 = fma(_805, _717, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _819 = _727 * _807;
    float _821 = _773 * _807;
    float _823 = fma(_815, _717, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _825 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _827 = _825 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _829 = fma(_811, (*spvDescriptorSet0.vp_c9)._m0[143].x, _819);
    float _831 = fma(_811, (*spvDescriptorSet0.vp_c9)._m0[143].y, _821);
    float _833 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _835 = _833 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _837 = fma(_827, _743, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _839 = fma(_793, _797, _829);
    float _841 = fma(_795, _797, _831);
    float _843 = fma(_835, _743, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _845 = fma(_823, _787, _839);
    float _847 = fma(_817, _787, _841);
    float _849 = fma(_837, _729, _845);
    float _851 = fma(_843, _729, _847);
    float _853 = fma(_703, (*spvDescriptorSet0.vp_c9)._m0[147].x, _849);
    float _855 = fma(_703, (*spvDescriptorSet0.vp_c9)._m0[147].y, _851);
    float _857 = _853 * _669;
    float _859 = _855 * _671;
    bool _861 = !_673;
    float _885;
    float _887;
    if (!_861)
    {
        float _863 = in.m_54.x;
        float _865 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _867 = float(_85);
        float _869 = 1.0 / _867;
        float _871 = _863 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _873 = _119 * _869;
        float _875 = fma(_871, (*spvDescriptorSet0.vp_c9)._m0[11].y, _119);
        float _877 = _875 * _865;
        float _879 = floor(_877);
        float _881 = -_879;
        float _883 = _877 + _881;
        _885 = _873;
        _887 = _883;
        _889 = true;
    }
    else
    {
        float _891 = float(_85);
        float _893 = 1.0 / _891;
        float _895 = _119 * _893;
        _885 = _895;
        _887 = _895;
    }
    _889 = false;
    float _897 = _885;
    float _899 = _887;
    float _901 = in.m_54.x;
    float _903 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _905 = in.m_54.w;
    float _907 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _909 = _907 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _911 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _913 = _911 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _915 = 1.0 / _909;
    float _917 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _919 = _917 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _921 = in.m_54.z;
    int _923 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _925 = _923 != 0;
    int _927 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _929 = _927 != 0;
    float _931 = 1.0 / _913;
    float _933 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _935 = _933 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    int _937 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _939 = _937 != 0;
    float _941 = _903 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _943 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _945 = _943 != 0;
    float _947 = _429 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _949 = _901 > 0.5;
    float _951 = _901 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _953 = 1.0 / _919;
    float _955 = fma(_427, (*spvDescriptorSet0.vp_c10)._m0[4].x, _947);
    float _957 = -_197;
    int _959 = _949 ? as_type<int>(_957) : as_type<int>(_197);
    bool _961 = _905 > 0.5;
    float _963 = _429 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _965 = 1.0 / _935;
    float _967 = _429 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _969 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _971 = _969 != 0;
    float _973 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _975 = in.m_54.y;
    float _977 = fma(_427, (*spvDescriptorSet0.vp_c10)._m0[5].x, _963);
    float _979 = fma(_427, (*spvDescriptorSet0.vp_c10)._m0[6].x, _967);
    float _981 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _983 = _981 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _985 = -_973;
    float _987 = fma(_951, 2.0, _985);
    float _989 = 1.0 / _983;
    float _991 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[4].z, _955);
    float _993 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[5].z, _977);
    float _995 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[6].z, _979);
    float _997 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _999 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _997;
    float _1001 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1003 = _1001 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1005 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1007 = _1005 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1009 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _1011 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _1009;
    float _1013 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _1015 = _1013 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1017 = 1.0 / _1003;
    float _1019 = _1007 * _931;
    float _1021 = _1015 * _965;
    float _1023 = _993 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1025 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1027 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _1025;
    float _1029 = _1011 * _953;
    float _1031 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _1033 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1035 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1037 = _1035 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1039 = _991 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1041 = _1031 * _901;
    bool _1043 = !_925;
    float _1045 = _1043 ? _197 : as_type<float>(_959);
    float _1047 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1049 = _1023 + _1047;
    float _1051 = _1027 * _989;
    float _1053 = _989;
    float _1055 = _921;
    if (!_971)
    {
        _1053 = _975;
    }
    float _1057 = _1053;
    float _1059 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _1061 = _1059 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1063 = fma(_901, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1033);
    float _1065 = _1057;
    if (_971)
    {
        _1065 = _901;
    }
    float _1067 = _1065;
    float _1069 = _995 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1071 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1073 = _1039 + _1071;
    float _1075 = _1049 * _1049;
    float _1077 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1079 = _1077 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _1081 = 1.0 / _1037;
    float _1083 = _1061 * _1017;
    float _1085 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1087 = _1085 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1089 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1091 = _1069 + _1089;
    float _1093 = fma(_1073, _1073, _1075);
    float _1095 = _999 * _915;
    float _1097 = _599 * _599;
    float _1099 = 1.0 / _1079;
    float _1101 = fma(_1091, _1091, _1093);
    float _1103 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1105 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _1103;
    float _1107 = fma(_601, _601, _1097);
    float _1109 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _1111 = _1109 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1113 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1115 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _1113;
    float _1117 = 1.0 / _1087;
    float _1119 = _1105 * _1081;
    float _1121 = fma(_603, _603, _1107);
    bool _1123 = _975 > 0.5;
    float _1125 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1127 = _897 + _1125;
    float _1129 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1131 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1133 = rsqrt(_1101);
    float _1135 = _1115 * _1099;
    float _1137 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1139 = _899 + _1137;
    float _1141 = -_201;
    int _1143 = _1123 ? as_type<int>(_1141) : as_type<int>(_201);
    float _1145 = _975 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1147 = _921 > 0.5;
    float _1149 = fma(_1095, _1139, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1151 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1153 = _897 + _1151;
    float _1155 = rsqrt(_1121);
    float _1157 = _1111 * _1117;
    float _1159 = _1117;
    float _1161 = _1121;
    float _1163 = _1069;
    if (!_971)
    {
        _1159 = _921;
    }
    float _1165 = _1159;
    float _1167 = fma(_975, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1131);
    float _1169 = _1165;
    if (_971)
    {
        _1169 = _975;
    }
    float _1171 = _1169;
    float _1173 = fma(_1029, _1127, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    if (_971)
    {
        _1055 = _975;
    }
    float _1175 = _1055;
    float _1177 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1179 = _899 + _1177;
    float _1181 = _1049 * _1133;
    float _1183 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1185 = _897 + _1183;
    float _1187 = fma(_1145, -2.0, _1129);
    float _1189 = fma(_1021, _1153, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    float _1191 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1193 = _897 + _1191;
    float _1195 = _1073 * _1133;
    float _1197 = -_1181;
    float _1199 = fma(_1197, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1049);
    float _1201 = fma(_1019, _1179, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1203 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1205 = _897 + _1203;
    float _1207 = fma(_1119, _1185, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _1209 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1211 = _897 + _1209;
    bool _1213 = _897 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1215 = isnan(_897);
    bool _1217 = _1213 || _1215;
    bool _1219 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1221 = _1217 || _1219;
    float _1223 = float(_1221);
    float _1225 = fma(_1083, _1193, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _1227 = -_1195;
    float _1229 = fma(_1227, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1073);
    float _1231 = _1199 * _1199;
    float _1233 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1235 = _897 + _1233;
    float _1237 = fma(_1157, _1205, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    float _1239 = fma(_1051, _1211, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    bool _1241 = _897 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1243 = isnan(_897);
    bool _1245 = _1241 || _1243;
    bool _1247 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _1249 = _1245 || _1247;
    float _1251 = float(_1249);
    float _1253 = _1155 * _603;
    float _1255 = -_1223;
    float _1257 = _1255 + 1.0;
    float _1259 = fma(_1229, _1229, _1231);
    float _1261 = fma(_1135, _1235, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    bool _1263 = _897 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1265 = isnan(_897);
    bool _1267 = _1263 || _1265;
    bool _1269 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1271 = _1267 || _1269;
    float _1273 = float(_1271);
    float _1275 = _1155 * _601;
    float _1277 = _1155 * _599;
    float _1279 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1281 = _1253 * _1279;
    float _1283 = _1251 * _1257;
    float _1285 = -_1251;
    float _1287 = _1285 + 1.0;
    bool _1289 = _897 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1291 = isnan(_897);
    bool _1293 = _1289 || _1291;
    bool _1295 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1297 = _1293 || _1295;
    float _1299 = float(_1297);
    float _1301 = -_1273;
    float _1303 = _1301 + 1.0;
    float _1305 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1307 = _1277 * _1305;
    float _1309 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1311 = -_1281;
    float _1313 = fma(_1275, _1309, _1311);
    float _1315 = _1273 * _1287;
    float _1317 = _1299 * _1303;
    float _1319 = -_1299;
    float _1321 = _1319 + 1.0;
    bool _1323 = _897 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1325 = isnan(_897);
    bool _1327 = _1323 || _1325;
    bool _1329 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _1331 = _1327 || _1329;
    float _1333 = float(_1331);
    float _1335 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1337 = -_1307;
    float _1339 = fma(_1253, _1335, _1337);
    float _1341 = _1313 * _1313;
    float _1343 = _1091 * _1133;
    bool _1345 = _897 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _1347 = isnan(_897);
    bool _1349 = _1345 || _1347;
    bool _1351 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _1353 = _1349 || _1351;
    float _1355 = float(_1353);
    float _1357 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1359 = _1275 * _1357;
    float _1361 = fma(_1339, _1339, _1341);
    float _1363 = -_1343;
    float _1365 = fma(_1363, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1091);
    float _1367 = _1333 * _1321;
    float _1369 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1371 = -_1359;
    float _1373 = fma(_1277, _1369, _1371);
    bool _1375 = _897 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _1377 = isnan(_897);
    bool _1379 = _1375 || _1377;
    bool _1381 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _1383 = _1379 || _1381;
    float _1385 = float(_1383);
    float _1387 = -_1355;
    float _1389 = _1387 + 1.0;
    float _1391 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1393 = -_1333;
    float _1395 = _1393 + 1.0;
    float _1397 = fma(_1365, _1365, _1259);
    float _1399 = fma(_1373, _1373, _1361);
    float _1401 = _1385 * _1389;
    float _1403 = _1355 * _1395;
    bool _1405 = _897 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _1407 = isnan(_897);
    bool _1409 = _1405 || _1407;
    bool _1411 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _1413 = _1409 || _1411;
    float _1415 = float(_1413);
    float _1417 = -_1385;
    float _1419 = _1417 + 1.0;
    float _1421 = sqrt(_1397);
    float _1423 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1187);
    bool _1425 = !_929;
    float _1427 = _1425 ? _201 : as_type<float>(_1143);
    float _1429 = _1045 + 0.5;
    float _1431 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1433 = rsqrt(_1399);
    float _1435 = _1391 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1437 = _1415 * _1419;
    float _1439 = _1427 + (-0.5);
    float _1441 = _1133 * _1421;
    float _1443 = -_119;
    float _1445 = fma(_1443, (*spvDescriptorSet0.vp_c9)._m0[76].x, _987);
    float _1447 = _859 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1449 = fma(_1175, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1431);
    float _1451 = -_201;
    int _1453 = _961 ? as_type<int>(_1451) : as_type<int>(_201);
    float _1455 = fma(_941, _1429, _1445);
    float _1457 = _1173 * _1437;
    float _1459 = -_1435;
    float _1461 = -_1423;
    float _1463 = fma(_1459, _1439, _1461);
    float _1465 = _1373 * _1433;
    float _1467 = -_197;
    int _1469 = _1147 ? as_type<int>(_1467) : as_type<int>(_197);
    float _1471 = _1339 * _1433;
    float _1473 = _1313 * _1433;
    float _1475 = _857 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1477 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _201);
    float _1479 = _1447 * _1441;
    bool _1481 = !_939;
    float _1483 = _1481 ? _197 : as_type<float>(_1469);
    float _1485 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _197);
    bool _1487 = _899 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1489 = isnan(_899);
    bool _1491 = _1487 || _1489;
    bool _1493 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1495 = _1491 || _1493;
    float _1497 = float(_1495);
    float _1499 = trunc(_1041);
    int _1501 = int(_1499);
    float _1503 = _1277 * _1465;
    float _1505 = _1475 * _1441;
    float _1507 = _1479 * _1477;
    bool _1509 = !_945;
    float _1511 = _1509 ? _201 : as_type<float>(_1453);
    float _1513 = -_1503;
    float _1515 = fma(_1253, _1473, _1513);
    bool _1517 = _899 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1519 = isnan(_899);
    bool _1521 = _1517 || _1519;
    bool _1523 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1525 = _1521 || _1523;
    float _1527 = float(_1525);
    float _1529 = -_1497;
    float _1531 = _1529 + 1.0;
    bool _1533 = _899 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1535 = isnan(_899);
    bool _1537 = _1533 || _1535;
    bool _1539 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1541 = _1537 || _1539;
    float _1543 = float(_1541);
    float _1545 = _1505 * _1485;
    float _1547 = _1275 * _1473;
    float _1549 = _1507 * _1253;
    float _1551 = -_1415;
    float _1553 = _1551 + 1.0;
    float _1555 = _1527 * _1531;
    float _1557 = _1507 * _1275;
    float _1559 = -_1547;
    float _1561 = fma(_1277, _1471, _1559);
    float _1563 = _1441 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1565 = _1563 * 0.5;
    float _1567 = fma(_1545, _1465, _1549);
    float _1569 = -_1527;
    float _1571 = _1569 + 1.0;
    float _1573 = fma(_1545, _1471, _1557);
    float _1575 = fma(_1553, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1457);
    float _1577 = fma(_1565, _1561, _1567);
    float _1579 = _1543 * _1571;
    int _1581 = _1501 << 4;
    int _1583 = _1581 + 1968;
    float _1585 = fma(_1565, _1515, _1573);
    float _1587 = _1069 + _1577;
    float _1589 = _1149 * _1579;
    int _1591 = _1583 + 8;
    uint _1594 = uint(int(uint(_1591) >> uint(2)));
    uint _1596 = uint(int(uint(int(_1594)) >> uint(2)));
    int _1598 = int(_1594) & 3;
    float _1600 = (*spvDescriptorSet0.vp_c9)._m0[int(_1596)][_1598];
    float _1602 = _1039 + _1585;
    float _1604 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1606 = _1587 + _1604;
    float _1608 = fma(_1189, _1401, _1575);
    float _1610 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1612 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1614 = _1602 + _1612;
    float _1616 = _1606 * _1606;
    float _1618 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    uint _1620 = uint(int(uint(_1583) >> uint(2)));
    uint _1622 = uint(int(uint(int(_1620)) >> uint(2)));
    int _1624 = int(_1620) & 3;
    float _1626 = (*spvDescriptorSet0.vp_c9)._m0[int(_1622)][_1624];
    int _1628 = int(_1620) + 1;
    uint _1630 = uint(int(uint(_1628) >> uint(2)));
    int _1632 = _1628 & 3;
    float _1634 = (*spvDescriptorSet0.vp_c9)._m0[int(_1630)][_1632];
    float _1636 = _1253 * _1471;
    float _1638 = fma(_1614, _1614, _1616);
    float _1640 = _1507 * _1277;
    float _1642 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1644 = fma(_1207, _1403, _1608);
    float _1646 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1648 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1650 = fma(_1067, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1618);
    float _1652 = -_1636;
    float _1654 = fma(_1275, _1465, _1652);
    float _1656 = fma(_1545, _1473, _1640);
    float _1658 = _1067 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1660 = sqrt(_1638);
    float _1662 = _1171 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1664 = -_1543;
    float _1666 = _1664 + 1.0;
    float _1668 = fma(_1237, _1367, _1644);
    float _1670 = fma(_1565, _1654, _1656);
    float _1672 = -_1646;
    float _1674 = fma(_1658, 2.0, _1672);
    float _1676 = fma(_1662, -2.0, _1648);
    float _1678 = fma(_1666, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1589);
    float _1680 = fma(_1239, _1317, _1668);
    float _1682 = _1023 + _1670;
    float _1684 = _1610 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1686 = fma(_1201, _1555, _1678);
    float _1688 = _1642 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1690 = _1483 + 0.5;
    float _1692 = -_119;
    float _1694 = fma(_1692, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1674);
    float _1696 = _1511 + (-0.5);
    bool _1698 = _1660 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1700 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1676);
    float _1702 = fma(_1225, _1315, _1680);
    float _1704 = fma(_1684, _1690, _1694);
    float _1706 = fma(_1497, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1686);
    float _1708 = -_1688;
    float _1710 = -_1700;
    float _1712 = fma(_1708, _1696, _1710);
    float _1714 = fma(_1261, _1283, _1702);
    float _1716 = _1237;
    float _1718 = _1602;
    float _1720 = _1587;
    if (!_1698)
    {
        _1716 = _1682;
    }
    float _1722 = _1716;
    bool _1724 = !_1698;
    float _1726 = _1722;
    if (!_1724)
    {
        float _1728 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1730 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1732 = _1660 + _1730;
        float _1734 = _1682 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1736 = rsqrt(_1638);
        float _1738 = _1732 * _1728;
        float _1740 = _1738 * 0.15915493667125701904296875;
        float _1742 = _1740 * 6.283185482025146484375;
        float _1744 = cos(_1742);
        float _1746 = _1740 * 6.283185482025146484375;
        float _1748 = sin(_1746);
        float _1750 = _1744 + (-1.0);
        float _1752 = _1750 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1754 = fma(_1748, _1734, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1756 = fma(_1682, _1744, _1752);
        float _1758 = _1736 * _1754;
        float _1760 = fma(_1614, _1758, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1762 = fma(_1606, _1758, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1726 = _1756;
        _1718 = _1760;
        _1720 = _1762;
    }
    float _1764 = _1726;
    float _1766 = _1718;
    float _1768 = _1720;
    float _1770 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1063);
    float _1772 = -_1023;
    float _1774 = _1772 + _1764;
    float _1776 = _1626 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1778 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1167);
    float _1780 = -_1770;
    float _1782 = _1780 + 1.0;
    float _1784 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1650);
    float _1786 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1449);
    float _1788 = -_1039;
    float _1790 = _1788 + _1766;
    float _1792 = _1774 * _1774;
    float _1794 = _1634 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1796 = -_1778;
    float _1798 = _1796 + 1.0;
    float _1800 = -_1782;
    float _1802 = fma(_1045, _1800, _1455);
    float _1804 = -_1784;
    float _1806 = _1804 + 1.0;
    float _1808 = -_1786;
    float _1810 = _1808 + 1.0;
    float _1812 = -_1069;
    float _1814 = _1812 + _1768;
    float _1816 = fma(_1790, _1790, _1792);
    float _1818 = fma(_1427, _1798, _1463);
    float _1820 = -_1806;
    float _1822 = fma(_1483, _1820, _1704);
    float _1824 = fma(_1511, _1810, _1712);
    float _1826 = fma(_1814, _1814, _1816);
    float _1828 = _1600 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1830 = sqrt(_1826);
    float _1832 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1834 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1836 = _1776 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1838 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1840 = _1832 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1842 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1844 = _1834 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1846 = _1794 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1848 = _1828 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1850 = _1838 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1852 = _1706 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1854 = fma(_1223, (*spvDescriptorSet0.vp_c9)._m0[158].x, _1714);
    out.m_56.x = _1802;
    out.m_56.y = _1818;
    out.m_56.z = _1822;
    out.m_56.w = _1824;
    bool _1856 = _1830 > 0.0;
    out.m_58.x = _1836;
    out.m_58.y = _1846;
    out.m_58.z = _1848;
    out.m_58.w = _1842;
    out.m_60.x = _1840;
    out.m_60.y = _1844;
    out.m_60.z = _1850;
    out.m_60.w = _1852;
    out.m_62.x = _1854;
    bool _1858 = !_1856;
    float _1860 = _1824;
    float _1862 = _1818;
    float _1864 = _1764;
    float _1866 = _1766;
    float _1868 = _1768;
    float _1870 = _1848;
    float _1872 = _1842;
    if (!_1858)
    {
        bool _1874 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _1876 = _1802;
        if (_1874)
        {
            float _1878 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _1876 = _1878;
        }
        float _1880 = _1876;
        float _1882 = _1880;
        if (_1874)
        {
            float _1884 = _1880 * _601;
            _1860 = _1884;
        }
        float _1886 = _1860;
        float _1888 = _1886;
        if (_1874)
        {
            float _1890 = _1880 * _599;
            _1862 = _1890;
        }
        float _1892 = _1862;
        float _1894 = _1892;
        if (_1874)
        {
            float _1896 = _1880 * _603;
            _1882 = _1896;
        }
        float _1898 = _1882;
        float _1900 = _1898;
        float _1902 = _1898;
        if (!_1874)
        {
            float _1904 = _119 + 1.0;
            float _1906 = _1904;
            if (!_161)
            {
                float _1908 = _1904 * _1904;
                float _1910 = _1908 * 0.5;
                _1900 = _1910;
            }
            float _1912 = _1900;
            float _1914 = _1912;
            if (!_161)
            {
                float _1916 = _1912 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1914 = _1916;
            }
            float _1918 = _1914;
            bool _1920 = !_161;
            float _1922 = _1918;
            if (!_1920)
            {
                float _1924 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1926 = log2(_1924);
                float _1928 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1930 = _1928 + 1.0;
                float _1932 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1934 = _1926 * _1904;
                float _1936 = 1.0 / _1930;
                float _1938 = _1932 * 0.693147182464599609375;
                float _1940 = exp2(_1934);
                float _1942 = 1.0 / _1938;
                float _1944 = _1940 + (-1.0);
                float _1946 = -_1944;
                float _1948 = fma(_1946, _1942, _1904);
                float _1950 = _1948 * _1936;
                float _1952 = _1950 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1922 = _1952;
            }
            float _1954 = _1922;
            float _1956 = _1954 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _1958 = _1954 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _1960 = !_161;
            if (!_1960)
            {
                float _1962 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1964 = log2(_1962);
                float _1966 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1968 = _1966 + 1.0;
                float _1970 = 1.0 / _1968;
                float _1972 = _1964 * _1904;
                float _1974 = exp2(_1972);
                float _1976 = -_1974;
                float _1978 = _1976 + 1.0;
                float _1980 = _1978 * _1970;
                _1906 = _1980;
            }
            float _1982 = _1906;
            float _1984 = fma(_1982, _149, _1958);
            float _1986 = _1954 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _1988 = fma(_1982, _147, _1956);
            float _1990 = -_359;
            float _1992 = _1990 + _1984;
            float _1994 = fma(_1982, _151, _1986);
            float _1996 = -_365;
            float _1998 = _1996 + _1988;
            float _2000 = _1992 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _2002 = _1992 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _2004 = -_373;
            float _2006 = _2004 + _1994;
            float _2008 = _1992 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _2010 = fma(_1998, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2000);
            float _2012 = fma(_1998, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2002);
            float _2014 = fma(_1998, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2008);
            float _2016 = fma(_2006, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2010);
            float _2018 = fma(_2006, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2012);
            float _2020 = fma(_2006, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2014);
            float _2022 = _2016 * _2016;
            float _2024 = fma(_2018, _2018, _2022);
            float _2026 = fma(_2020, _2020, _2024);
            _1161 = _2026;
            _609 = _2016;
            _611 = _2018;
            _613 = _2020;
            _1888 = _2018;
            _1894 = _2016;
            _1902 = _2020;
        }
        float _2028 = _1161;
        float _2030 = _609;
        float _2032 = _611;
        float _2034 = _613;
        float _2036 = _1888;
        float _2038 = _1894;
        float _2040 = _1902;
        float _2042 = sqrt(_2028);
        float _2044 = rsqrt(_1826);
        bool _2046 = _2042 > 0.0;
        float _2048 = _1790 * _2044;
        float _2050 = _1774 * _2044;
        float _2052 = _1814 * _2044;
        bool _2054 = !_2046;
        if (!_2054)
        {
            float _2056 = rsqrt(_2028);
            float _2058 = _2056 * _2030;
            float _2060 = _2056 * _2032;
            float _2062 = _2056 * _2034;
            float _2064 = _2050 * _2058;
            float _2066 = fma(_2048, _2060, _2064);
            float _2068 = fma(_2052, _2062, _2066);
            float _2070 = _2068 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2072 = fma(_2036, _2070, _1766);
            float _2074 = fma(_2038, _2070, _1764);
            float _2076 = fma(_2040, _2070, _1768);
            _1864 = _2074;
            _1866 = _2072;
            _1868 = _2076;
        }
    }
    float _2078 = _1864;
    float _2080 = _1866;
    float _2082 = _1868;
    bool _2084 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2086 = isnan(0.5);
    bool _2088 = _2084 || _2086;
    bool _2090 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2092 = _2088 || _2090;
    float _2094 = -_1181;
    float _2096 = fma(_2094, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2078);
    float _2098 = -_1195;
    float _2100 = fma(_2098, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1039);
    float _2102 = -_1195;
    float _2104 = fma(_2102, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2080);
    float _2106 = -_1343;
    float _2108 = fma(_2106, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2082);
    float _2110 = -_1181;
    float _2112 = fma(_2110, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1023);
    float _2114 = -_1343;
    float _2116 = fma(_2114, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1069);
    float _2118 = _2096;
    float _2120 = _2104;
    float _2122 = _2108;
    float _2124 = _2116;
    if (!_2092)
    {
        float _2126 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2128 = _2112 + _2126;
        float _2130 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2132 = _2100 + _2130;
        float _2134 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2136 = -_1069;
        float _2138 = _2136 + _2082;
        float _2140 = _2128 * _2128;
        float _2142 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2144 = _2116 + _2142;
        float _2146 = -_1039;
        float _2148 = _2146 + _2080;
        float _2150 = -_1023;
        float _2152 = _2150 + _2078;
        float _2154 = fma(_2132, _2132, _2140);
        float _2156 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2158 = fma(_2144, _2144, _2154);
        float _2160 = sqrt(_2158);
        float _2162 = 1.0 / _1441;
        float _2164 = _2156 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2166 = precise::min(_2160, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2168 = _2166 * _2134;
        float _2170 = _2168 * _2162;
        float _2172 = _2164 * _2170;
        float _2174 = _2138 * _2170;
        float _2176 = fma(_2148, _2172, _2100);
        float _2178 = fma(_2152, _2172, _2112);
        float _2180 = fma(_2164, _2174, _2116);
        _2118 = _2178;
        _2120 = _2176;
        _2122 = _2180;
        _1163 = _2174;
    }
    float _2182 = _2118;
    float _2184 = _2120;
    float _2186 = _2122;
    float _2188 = _1163;
    float _2190 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2192 = _2182 + _2190;
    float _2194 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2196 = _2184 + _2194;
    float _2198 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2200 = _2186 + _2198;
    float _2202 = _2192 * _2192;
    float _2204 = fma(_2196, _2196, _2202);
    float _2206 = fma(_2200, _2200, _2204);
    float _2208 = rsqrt(_2206);
    float _2210 = sqrt(_2206);
    float _2212 = _2208 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2214 = _2196 * _2212;
    float _2216 = _2200 * _2212;
    float _2218 = _2214 * _2214;
    float _2220 = _2216 * _2216;
    float _2222 = _2218 + _2220;
    float _2224 = sqrt(_2222);
    bool _2226 = _2224 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2228 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2230 = _2224 + _2228;
    float _2232 = _2200;
    float _2234 = _2230;
    float _2236 = _2192;
    float _2238 = _2188;
    if (_2226)
    {
        float _2240 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2232 = _2240;
    }
    float _2242 = _2232;
    if (_2226)
    {
        float _2244 = rsqrt(_2222);
        _1870 = _2244;
    }
    float _2246 = _1870;
    float _2248 = _2246;
    if (_2226)
    {
        float _2250 = _2230 * _2242;
        _2234 = _2250;
    }
    float _2252 = _2234;
    if (_2226)
    {
        float _2254 = _2252 * 0.15915493667125701904296875;
        _1872 = _2254;
    }
    float _2256 = _1872;
    float _2258 = _2202;
    if (_2226)
    {
        float _2260 = _2256 * 6.283185482025146484375;
        float _2262 = sin(_2260);
        _2258 = _2262;
    }
    float _2264 = _2258;
    float _2266 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2268 = precise::max(0.0, _2266);
    float _2270 = _2208;
    float _2272 = _2268;
    float _2274 = _2266;
    if (_2226)
    {
        float _2276 = _2256 * 6.283185482025146484375;
        float _2278 = cos(_2276);
        _2270 = _2278;
    }
    float _2280 = _2270;
    float _2282 = -_2212;
    float _2284 = -_2268;
    float _2286 = fma(_2192, _2282, _2284);
    if (!_2226)
    {
        _2272 = _2218;
    }
    float _2288 = _2272;
    float _2290 = _2288;
    if (_2226)
    {
        float _2292 = _2286 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2274 = _2292;
    }
    float _2294 = _2274;
    float _2296 = _2264;
    float _2298 = _2294;
    if (_2226)
    {
        float _2300 = fma(_2264, _2294, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2236 = _2300;
    }
    float _2302 = _2236;
    float _2304 = _2302;
    if (!_2226)
    {
        _2296 = _2214;
    }
    float _2306 = _2296;
    float _2308 = _2306;
    float _2310 = _2280;
    if (_2226)
    {
        float _2312 = _2280 + (-1.0);
        _2298 = _2312;
    }
    float _2314 = _2298;
    float _2316 = _2314;
    if (_2226)
    {
        float _2318 = _2246 * _2302;
        _2238 = _2318;
    }
    float _2320 = _2238;
    if (!_2226)
    {
        _2304 = _2286;
    }
    float _2322 = _2304;
    float _2324 = _2322;
    if (_2226)
    {
        float _2326 = _2314 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2248 = _2326;
    }
    float _2328 = _2248;
    if (_2226)
    {
        float _2330 = _2214 * _2320;
        _2308 = _2330;
    }
    float _2332 = _2308;
    if (!_2226)
    {
        _2316 = _2216;
    }
    float _2334 = _2316;
    float _2336 = _2334;
    if (_2226)
    {
        float _2338 = _2216 * _2320;
        _2336 = _2338;
    }
    float _2340 = _2336;
    if (_2226)
    {
        float _2342 = fma(_2286, _2280, _2328);
        _2324 = _2342;
    }
    float _2344 = _2324;
    if (_2226)
    {
        float _2346 = _2332 * _2332;
        _2290 = _2346;
    }
    float _2348 = _2290;
    if (!_2226)
    {
        _2310 = _2220;
    }
    float _2350 = _2310;
    float _2352 = _2350;
    if (_2226)
    {
        float _2354 = _2340 * _2340;
        _2352 = _2354;
    }
    float _2356 = _2352;
    float _2358 = fma(_2344, _2344, _2348);
    float _2360 = _2358 + _2356;
    float _2362 = _2182 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2364 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2366 = fma(_2210, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2364);
    float _2368 = precise::clamp(_2366, 0.0, 1.0);
    float _2370 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2372 = rsqrt(_2360);
    float _2374 = fma(_2184, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2362);
    float _2376 = _2182 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2378 = -_2368;
    float _2380 = _2378 + 1.0;
    float _2382 = fma(_2186, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2374);
    float _2384 = _2182 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2386 = fma(_2184, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2376);
    float _2388 = _2182 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2390 = _2382 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2392 = fma(_2184, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2384);
    float _2394 = fma(_2186, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2386);
    float _2396 = fma(_2184, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2388);
    float _2398 = _2390 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2400 = fma(_2186, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2392);
    float _2402 = _2394 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2404 = fma(_2186, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2396);
    float _2406 = abs(_2380);
    float _2408 = log2(_2406);
    float _2410 = _2372 * _2332;
    float _2412 = -_2398;
    float _2414 = fma(_2412, _2370, 1.0);
    float _2416 = _2400 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2418 = _2402 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2420 = _2372 * _2344;
    float _2422 = _2372 * _2340;
    float _2424 = fma(_2416, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2418);
    float _2426 = _2404 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2428 = _2410 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2430 = log2(_2414);
    float _2432 = fma(_2390, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2424);
    float _2434 = _2402 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2436 = -_2428;
    float _2438 = fma(_2420, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2436);
    float _2440 = _2420 + 1.0;
    float _2442 = fma(_2426, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2432);
    float _2444 = _2408 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2446 = -_2422;
    float _2448 = fma(_2446, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2438);
    float _2450 = _2402 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2452 = 1.0 / _2442;
    float _2454 = fma(_2416, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2434);
    float _2456 = fma(_2448, -0.5, 0.5);
    float _2458 = fma(_2416, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2450);
    float _2460 = fma(_2448, 0.5, 0.5);
    float _2462 = fma(_2390, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2454);
    float _2464 = fma(_2390, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2458);
    float _2466 = exp2(_2444);
    float _2468 = fma(_2460, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2470 = fma(_2426, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2462);
    float _2472 = fma(_2426, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2464);
    float _2474 = _2430 * 0.693147182464599609375;
    float _2476 = fma(_2460, _2468, -0.212114393711090087890625);
    float _2478 = sqrt(_2456);
    float _2480 = _2472 * _2452;
    float _2482 = _2470 * _2452;
    float _2484 = fma(_2460, _2476, 1.570728778839111328125);
    float _2486 = _2474 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2488 = fma(_2480, 0.5, 0.5);
    float _2490 = fma(_2482, -0.5, 0.5);
    float _2492 = -_2420;
    float _2494 = fma(_2466, _2440, _2492);
    float3 _6612 = float3(_2488, _2490, _2486);
    float _2496 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6612, float3(0.0), isnan(_6612)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6612, float3(0.0), isnan(_6612)), level(0.0)).x;
    float3 _6623 = float3(_2488, _2490, _2486);
    float4 _2499 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6623, float3(0.0), isnan(_6623)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6623, float3(0.0), isnan(_6623)), level(0.0)).xyzw;
    float _2501 = _2499.x;
    float _2503 = _2499.y;
    float _2505 = _2499.z;
    float _2507 = _2499.w;
    float _2509 = fma(_2494, 0.5, 0.5);
    float _2511 = _2478 * 0.636619746685028076171875;
    float _2513 = -_2484;
    float _2515 = fma(_2511, _2513, 1.0);
    float2 _6650 = float2(_2515, _2509);
    float3 _2519 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6650, float2(0.0), isnan(_6650)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6650, float2(0.0), isnan(_6650)), level(0.0)).xyz;
    float _2521 = _2519.x;
    float _2523 = _2519.y;
    float _2525 = _2519.z;
    float _2527 = _2112 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _2529 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2531 = isnan(0.5);
    bool _2533 = _2529 || _2531;
    bool _2535 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2537 = _2533 || _2535;
    float _2539 = fma(_2100, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2527);
    float _2541 = fma(_2116, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2539);
    float _2543 = _2112 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2545 = _2541 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2547 = fma(_2100, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2543);
    float _2549 = 1.0 / _2545;
    float _2551 = fma(_2116, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2547);
    float _2553 = _2490;
    float _2555 = _2511;
    float _2557 = _2402;
    if (!_2537)
    {
        _2124 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _2559 = _2124;
    float _2561 = _2551 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2563 = _2561 + _2545;
    if (!_2537)
    {
        _2553 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2565 = _2553;
    float _2567 = _2408 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2569 = _2402 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2571 = _2569;
    if (!_2537)
    {
        float _2573 = -_2565;
        float _2575 = _2573 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _2555 = _2575;
    }
    float _2577 = _2555;
    float _2579 = _2563 * _2549;
    float _2581 = _2579 * 0.5;
    float _2583 = exp2(_2567);
    float _2585 = _2549;
    float _2587 = _2577;
    if (!_2537)
    {
        float _2589 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2591 = fma(_2581, _2559, _2589);
        _2585 = _2591;
    }
    float _2593 = _2585;
    float _2595 = fma(_2416, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2569);
    if (_2537)
    {
        _2571 = 1.0;
    }
    float _2597 = _2571;
    float _2599 = _2597;
    if (!_2537)
    {
        float _2601 = 1.0 / _2577;
        _2587 = _2601;
    }
    float _2603 = _2587;
    float _2605 = fma(_2390, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2595);
    float _2607 = fma(_2426, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2605);
    float _2609 = _2593;
    if (!_2537)
    {
        float _2611 = 1.0 / _2593;
        _2609 = _2611;
    }
    float _2613 = _2609;
    float _2615 = -_2583;
    float _2617 = _2615 + 1.0;
    float _2619 = _2607 + _2442;
    float _2621 = _2617 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (!_2537)
    {
        float _2623 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2625 = -_2565;
        float _2627 = fma(_2613, _2623, _2625);
        _2557 = _2627;
    }
    float _2629 = _2557;
    if (!_2537)
    {
        float _2631 = _2629 * _2603;
        float _2633 = precise::clamp(_2631, 0.0, 1.0);
        _2599 = _2633;
    }
    float _2635 = _2599;
    float _2637 = _2619 * 0.5;
    out.gl_Position.x = _2472;
    out.gl_Position.y = _2470;
    out.gl_Position.z = _2607;
    out.gl_Position.w = _2442;
    float _2639 = _2635 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2641 = _2635 > 0.0;
    bool _2643 = isnan(_2635);
    bool _2645 = _2641 || _2643;
    bool _2647 = isnan(0.0);
    bool _2649 = _2645 || _2647;
    out.m_64.z = _2637;
    out.m_64.w = _2442;
    float _2651 = _2639 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_45.x = _2651;
    float _2653 = _2621 * _2496;
    float _2655 = -_2621;
    float _2657 = _2655 + 1.0;
    float _2659 = _2507 * _2653;
    float _2661 = _2525 * _2653;
    float _2663 = fma(_2521, _2659, _2501);
    float _2665 = fma(_2523, _2659, _2503);
    float _2667 = _2507 * _2657;
    float _2669 = fma(_2507, _2661, _2505);
    out.m_66.x = _2663;
    out.m_66.y = _2665;
    out.m_66.z = _2669;
    out.m_66.w = _2667;
    if (_2649)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _2671 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2671;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _889 = false;
    bool _633 = false;
    bool _477 = false;
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
    if (!_89)
    {
        _91 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _93 = _91;
    float _95 = _93;
    if (!_89)
    {
        out.m_45.x = 0.0;
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
        float _2728 = as_type<float>(_101);
        out.gl_Position.z = _2728;
    }
    if (!_89)
    {
        return out;
    }
    float _105 = in.m_47.w;
    bool _107 = _105 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _109 = isnan(_105);
    bool _111 = _107 || _109;
    bool _113 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _115 = _111 || _113;
    float _117 = -_105;
    float _119 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _121 = 0.0;
    if (_115)
    {
        float _123 = float(_85);
        _95 = _123;
    }
    float _125 = _95;
    bool _127 = _119 >= _125;
    bool _129 = !_115;
    bool _131 = _127 || _129;
    float _133 = _125;
    if (_131)
    {
        _133 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _135 = _133;
    if (_131)
    {
        out.m_45.x = 0.0;
    }
    if (_131)
    {
        float _137 = _135 * 5.0;
        _103 = as_type<int>(_137);
    }
    int _139 = _103;
    float _141 = as_type<float>(_139);
    if (_131)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2799 = as_type<float>(_139);
        out.gl_Position.z = _2799;
    }
    if (_131)
    {
        return out;
    }
    float _143 = as_type<float>(int(gl_VertexIndex));
    float _145 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _147 = in.m_47.x;
    float _149 = in.m_47.y;
    float _151 = in.m_47.z;
    bool _153 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _155 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _157 = _153 || _155;
    bool _159 = isnan(1.0);
    bool _161 = _157 || _159;
    float _163 = 0.0;
    float _165 = _145;
    if (!_161)
    {
        float _167 = _145 * _145;
        float _169 = _167 * 0.5;
        _163 = _169;
    }
    float _171 = _163;
    float _173 = 0.0;
    float _175 = _171;
    if (!_161)
    {
        float _177 = _119 * _119;
        float _179 = _177 * 0.5;
        _173 = _179;
    }
    float _181 = _173;
    if (!_161)
    {
        float _183 = _171 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _175 = _183;
    }
    float _185 = _175;
    int _187 = as_type<int>(_143) & 1;
    bool _189 = _187 != 0;
    int _191 = as_type<int>(_143) & 2;
    bool _193 = _191 != 0;
    bool _195 = !_189;
    float _197 = _195 ? (-0.5) : 0.5;
    bool _199 = !_193;
    float _201 = _199 ? (-0.5) : 0.5;
    bool _203 = !_161;
    float _205 = _185;
    if (!_203)
    {
        float _207 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _209 = log2(_207);
        float _211 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _213 = _211 + 1.0;
        float _215 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _217 = _145 * _209;
        float _219 = 1.0 / _213;
        float _221 = _215 * 0.693147182464599609375;
        float _223 = exp2(_217);
        float _225 = 1.0 / _221;
        float _227 = _223 + (-1.0);
        float _229 = -_227;
        float _231 = fma(_229, _225, _145);
        float _233 = _231 * _219;
        float _235 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _141 = _223;
        _205 = _235;
        _121 = _225;
    }
    float _237 = _141;
    float _239 = _205;
    float _241 = _121;
    bool _243 = !_161;
    float _245 = _237;
    float _247 = _241;
    if (!_243)
    {
        float _249 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _251 = log2(_249);
        float _253 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _255 = _253 + 1.0;
        float _257 = 1.0 / _255;
        float _259 = _145 * _251;
        float _261 = exp2(_259);
        float _263 = -_261;
        float _265 = _263 + 1.0;
        float _267 = _265 * _257;
        _245 = _261;
        _247 = _255;
        _165 = _267;
    }
    float _269 = _245;
    float _271 = _247;
    float _273 = _165;
    float _275 = _271;
    float _277 = _269;
    if (!_161)
    {
        _275 = _119;
    }
    float _279 = _275;
    float _281 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _283 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _285 = _279;
    if (!_161)
    {
        float _287 = _181 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _277 = _287;
    }
    float _289 = _277;
    bool _291 = !_161;
    float _293 = _289;
    if (!_291)
    {
        float _295 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _297 = log2(_295);
        float _299 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _301 = _299 + 1.0;
        float _303 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _305 = _119 * _297;
        float _307 = 1.0 / _301;
        float _309 = _303 * 0.693147182464599609375;
        float _311 = exp2(_305);
        float _313 = 1.0 / _309;
        float _315 = _311 + (-1.0);
        float _317 = -_315;
        float _319 = fma(_317, _313, _119);
        float _321 = _319 * _307;
        float _323 = _321 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _293 = _323;
    }
    float _325 = _293;
    bool _327 = !_161;
    if (!_327)
    {
        float _329 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _331 = log2(_329);
        float _333 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _335 = _333 + 1.0;
        float _337 = 1.0 / _335;
        float _339 = _119 * _331;
        float _341 = exp2(_339);
        float _343 = -_341;
        float _345 = _343 + 1.0;
        float _347 = _345 * _337;
        _285 = _347;
    }
    float _349 = _285;
    float _351 = _325 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _353 = fma(_273, _149, _283);
    float _355 = _325 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _357 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _359 = fma(_349, _149, _351);
    float _361 = _325 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _363 = fma(_273, _147, _281);
    float _365 = fma(_349, _147, _355);
    float _367 = -_359;
    float _369 = _353 + _367;
    float _371 = fma(_273, _151, _357);
    float _373 = fma(_349, _151, _361);
    float _375 = -_365;
    float _377 = _363 + _375;
    float _379 = _369 * _369;
    float _381 = in.m_52.w;
    float _383 = -_373;
    float _385 = _371 + _383;
    float _387 = _369 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _389 = fma(_377, _377, _379);
    float _391 = _369 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _393 = _369 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _395 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[4].x, _387);
    float _397 = fma(_385, _385, _389);
    float _399 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[5].x, _391);
    float _401 = in.m_42.x;
    float _403 = in.m_42.y;
    float _405 = in.m_42.z;
    float _407 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[6].x, _393);
    float _409 = fma(_385, (*spvDescriptorSet0.vp_c10)._m0[4].z, _395);
    float _411 = sqrt(_397);
    float _413 = fma(_385, (*spvDescriptorSet0.vp_c10)._m0[5].z, _399);
    float _415 = fma(_385, (*spvDescriptorSet0.vp_c10)._m0[6].z, _407);
    bool _417 = _411 >= 9.9999999747524270787835121154785e-07;
    bool _419 = isnan(_411);
    bool _421 = _417 || _419;
    bool _423 = isnan(9.9999999747524270787835121154785e-07);
    bool _425 = _421 || _423;
    float _427 = fma(_363, _381, _401);
    float _429 = fma(_353, _381, _403);
    float _431 = fma(_371, _381, _405);
    float _433 = _413;
    float _435 = _409;
    float _437 = _415;
    if (!_425)
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
            _433 = _473;
            _435 = _471;
            _437 = _475;
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
                float _497 = _403 * _403;
                float _499 = fma(_401, _401, _497);
                float _501 = fma(_405, _405, _499);
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
                    _433 = _527;
                    _435 = _525;
                    _437 = _529;
                    _477 = true;
                }
                else
                {
                    float _531 = _403 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _533 = _403 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _535 = _403 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _537 = fma(_401, (*spvDescriptorSet0.vp_c10)._m0[5].x, _531);
                    float _539 = fma(_401, (*spvDescriptorSet0.vp_c10)._m0[4].x, _533);
                    float _541 = fma(_401, (*spvDescriptorSet0.vp_c10)._m0[6].x, _535);
                    float _543 = fma(_405, (*spvDescriptorSet0.vp_c10)._m0[5].z, _537);
                    float _545 = fma(_405, (*spvDescriptorSet0.vp_c10)._m0[4].z, _539);
                    float _547 = fma(_405, (*spvDescriptorSet0.vp_c10)._m0[6].z, _541);
                    float _549 = _543 * _543;
                    float _551 = fma(_545, _545, _549);
                    float _553 = fma(_547, _547, _551);
                    float _555 = rsqrt(_553);
                    float _557 = _555 * 9.9999999747524270787835121154785e-07;
                    float _559 = _545 * _557;
                    float _561 = _543 * _557;
                    float _563 = _547 * _557;
                    _433 = _561;
                    _435 = _559;
                    _437 = _563;
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
                _433 = _595;
                _435 = _593;
                _437 = _597;
            }
        }
    }
    _477 = false;
    float _599 = _433;
    float _601 = _435;
    float _603 = _437;
    bool _605 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _607 = !_605;
    float _609 = _599;
    float _611 = _601;
    float _613 = _603;
    float _631;
    if (!_607)
    {
        float _615 = in.m_54.x;
        float _617 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _619 = _615 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _621 = fma(_619, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _623 = _621 * _617;
        float _625 = floor(_623);
        float _627 = -_625;
        float _629 = _623 + _627;
        _631 = _629;
        _633 = true;
    }
    else
    {
        float _635 = float(_85);
        float _637 = 1.0 / _635;
        float _639 = _119 * _637;
        _631 = _639;
    }
    _633 = false;
    float _641 = _631;
    float _643 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _645 = _641 + _643;
    float _647 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _649 = _641 + _647;
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _653 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _651;
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _657 = _655 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _659 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _661 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _659;
    float _663 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _665 = _663 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _667 = 1.0 / _657;
    float _669 = in.m_52.x;
    float _671 = in.m_52.y;
    bool _673 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _675 = 1.0 / _653;
    bool _677 = _641 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _679 = isnan(_641);
    bool _681 = _677 || _679;
    bool _683 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _685 = _681 || _683;
    float _687 = float(_685);
    float _689 = 1.0 / _661;
    float _691 = _649 * _667;
    bool _693 = _641 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _695 = isnan(_641);
    bool _697 = _693 || _695;
    bool _699 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _701 = _697 || _699;
    float _703 = float(_701);
    float _705 = 1.0 / _665;
    float _707 = _645 * _675;
    float _709 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _711 = _641 + _709;
    float _713 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _715 = _641 + _713;
    float _717 = _711 * _689;
    float _719 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _721 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _719;
    float _723 = -_703;
    float _725 = _723 + 1.0;
    float _727 = fma(_721, _707, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _729 = _687 * _725;
    bool _731 = _641 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _733 = isnan(_641);
    bool _735 = _731 || _733;
    bool _737 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _739 = _735 || _737;
    float _741 = float(_739);
    float _743 = _715 * _705;
    float _745 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _747 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _745;
    bool _749 = _641 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _751 = isnan(_641);
    bool _753 = _749 || _751;
    bool _755 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _757 = _753 || _755;
    float _759 = float(_757);
    bool _761 = _641 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _763 = isnan(_641);
    bool _765 = _761 || _763;
    bool _767 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _769 = _765 || _767;
    float _771 = float(_769);
    float _773 = fma(_747, _707, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _775 = -_687;
    float _777 = _775 + 1.0;
    float _779 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _781 = _779 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _783 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _785 = _783 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _787 = _759 * _777;
    float _789 = -_759;
    float _791 = _789 + 1.0;
    float _793 = fma(_781, _691, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _795 = fma(_785, _691, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _797 = _741 * _791;
    float _799 = -_741;
    float _801 = _799 + 1.0;
    float _803 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _805 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _803;
    float _807 = _771 * _801;
    float _809 = -_771;
    float _811 = _809 + 1.0;
    float _813 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _815 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _813;
    float _817 = fma(_805, _717, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _819 = _727 * _807;
    float _821 = _773 * _807;
    float _823 = fma(_815, _717, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _825 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _827 = _825 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _829 = fma(_811, (*spvDescriptorSet0.vp_c9)._m0[143].x, _819);
    float _831 = fma(_811, (*spvDescriptorSet0.vp_c9)._m0[143].y, _821);
    float _833 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _835 = _833 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _837 = fma(_827, _743, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _839 = fma(_793, _797, _829);
    float _841 = fma(_795, _797, _831);
    float _843 = fma(_835, _743, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _845 = fma(_823, _787, _839);
    float _847 = fma(_817, _787, _841);
    float _849 = fma(_837, _729, _845);
    float _851 = fma(_843, _729, _847);
    float _853 = fma(_703, (*spvDescriptorSet0.vp_c9)._m0[147].x, _849);
    float _855 = fma(_703, (*spvDescriptorSet0.vp_c9)._m0[147].y, _851);
    float _857 = _853 * _669;
    float _859 = _855 * _671;
    bool _861 = !_673;
    float _885;
    float _887;
    if (!_861)
    {
        float _863 = in.m_54.x;
        float _865 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _867 = float(_85);
        float _869 = 1.0 / _867;
        float _871 = _863 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _873 = _119 * _869;
        float _875 = fma(_871, (*spvDescriptorSet0.vp_c9)._m0[11].y, _119);
        float _877 = _875 * _865;
        float _879 = floor(_877);
        float _881 = -_879;
        float _883 = _877 + _881;
        _885 = _873;
        _887 = _883;
        _889 = true;
    }
    else
    {
        float _891 = float(_85);
        float _893 = 1.0 / _891;
        float _895 = _119 * _893;
        _885 = _895;
        _887 = _895;
    }
    _889 = false;
    float _897 = _885;
    float _899 = _887;
    float _901 = in.m_54.x;
    float _903 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _905 = in.m_54.w;
    float _907 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _909 = _907 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _911 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _913 = _911 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _915 = 1.0 / _909;
    float _917 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _919 = _917 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _921 = in.m_54.z;
    int _923 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _925 = _923 != 0;
    int _927 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _929 = _927 != 0;
    float _931 = 1.0 / _913;
    float _933 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _935 = _933 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    int _937 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _939 = _937 != 0;
    float _941 = _903 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _943 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _945 = _943 != 0;
    float _947 = _429 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _949 = _901 > 0.5;
    float _951 = _901 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _953 = 1.0 / _919;
    float _955 = fma(_427, (*spvDescriptorSet0.vp_c10)._m0[4].x, _947);
    float _957 = -_197;
    int _959 = _949 ? as_type<int>(_957) : as_type<int>(_197);
    bool _961 = _905 > 0.5;
    float _963 = _429 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _965 = 1.0 / _935;
    float _967 = _429 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _969 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _971 = _969 != 0;
    float _973 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _975 = in.m_54.y;
    float _977 = fma(_427, (*spvDescriptorSet0.vp_c10)._m0[5].x, _963);
    float _979 = fma(_427, (*spvDescriptorSet0.vp_c10)._m0[6].x, _967);
    float _981 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _983 = _981 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _985 = -_973;
    float _987 = fma(_951, 2.0, _985);
    float _989 = 1.0 / _983;
    float _991 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[4].z, _955);
    float _993 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[5].z, _977);
    float _995 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[6].z, _979);
    float _997 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _999 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _997;
    float _1001 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1003 = _1001 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1005 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1007 = _1005 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1009 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _1011 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _1009;
    float _1013 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _1015 = _1013 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1017 = 1.0 / _1003;
    float _1019 = _1007 * _931;
    float _1021 = _1015 * _965;
    float _1023 = _993 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1025 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1027 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _1025;
    float _1029 = _1011 * _953;
    float _1031 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _1033 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1035 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1037 = _1035 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1039 = _991 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1041 = _1031 * _901;
    bool _1043 = !_925;
    float _1045 = _1043 ? _197 : as_type<float>(_959);
    float _1047 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1049 = _1023 + _1047;
    float _1051 = _1027 * _989;
    float _1053 = _989;
    float _1055 = _921;
    if (!_971)
    {
        _1053 = _975;
    }
    float _1057 = _1053;
    float _1059 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _1061 = _1059 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1063 = fma(_901, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1033);
    float _1065 = _1057;
    if (_971)
    {
        _1065 = _901;
    }
    float _1067 = _1065;
    float _1069 = _995 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1071 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1073 = _1039 + _1071;
    float _1075 = _1049 * _1049;
    float _1077 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1079 = _1077 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _1081 = 1.0 / _1037;
    float _1083 = _1061 * _1017;
    float _1085 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1087 = _1085 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1089 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1091 = _1069 + _1089;
    float _1093 = fma(_1073, _1073, _1075);
    float _1095 = _999 * _915;
    float _1097 = _599 * _599;
    float _1099 = 1.0 / _1079;
    float _1101 = fma(_1091, _1091, _1093);
    float _1103 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1105 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _1103;
    float _1107 = fma(_601, _601, _1097);
    float _1109 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _1111 = _1109 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1113 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1115 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _1113;
    float _1117 = 1.0 / _1087;
    float _1119 = _1105 * _1081;
    float _1121 = fma(_603, _603, _1107);
    bool _1123 = _975 > 0.5;
    float _1125 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1127 = _897 + _1125;
    float _1129 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1131 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1133 = rsqrt(_1101);
    float _1135 = _1115 * _1099;
    float _1137 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1139 = _899 + _1137;
    float _1141 = -_201;
    int _1143 = _1123 ? as_type<int>(_1141) : as_type<int>(_201);
    float _1145 = _975 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1147 = _921 > 0.5;
    float _1149 = fma(_1095, _1139, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1151 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1153 = _897 + _1151;
    float _1155 = rsqrt(_1121);
    float _1157 = _1111 * _1117;
    float _1159 = _1117;
    float _1161 = _1121;
    float _1163 = _1069;
    if (!_971)
    {
        _1159 = _921;
    }
    float _1165 = _1159;
    float _1167 = fma(_975, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1131);
    float _1169 = _1165;
    if (_971)
    {
        _1169 = _975;
    }
    float _1171 = _1169;
    float _1173 = fma(_1029, _1127, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    if (_971)
    {
        _1055 = _975;
    }
    float _1175 = _1055;
    float _1177 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1179 = _899 + _1177;
    float _1181 = _1049 * _1133;
    float _1183 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1185 = _897 + _1183;
    float _1187 = fma(_1145, -2.0, _1129);
    float _1189 = fma(_1021, _1153, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    float _1191 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1193 = _897 + _1191;
    float _1195 = _1073 * _1133;
    float _1197 = -_1181;
    float _1199 = fma(_1197, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1049);
    float _1201 = fma(_1019, _1179, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1203 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1205 = _897 + _1203;
    float _1207 = fma(_1119, _1185, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _1209 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1211 = _897 + _1209;
    bool _1213 = _897 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1215 = isnan(_897);
    bool _1217 = _1213 || _1215;
    bool _1219 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1221 = _1217 || _1219;
    float _1223 = float(_1221);
    float _1225 = fma(_1083, _1193, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _1227 = -_1195;
    float _1229 = fma(_1227, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1073);
    float _1231 = _1199 * _1199;
    float _1233 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1235 = _897 + _1233;
    float _1237 = fma(_1157, _1205, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    float _1239 = fma(_1051, _1211, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    bool _1241 = _897 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1243 = isnan(_897);
    bool _1245 = _1241 || _1243;
    bool _1247 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _1249 = _1245 || _1247;
    float _1251 = float(_1249);
    float _1253 = _1155 * _603;
    float _1255 = -_1223;
    float _1257 = _1255 + 1.0;
    float _1259 = fma(_1229, _1229, _1231);
    float _1261 = fma(_1135, _1235, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    bool _1263 = _897 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1265 = isnan(_897);
    bool _1267 = _1263 || _1265;
    bool _1269 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1271 = _1267 || _1269;
    float _1273 = float(_1271);
    float _1275 = _1155 * _601;
    float _1277 = _1155 * _599;
    float _1279 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1281 = _1253 * _1279;
    float _1283 = _1251 * _1257;
    float _1285 = -_1251;
    float _1287 = _1285 + 1.0;
    bool _1289 = _897 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1291 = isnan(_897);
    bool _1293 = _1289 || _1291;
    bool _1295 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1297 = _1293 || _1295;
    float _1299 = float(_1297);
    float _1301 = -_1273;
    float _1303 = _1301 + 1.0;
    float _1305 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1307 = _1277 * _1305;
    float _1309 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1311 = -_1281;
    float _1313 = fma(_1275, _1309, _1311);
    float _1315 = _1273 * _1287;
    float _1317 = _1299 * _1303;
    float _1319 = -_1299;
    float _1321 = _1319 + 1.0;
    bool _1323 = _897 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1325 = isnan(_897);
    bool _1327 = _1323 || _1325;
    bool _1329 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _1331 = _1327 || _1329;
    float _1333 = float(_1331);
    float _1335 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1337 = -_1307;
    float _1339 = fma(_1253, _1335, _1337);
    float _1341 = _1313 * _1313;
    float _1343 = _1091 * _1133;
    bool _1345 = _897 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _1347 = isnan(_897);
    bool _1349 = _1345 || _1347;
    bool _1351 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _1353 = _1349 || _1351;
    float _1355 = float(_1353);
    float _1357 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1359 = _1275 * _1357;
    float _1361 = fma(_1339, _1339, _1341);
    float _1363 = -_1343;
    float _1365 = fma(_1363, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1091);
    float _1367 = _1333 * _1321;
    float _1369 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1371 = -_1359;
    float _1373 = fma(_1277, _1369, _1371);
    bool _1375 = _897 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _1377 = isnan(_897);
    bool _1379 = _1375 || _1377;
    bool _1381 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _1383 = _1379 || _1381;
    float _1385 = float(_1383);
    float _1387 = -_1355;
    float _1389 = _1387 + 1.0;
    float _1391 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1393 = -_1333;
    float _1395 = _1393 + 1.0;
    float _1397 = fma(_1365, _1365, _1259);
    float _1399 = fma(_1373, _1373, _1361);
    float _1401 = _1385 * _1389;
    float _1403 = _1355 * _1395;
    bool _1405 = _897 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _1407 = isnan(_897);
    bool _1409 = _1405 || _1407;
    bool _1411 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _1413 = _1409 || _1411;
    float _1415 = float(_1413);
    float _1417 = -_1385;
    float _1419 = _1417 + 1.0;
    float _1421 = sqrt(_1397);
    float _1423 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1187);
    bool _1425 = !_929;
    float _1427 = _1425 ? _201 : as_type<float>(_1143);
    float _1429 = _1045 + 0.5;
    float _1431 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1433 = rsqrt(_1399);
    float _1435 = _1391 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1437 = _1415 * _1419;
    float _1439 = _1427 + (-0.5);
    float _1441 = _1133 * _1421;
    float _1443 = -_119;
    float _1445 = fma(_1443, (*spvDescriptorSet0.vp_c9)._m0[76].x, _987);
    float _1447 = _859 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1449 = fma(_1175, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1431);
    float _1451 = -_201;
    int _1453 = _961 ? as_type<int>(_1451) : as_type<int>(_201);
    float _1455 = fma(_941, _1429, _1445);
    float _1457 = _1173 * _1437;
    float _1459 = -_1435;
    float _1461 = -_1423;
    float _1463 = fma(_1459, _1439, _1461);
    float _1465 = _1373 * _1433;
    float _1467 = -_197;
    int _1469 = _1147 ? as_type<int>(_1467) : as_type<int>(_197);
    float _1471 = _1339 * _1433;
    float _1473 = _1313 * _1433;
    float _1475 = _857 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1477 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _201);
    float _1479 = _1447 * _1441;
    bool _1481 = !_939;
    float _1483 = _1481 ? _197 : as_type<float>(_1469);
    float _1485 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _197);
    bool _1487 = _899 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1489 = isnan(_899);
    bool _1491 = _1487 || _1489;
    bool _1493 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1495 = _1491 || _1493;
    float _1497 = float(_1495);
    float _1499 = trunc(_1041);
    int _1501 = int(_1499);
    float _1503 = _1277 * _1465;
    float _1505 = _1475 * _1441;
    float _1507 = _1479 * _1477;
    bool _1509 = !_945;
    float _1511 = _1509 ? _201 : as_type<float>(_1453);
    float _1513 = -_1503;
    float _1515 = fma(_1253, _1473, _1513);
    bool _1517 = _899 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1519 = isnan(_899);
    bool _1521 = _1517 || _1519;
    bool _1523 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1525 = _1521 || _1523;
    float _1527 = float(_1525);
    float _1529 = -_1497;
    float _1531 = _1529 + 1.0;
    bool _1533 = _899 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1535 = isnan(_899);
    bool _1537 = _1533 || _1535;
    bool _1539 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1541 = _1537 || _1539;
    float _1543 = float(_1541);
    float _1545 = _1505 * _1485;
    float _1547 = _1275 * _1473;
    float _1549 = _1507 * _1253;
    float _1551 = -_1415;
    float _1553 = _1551 + 1.0;
    float _1555 = _1527 * _1531;
    float _1557 = _1507 * _1275;
    float _1559 = -_1547;
    float _1561 = fma(_1277, _1471, _1559);
    float _1563 = _1441 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1565 = _1563 * 0.5;
    float _1567 = fma(_1545, _1465, _1549);
    float _1569 = -_1527;
    float _1571 = _1569 + 1.0;
    float _1573 = fma(_1545, _1471, _1557);
    float _1575 = fma(_1553, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1457);
    float _1577 = fma(_1565, _1561, _1567);
    float _1579 = _1543 * _1571;
    int _1581 = _1501 << 4;
    int _1583 = _1581 + 1968;
    float _1585 = fma(_1565, _1515, _1573);
    float _1587 = _1069 + _1577;
    float _1589 = _1149 * _1579;
    int _1591 = _1583 + 8;
    uint _1594 = uint(int(uint(_1591) >> uint(2)));
    uint _1596 = uint(int(uint(int(_1594)) >> uint(2)));
    int _1598 = int(_1594) & 3;
    float _1600 = (*spvDescriptorSet0.vp_c9)._m0[int(_1596)][_1598];
    float _1602 = _1039 + _1585;
    float _1604 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1606 = _1587 + _1604;
    float _1608 = fma(_1189, _1401, _1575);
    float _1610 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1612 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1614 = _1602 + _1612;
    float _1616 = _1606 * _1606;
    float _1618 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    uint _1620 = uint(int(uint(_1583) >> uint(2)));
    uint _1622 = uint(int(uint(int(_1620)) >> uint(2)));
    int _1624 = int(_1620) & 3;
    float _1626 = (*spvDescriptorSet0.vp_c9)._m0[int(_1622)][_1624];
    int _1628 = int(_1620) + 1;
    uint _1630 = uint(int(uint(_1628) >> uint(2)));
    int _1632 = _1628 & 3;
    float _1634 = (*spvDescriptorSet0.vp_c9)._m0[int(_1630)][_1632];
    float _1636 = _1253 * _1471;
    float _1638 = fma(_1614, _1614, _1616);
    float _1640 = _1507 * _1277;
    float _1642 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1644 = fma(_1207, _1403, _1608);
    float _1646 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1648 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1650 = fma(_1067, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1618);
    float _1652 = -_1636;
    float _1654 = fma(_1275, _1465, _1652);
    float _1656 = fma(_1545, _1473, _1640);
    float _1658 = _1067 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1660 = sqrt(_1638);
    float _1662 = _1171 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1664 = -_1543;
    float _1666 = _1664 + 1.0;
    float _1668 = fma(_1237, _1367, _1644);
    float _1670 = fma(_1565, _1654, _1656);
    float _1672 = -_1646;
    float _1674 = fma(_1658, 2.0, _1672);
    float _1676 = fma(_1662, -2.0, _1648);
    float _1678 = fma(_1666, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1589);
    float _1680 = fma(_1239, _1317, _1668);
    float _1682 = _1023 + _1670;
    float _1684 = _1610 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1686 = fma(_1201, _1555, _1678);
    float _1688 = _1642 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1690 = _1483 + 0.5;
    float _1692 = -_119;
    float _1694 = fma(_1692, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1674);
    float _1696 = _1511 + (-0.5);
    bool _1698 = _1660 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1700 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1676);
    float _1702 = fma(_1225, _1315, _1680);
    float _1704 = fma(_1684, _1690, _1694);
    float _1706 = fma(_1497, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1686);
    float _1708 = -_1688;
    float _1710 = -_1700;
    float _1712 = fma(_1708, _1696, _1710);
    float _1714 = fma(_1261, _1283, _1702);
    float _1716 = _1237;
    float _1718 = _1602;
    float _1720 = _1587;
    if (!_1698)
    {
        _1716 = _1682;
    }
    float _1722 = _1716;
    bool _1724 = !_1698;
    float _1726 = _1722;
    if (!_1724)
    {
        float _1728 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1730 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1732 = _1660 + _1730;
        float _1734 = _1682 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1736 = rsqrt(_1638);
        float _1738 = _1732 * _1728;
        float _1740 = _1738 * 0.15915493667125701904296875;
        float _1742 = _1740 * 6.283185482025146484375;
        float _1744 = cos(_1742);
        float _1746 = _1740 * 6.283185482025146484375;
        float _1748 = sin(_1746);
        float _1750 = _1744 + (-1.0);
        float _1752 = _1750 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1754 = fma(_1748, _1734, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1756 = fma(_1682, _1744, _1752);
        float _1758 = _1736 * _1754;
        float _1760 = fma(_1614, _1758, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1762 = fma(_1606, _1758, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1726 = _1756;
        _1718 = _1760;
        _1720 = _1762;
    }
    float _1764 = _1726;
    float _1766 = _1718;
    float _1768 = _1720;
    float _1770 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1063);
    float _1772 = -_1023;
    float _1774 = _1772 + _1764;
    float _1776 = _1626 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1778 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1167);
    float _1780 = -_1770;
    float _1782 = _1780 + 1.0;
    float _1784 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1650);
    float _1786 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1449);
    float _1788 = -_1039;
    float _1790 = _1788 + _1766;
    float _1792 = _1774 * _1774;
    float _1794 = _1634 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1796 = -_1778;
    float _1798 = _1796 + 1.0;
    float _1800 = -_1782;
    float _1802 = fma(_1045, _1800, _1455);
    float _1804 = -_1784;
    float _1806 = _1804 + 1.0;
    float _1808 = -_1786;
    float _1810 = _1808 + 1.0;
    float _1812 = -_1069;
    float _1814 = _1812 + _1768;
    float _1816 = fma(_1790, _1790, _1792);
    float _1818 = fma(_1427, _1798, _1463);
    float _1820 = -_1806;
    float _1822 = fma(_1483, _1820, _1704);
    float _1824 = fma(_1511, _1810, _1712);
    float _1826 = fma(_1814, _1814, _1816);
    float _1828 = _1600 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1830 = sqrt(_1826);
    float _1832 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1834 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1836 = _1776 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1838 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1840 = _1832 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1842 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1844 = _1834 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1846 = _1794 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1848 = _1828 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1850 = _1838 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1852 = _1706 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1854 = fma(_1223, (*spvDescriptorSet0.vp_c9)._m0[158].x, _1714);
    out.m_56.x = _1802;
    out.m_56.y = _1818;
    out.m_56.z = _1822;
    out.m_56.w = _1824;
    bool _1856 = _1830 > 0.0;
    out.m_58.x = _1836;
    out.m_58.y = _1846;
    out.m_58.z = _1848;
    out.m_58.w = _1842;
    out.m_60.x = _1840;
    out.m_60.y = _1844;
    out.m_60.z = _1850;
    out.m_60.w = _1852;
    out.m_62.x = _1854;
    bool _1858 = !_1856;
    float _1860 = _1824;
    float _1862 = _1818;
    float _1864 = _1764;
    float _1866 = _1766;
    float _1868 = _1768;
    float _1870 = _1848;
    float _1872 = _1842;
    if (!_1858)
    {
        bool _1874 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _1876 = _1802;
        if (_1874)
        {
            float _1878 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _1876 = _1878;
        }
        float _1880 = _1876;
        float _1882 = _1880;
        if (_1874)
        {
            float _1884 = _1880 * _601;
            _1860 = _1884;
        }
        float _1886 = _1860;
        float _1888 = _1886;
        if (_1874)
        {
            float _1890 = _1880 * _599;
            _1862 = _1890;
        }
        float _1892 = _1862;
        float _1894 = _1892;
        if (_1874)
        {
            float _1896 = _1880 * _603;
            _1882 = _1896;
        }
        float _1898 = _1882;
        float _1900 = _1898;
        float _1902 = _1898;
        if (!_1874)
        {
            float _1904 = _119 + 1.0;
            float _1906 = _1904;
            if (!_161)
            {
                float _1908 = _1904 * _1904;
                float _1910 = _1908 * 0.5;
                _1900 = _1910;
            }
            float _1912 = _1900;
            float _1914 = _1912;
            if (!_161)
            {
                float _1916 = _1912 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1914 = _1916;
            }
            float _1918 = _1914;
            bool _1920 = !_161;
            float _1922 = _1918;
            if (!_1920)
            {
                float _1924 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1926 = log2(_1924);
                float _1928 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1930 = _1928 + 1.0;
                float _1932 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1934 = _1926 * _1904;
                float _1936 = 1.0 / _1930;
                float _1938 = _1932 * 0.693147182464599609375;
                float _1940 = exp2(_1934);
                float _1942 = 1.0 / _1938;
                float _1944 = _1940 + (-1.0);
                float _1946 = -_1944;
                float _1948 = fma(_1946, _1942, _1904);
                float _1950 = _1948 * _1936;
                float _1952 = _1950 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1922 = _1952;
            }
            float _1954 = _1922;
            float _1956 = _1954 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _1958 = _1954 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _1960 = !_161;
            if (!_1960)
            {
                float _1962 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1964 = log2(_1962);
                float _1966 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1968 = _1966 + 1.0;
                float _1970 = 1.0 / _1968;
                float _1972 = _1964 * _1904;
                float _1974 = exp2(_1972);
                float _1976 = -_1974;
                float _1978 = _1976 + 1.0;
                float _1980 = _1978 * _1970;
                _1906 = _1980;
            }
            float _1982 = _1906;
            float _1984 = fma(_1982, _149, _1958);
            float _1986 = _1954 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _1988 = fma(_1982, _147, _1956);
            float _1990 = -_359;
            float _1992 = _1990 + _1984;
            float _1994 = fma(_1982, _151, _1986);
            float _1996 = -_365;
            float _1998 = _1996 + _1988;
            float _2000 = _1992 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _2002 = _1992 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _2004 = -_373;
            float _2006 = _2004 + _1994;
            float _2008 = _1992 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _2010 = fma(_1998, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2000);
            float _2012 = fma(_1998, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2002);
            float _2014 = fma(_1998, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2008);
            float _2016 = fma(_2006, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2010);
            float _2018 = fma(_2006, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2012);
            float _2020 = fma(_2006, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2014);
            float _2022 = _2016 * _2016;
            float _2024 = fma(_2018, _2018, _2022);
            float _2026 = fma(_2020, _2020, _2024);
            _1161 = _2026;
            _609 = _2016;
            _611 = _2018;
            _613 = _2020;
            _1888 = _2018;
            _1894 = _2016;
            _1902 = _2020;
        }
        float _2028 = _1161;
        float _2030 = _609;
        float _2032 = _611;
        float _2034 = _613;
        float _2036 = _1888;
        float _2038 = _1894;
        float _2040 = _1902;
        float _2042 = sqrt(_2028);
        float _2044 = rsqrt(_1826);
        bool _2046 = _2042 > 0.0;
        float _2048 = _1790 * _2044;
        float _2050 = _1774 * _2044;
        float _2052 = _1814 * _2044;
        bool _2054 = !_2046;
        if (!_2054)
        {
            float _2056 = rsqrt(_2028);
            float _2058 = _2056 * _2030;
            float _2060 = _2056 * _2032;
            float _2062 = _2056 * _2034;
            float _2064 = _2050 * _2058;
            float _2066 = fma(_2048, _2060, _2064);
            float _2068 = fma(_2052, _2062, _2066);
            float _2070 = _2068 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2072 = fma(_2036, _2070, _1766);
            float _2074 = fma(_2038, _2070, _1764);
            float _2076 = fma(_2040, _2070, _1768);
            _1864 = _2074;
            _1866 = _2072;
            _1868 = _2076;
        }
    }
    float _2078 = _1864;
    float _2080 = _1866;
    float _2082 = _1868;
    bool _2084 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2086 = isnan(0.5);
    bool _2088 = _2084 || _2086;
    bool _2090 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2092 = _2088 || _2090;
    float _2094 = -_1181;
    float _2096 = fma(_2094, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2078);
    float _2098 = -_1195;
    float _2100 = fma(_2098, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1039);
    float _2102 = -_1195;
    float _2104 = fma(_2102, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2080);
    float _2106 = -_1343;
    float _2108 = fma(_2106, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2082);
    float _2110 = -_1181;
    float _2112 = fma(_2110, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1023);
    float _2114 = -_1343;
    float _2116 = fma(_2114, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1069);
    float _2118 = _2096;
    float _2120 = _2104;
    float _2122 = _2108;
    float _2124 = _2116;
    if (!_2092)
    {
        float _2126 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2128 = _2112 + _2126;
        float _2130 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2132 = _2100 + _2130;
        float _2134 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2136 = -_1069;
        float _2138 = _2136 + _2082;
        float _2140 = _2128 * _2128;
        float _2142 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2144 = _2116 + _2142;
        float _2146 = -_1039;
        float _2148 = _2146 + _2080;
        float _2150 = -_1023;
        float _2152 = _2150 + _2078;
        float _2154 = fma(_2132, _2132, _2140);
        float _2156 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2158 = fma(_2144, _2144, _2154);
        float _2160 = sqrt(_2158);
        float _2162 = 1.0 / _1441;
        float _2164 = _2156 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2166 = precise::min(_2160, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2168 = _2166 * _2134;
        float _2170 = _2168 * _2162;
        float _2172 = _2164 * _2170;
        float _2174 = _2138 * _2170;
        float _2176 = fma(_2148, _2172, _2100);
        float _2178 = fma(_2152, _2172, _2112);
        float _2180 = fma(_2164, _2174, _2116);
        _2118 = _2178;
        _2120 = _2176;
        _2122 = _2180;
        _1163 = _2174;
    }
    float _2182 = _2118;
    float _2184 = _2120;
    float _2186 = _2122;
    float _2188 = _1163;
    float _2190 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2192 = _2182 + _2190;
    float _2194 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2196 = _2184 + _2194;
    float _2198 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2200 = _2186 + _2198;
    float _2202 = _2192 * _2192;
    float _2204 = fma(_2196, _2196, _2202);
    float _2206 = fma(_2200, _2200, _2204);
    float _2208 = rsqrt(_2206);
    float _2210 = sqrt(_2206);
    float _2212 = _2208 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2214 = _2196 * _2212;
    float _2216 = _2200 * _2212;
    float _2218 = _2214 * _2214;
    float _2220 = _2216 * _2216;
    float _2222 = _2218 + _2220;
    float _2224 = sqrt(_2222);
    bool _2226 = _2224 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2228 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2230 = _2224 + _2228;
    float _2232 = _2200;
    float _2234 = _2230;
    float _2236 = _2192;
    float _2238 = _2188;
    if (_2226)
    {
        float _2240 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2232 = _2240;
    }
    float _2242 = _2232;
    if (_2226)
    {
        float _2244 = rsqrt(_2222);
        _1870 = _2244;
    }
    float _2246 = _1870;
    float _2248 = _2246;
    if (_2226)
    {
        float _2250 = _2230 * _2242;
        _2234 = _2250;
    }
    float _2252 = _2234;
    if (_2226)
    {
        float _2254 = _2252 * 0.15915493667125701904296875;
        _1872 = _2254;
    }
    float _2256 = _1872;
    float _2258 = _2202;
    if (_2226)
    {
        float _2260 = _2256 * 6.283185482025146484375;
        float _2262 = sin(_2260);
        _2258 = _2262;
    }
    float _2264 = _2258;
    float _2266 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2268 = precise::max(0.0, _2266);
    float _2270 = _2208;
    float _2272 = _2268;
    float _2274 = _2266;
    if (_2226)
    {
        float _2276 = _2256 * 6.283185482025146484375;
        float _2278 = cos(_2276);
        _2270 = _2278;
    }
    float _2280 = _2270;
    float _2282 = -_2212;
    float _2284 = -_2268;
    float _2286 = fma(_2192, _2282, _2284);
    if (!_2226)
    {
        _2272 = _2218;
    }
    float _2288 = _2272;
    float _2290 = _2288;
    if (_2226)
    {
        float _2292 = _2286 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2274 = _2292;
    }
    float _2294 = _2274;
    float _2296 = _2264;
    float _2298 = _2294;
    if (_2226)
    {
        float _2300 = fma(_2264, _2294, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2236 = _2300;
    }
    float _2302 = _2236;
    float _2304 = _2302;
    if (!_2226)
    {
        _2296 = _2214;
    }
    float _2306 = _2296;
    float _2308 = _2306;
    float _2310 = _2280;
    if (_2226)
    {
        float _2312 = _2280 + (-1.0);
        _2298 = _2312;
    }
    float _2314 = _2298;
    float _2316 = _2314;
    if (_2226)
    {
        float _2318 = _2246 * _2302;
        _2238 = _2318;
    }
    float _2320 = _2238;
    if (!_2226)
    {
        _2304 = _2286;
    }
    float _2322 = _2304;
    float _2324 = _2322;
    if (_2226)
    {
        float _2326 = _2314 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2248 = _2326;
    }
    float _2328 = _2248;
    if (_2226)
    {
        float _2330 = _2214 * _2320;
        _2308 = _2330;
    }
    float _2332 = _2308;
    if (!_2226)
    {
        _2316 = _2216;
    }
    float _2334 = _2316;
    float _2336 = _2334;
    if (_2226)
    {
        float _2338 = _2216 * _2320;
        _2336 = _2338;
    }
    float _2340 = _2336;
    if (_2226)
    {
        float _2342 = fma(_2286, _2280, _2328);
        _2324 = _2342;
    }
    float _2344 = _2324;
    if (_2226)
    {
        float _2346 = _2332 * _2332;
        _2290 = _2346;
    }
    float _2348 = _2290;
    if (!_2226)
    {
        _2310 = _2220;
    }
    float _2350 = _2310;
    float _2352 = _2350;
    if (_2226)
    {
        float _2354 = _2340 * _2340;
        _2352 = _2354;
    }
    float _2356 = _2352;
    float _2358 = fma(_2344, _2344, _2348);
    float _2360 = _2358 + _2356;
    float _2362 = _2182 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2364 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2366 = fma(_2210, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2364);
    float _2368 = precise::clamp(_2366, 0.0, 1.0);
    float _2370 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2372 = rsqrt(_2360);
    float _2374 = fma(_2184, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2362);
    float _2376 = _2182 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2378 = -_2368;
    float _2380 = _2378 + 1.0;
    float _2382 = fma(_2186, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2374);
    float _2384 = _2182 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2386 = fma(_2184, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2376);
    float _2388 = _2182 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2390 = _2382 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2392 = fma(_2184, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2384);
    float _2394 = fma(_2186, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2386);
    float _2396 = fma(_2184, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2388);
    float _2398 = _2390 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2400 = fma(_2186, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2392);
    float _2402 = _2394 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2404 = fma(_2186, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2396);
    float _2406 = abs(_2380);
    float _2408 = log2(_2406);
    float _2410 = _2372 * _2332;
    float _2412 = -_2398;
    float _2414 = fma(_2412, _2370, 1.0);
    float _2416 = _2400 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2418 = _2402 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2420 = _2372 * _2344;
    float _2422 = _2372 * _2340;
    float _2424 = fma(_2416, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2418);
    float _2426 = _2404 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2428 = _2410 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2430 = log2(_2414);
    float _2432 = fma(_2390, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2424);
    float _2434 = _2402 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2436 = -_2428;
    float _2438 = fma(_2420, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2436);
    float _2440 = _2420 + 1.0;
    float _2442 = fma(_2426, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2432);
    float _2444 = _2408 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2446 = -_2422;
    float _2448 = fma(_2446, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2438);
    float _2450 = _2402 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2452 = 1.0 / _2442;
    float _2454 = fma(_2416, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2434);
    float _2456 = fma(_2448, -0.5, 0.5);
    float _2458 = fma(_2416, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2450);
    float _2460 = fma(_2448, 0.5, 0.5);
    float _2462 = fma(_2390, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2454);
    float _2464 = fma(_2390, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2458);
    float _2466 = exp2(_2444);
    float _2468 = fma(_2460, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2470 = fma(_2426, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2462);
    float _2472 = fma(_2426, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2464);
    float _2474 = _2430 * 0.693147182464599609375;
    float _2476 = fma(_2460, _2468, -0.212114393711090087890625);
    float _2478 = sqrt(_2456);
    float _2480 = _2472 * _2452;
    float _2482 = _2470 * _2452;
    float _2484 = fma(_2460, _2476, 1.570728778839111328125);
    float _2486 = _2474 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2488 = fma(_2480, 0.5, 0.5);
    float _2490 = fma(_2482, -0.5, 0.5);
    float _2492 = -_2420;
    float _2494 = fma(_2466, _2440, _2492);
    float3 _6612 = float3(_2488, _2490, _2486);
    float _2496 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6612, float3(0.0), isnan(_6612)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6612, float3(0.0), isnan(_6612)), level(0.0)).x;
    float3 _6623 = float3(_2488, _2490, _2486);
    float4 _2499 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6623, float3(0.0), isnan(_6623)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6623, float3(0.0), isnan(_6623)), level(0.0)).xyzw;
    float _2501 = _2499.x;
    float _2503 = _2499.y;
    float _2505 = _2499.z;
    float _2507 = _2499.w;
    float _2509 = fma(_2494, 0.5, 0.5);
    float _2511 = _2478 * 0.636619746685028076171875;
    float _2513 = -_2484;
    float _2515 = fma(_2511, _2513, 1.0);
    float2 _6650 = float2(_2515, _2509);
    float3 _2519 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6650, float2(0.0), isnan(_6650)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6650, float2(0.0), isnan(_6650)), level(0.0)).xyz;
    float _2521 = _2519.x;
    float _2523 = _2519.y;
    float _2525 = _2519.z;
    float _2527 = _2112 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _2529 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2531 = isnan(0.5);
    bool _2533 = _2529 || _2531;
    bool _2535 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2537 = _2533 || _2535;
    float _2539 = fma(_2100, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2527);
    float _2541 = fma(_2116, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2539);
    float _2543 = _2112 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2545 = _2541 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2547 = fma(_2100, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2543);
    float _2549 = 1.0 / _2545;
    float _2551 = fma(_2116, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2547);
    float _2553 = _2490;
    float _2555 = _2511;
    float _2557 = _2402;
    if (!_2537)
    {
        _2124 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _2559 = _2124;
    float _2561 = _2551 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2563 = _2561 + _2545;
    if (!_2537)
    {
        _2553 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2565 = _2553;
    float _2567 = _2408 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2569 = _2402 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2571 = _2569;
    if (!_2537)
    {
        float _2573 = -_2565;
        float _2575 = _2573 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _2555 = _2575;
    }
    float _2577 = _2555;
    float _2579 = _2563 * _2549;
    float _2581 = _2579 * 0.5;
    float _2583 = exp2(_2567);
    float _2585 = _2549;
    float _2587 = _2577;
    if (!_2537)
    {
        float _2589 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2591 = fma(_2581, _2559, _2589);
        _2585 = _2591;
    }
    float _2593 = _2585;
    float _2595 = fma(_2416, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2569);
    if (_2537)
    {
        _2571 = 1.0;
    }
    float _2597 = _2571;
    float _2599 = _2597;
    if (!_2537)
    {
        float _2601 = 1.0 / _2577;
        _2587 = _2601;
    }
    float _2603 = _2587;
    float _2605 = fma(_2390, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2595);
    float _2607 = fma(_2426, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2605);
    float _2609 = _2593;
    if (!_2537)
    {
        float _2611 = 1.0 / _2593;
        _2609 = _2611;
    }
    float _2613 = _2609;
    float _2615 = -_2583;
    float _2617 = _2615 + 1.0;
    float _2619 = _2607 + _2442;
    float _2621 = _2617 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (!_2537)
    {
        float _2623 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2625 = -_2565;
        float _2627 = fma(_2613, _2623, _2625);
        _2557 = _2627;
    }
    float _2629 = _2557;
    if (!_2537)
    {
        float _2631 = _2629 * _2603;
        float _2633 = precise::clamp(_2631, 0.0, 1.0);
        _2599 = _2633;
    }
    float _2635 = _2599;
    float _2637 = _2619 * 0.5;
    out.gl_Position.x = _2472;
    out.gl_Position.y = _2470;
    out.gl_Position.z = _2607;
    out.gl_Position.w = _2442;
    float _2639 = _2635 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2641 = _2635 > 0.0;
    bool _2643 = isnan(_2635);
    bool _2645 = _2641 || _2643;
    bool _2647 = isnan(0.0);
    bool _2649 = _2645 || _2647;
    out.m_64.z = _2637;
    out.m_64.w = _2442;
    float _2651 = _2639 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_45.x = _2651;
    float _2653 = _2621 * _2496;
    float _2655 = -_2621;
    float _2657 = _2655 + 1.0;
    float _2659 = _2507 * _2653;
    float _2661 = _2525 * _2653;
    float _2663 = fma(_2521, _2659, _2501);
    float _2665 = fma(_2523, _2659, _2503);
    float _2667 = _2507 * _2657;
    float _2669 = fma(_2507, _2661, _2505);
    out.m_66.x = _2663;
    out.m_66.y = _2665;
    out.m_66.z = _2669;
    out.m_66.w = _2667;
    if (_2649)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _2671 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2671;
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
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _889 = false;
    bool _633 = false;
    bool _477 = false;
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
    if (!_89)
    {
        _91 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _93 = _91;
    float _95 = _93;
    if (!_89)
    {
        out.m_45.x = 0.0;
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
        float _2728 = as_type<float>(_101);
        out.gl_Position.z = _2728;
    }
    if (!_89)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _105 = in.m_47.w;
    bool _107 = _105 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _109 = isnan(_105);
    bool _111 = _107 || _109;
    bool _113 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _115 = _111 || _113;
    float _117 = -_105;
    float _119 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _121 = 0.0;
    if (_115)
    {
        float _123 = float(_85);
        _95 = _123;
    }
    float _125 = _95;
    bool _127 = _119 >= _125;
    bool _129 = !_115;
    bool _131 = _127 || _129;
    float _133 = _125;
    if (_131)
    {
        _133 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _135 = _133;
    if (_131)
    {
        out.m_45.x = 0.0;
    }
    if (_131)
    {
        float _137 = _135 * 5.0;
        _103 = as_type<int>(_137);
    }
    int _139 = _103;
    float _141 = as_type<float>(_139);
    if (_131)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2799 = as_type<float>(_139);
        out.gl_Position.z = _2799;
    }
    if (_131)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _143 = as_type<float>(int(gl_VertexIndex));
    float _145 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _147 = in.m_47.x;
    float _149 = in.m_47.y;
    float _151 = in.m_47.z;
    bool _153 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _155 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _157 = _153 || _155;
    bool _159 = isnan(1.0);
    bool _161 = _157 || _159;
    float _163 = 0.0;
    float _165 = _145;
    if (!_161)
    {
        float _167 = _145 * _145;
        float _169 = _167 * 0.5;
        _163 = _169;
    }
    float _171 = _163;
    float _173 = 0.0;
    float _175 = _171;
    if (!_161)
    {
        float _177 = _119 * _119;
        float _179 = _177 * 0.5;
        _173 = _179;
    }
    float _181 = _173;
    if (!_161)
    {
        float _183 = _171 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _175 = _183;
    }
    float _185 = _175;
    int _187 = as_type<int>(_143) & 1;
    bool _189 = _187 != 0;
    int _191 = as_type<int>(_143) & 2;
    bool _193 = _191 != 0;
    bool _195 = !_189;
    float _197 = _195 ? (-0.5) : 0.5;
    bool _199 = !_193;
    float _201 = _199 ? (-0.5) : 0.5;
    bool _203 = !_161;
    float _205 = _185;
    if (!_203)
    {
        float _207 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _209 = log2(_207);
        float _211 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _213 = _211 + 1.0;
        float _215 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _217 = _145 * _209;
        float _219 = 1.0 / _213;
        float _221 = _215 * 0.693147182464599609375;
        float _223 = exp2(_217);
        float _225 = 1.0 / _221;
        float _227 = _223 + (-1.0);
        float _229 = -_227;
        float _231 = fma(_229, _225, _145);
        float _233 = _231 * _219;
        float _235 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _141 = _223;
        _205 = _235;
        _121 = _225;
    }
    float _237 = _141;
    float _239 = _205;
    float _241 = _121;
    bool _243 = !_161;
    float _245 = _237;
    float _247 = _241;
    if (!_243)
    {
        float _249 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _251 = log2(_249);
        float _253 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _255 = _253 + 1.0;
        float _257 = 1.0 / _255;
        float _259 = _145 * _251;
        float _261 = exp2(_259);
        float _263 = -_261;
        float _265 = _263 + 1.0;
        float _267 = _265 * _257;
        _245 = _261;
        _247 = _255;
        _165 = _267;
    }
    float _269 = _245;
    float _271 = _247;
    float _273 = _165;
    float _275 = _271;
    float _277 = _269;
    if (!_161)
    {
        _275 = _119;
    }
    float _279 = _275;
    float _281 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _283 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _285 = _279;
    if (!_161)
    {
        float _287 = _181 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _277 = _287;
    }
    float _289 = _277;
    bool _291 = !_161;
    float _293 = _289;
    if (!_291)
    {
        float _295 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _297 = log2(_295);
        float _299 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _301 = _299 + 1.0;
        float _303 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _305 = _119 * _297;
        float _307 = 1.0 / _301;
        float _309 = _303 * 0.693147182464599609375;
        float _311 = exp2(_305);
        float _313 = 1.0 / _309;
        float _315 = _311 + (-1.0);
        float _317 = -_315;
        float _319 = fma(_317, _313, _119);
        float _321 = _319 * _307;
        float _323 = _321 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _293 = _323;
    }
    float _325 = _293;
    bool _327 = !_161;
    if (!_327)
    {
        float _329 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _331 = log2(_329);
        float _333 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _335 = _333 + 1.0;
        float _337 = 1.0 / _335;
        float _339 = _119 * _331;
        float _341 = exp2(_339);
        float _343 = -_341;
        float _345 = _343 + 1.0;
        float _347 = _345 * _337;
        _285 = _347;
    }
    float _349 = _285;
    float _351 = _325 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _353 = fma(_273, _149, _283);
    float _355 = _325 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _357 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _359 = fma(_349, _149, _351);
    float _361 = _325 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _363 = fma(_273, _147, _281);
    float _365 = fma(_349, _147, _355);
    float _367 = -_359;
    float _369 = _353 + _367;
    float _371 = fma(_273, _151, _357);
    float _373 = fma(_349, _151, _361);
    float _375 = -_365;
    float _377 = _363 + _375;
    float _379 = _369 * _369;
    float _381 = in.m_52.w;
    float _383 = -_373;
    float _385 = _371 + _383;
    float _387 = _369 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _389 = fma(_377, _377, _379);
    float _391 = _369 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _393 = _369 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _395 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[4].x, _387);
    float _397 = fma(_385, _385, _389);
    float _399 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[5].x, _391);
    float _401 = in.m_42.x;
    float _403 = in.m_42.y;
    float _405 = in.m_42.z;
    float _407 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[6].x, _393);
    float _409 = fma(_385, (*spvDescriptorSet0.vp_c10)._m0[4].z, _395);
    float _411 = sqrt(_397);
    float _413 = fma(_385, (*spvDescriptorSet0.vp_c10)._m0[5].z, _399);
    float _415 = fma(_385, (*spvDescriptorSet0.vp_c10)._m0[6].z, _407);
    bool _417 = _411 >= 9.9999999747524270787835121154785e-07;
    bool _419 = isnan(_411);
    bool _421 = _417 || _419;
    bool _423 = isnan(9.9999999747524270787835121154785e-07);
    bool _425 = _421 || _423;
    float _427 = fma(_363, _381, _401);
    float _429 = fma(_353, _381, _403);
    float _431 = fma(_371, _381, _405);
    float _433 = _413;
    float _435 = _409;
    float _437 = _415;
    if (!_425)
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
            _433 = _473;
            _435 = _471;
            _437 = _475;
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
                float _497 = _403 * _403;
                float _499 = fma(_401, _401, _497);
                float _501 = fma(_405, _405, _499);
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
                    _433 = _527;
                    _435 = _525;
                    _437 = _529;
                    _477 = true;
                }
                else
                {
                    float _531 = _403 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _533 = _403 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _535 = _403 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _537 = fma(_401, (*spvDescriptorSet0.vp_c10)._m0[5].x, _531);
                    float _539 = fma(_401, (*spvDescriptorSet0.vp_c10)._m0[4].x, _533);
                    float _541 = fma(_401, (*spvDescriptorSet0.vp_c10)._m0[6].x, _535);
                    float _543 = fma(_405, (*spvDescriptorSet0.vp_c10)._m0[5].z, _537);
                    float _545 = fma(_405, (*spvDescriptorSet0.vp_c10)._m0[4].z, _539);
                    float _547 = fma(_405, (*spvDescriptorSet0.vp_c10)._m0[6].z, _541);
                    float _549 = _543 * _543;
                    float _551 = fma(_545, _545, _549);
                    float _553 = fma(_547, _547, _551);
                    float _555 = rsqrt(_553);
                    float _557 = _555 * 9.9999999747524270787835121154785e-07;
                    float _559 = _545 * _557;
                    float _561 = _543 * _557;
                    float _563 = _547 * _557;
                    _433 = _561;
                    _435 = _559;
                    _437 = _563;
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
                _433 = _595;
                _435 = _593;
                _437 = _597;
            }
        }
    }
    _477 = false;
    float _599 = _433;
    float _601 = _435;
    float _603 = _437;
    bool _605 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _607 = !_605;
    float _609 = _599;
    float _611 = _601;
    float _613 = _603;
    float _631;
    if (!_607)
    {
        float _615 = in.m_54.x;
        float _617 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _619 = _615 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _621 = fma(_619, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _623 = _621 * _617;
        float _625 = floor(_623);
        float _627 = -_625;
        float _629 = _623 + _627;
        _631 = _629;
        _633 = true;
    }
    else
    {
        float _635 = float(_85);
        float _637 = 1.0 / _635;
        float _639 = _119 * _637;
        _631 = _639;
    }
    _633 = false;
    float _641 = _631;
    float _643 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _645 = _641 + _643;
    float _647 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _649 = _641 + _647;
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _653 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _651;
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _657 = _655 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _659 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _661 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _659;
    float _663 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _665 = _663 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _667 = 1.0 / _657;
    float _669 = in.m_52.x;
    float _671 = in.m_52.y;
    bool _673 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _675 = 1.0 / _653;
    bool _677 = _641 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _679 = isnan(_641);
    bool _681 = _677 || _679;
    bool _683 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _685 = _681 || _683;
    float _687 = float(_685);
    float _689 = 1.0 / _661;
    float _691 = _649 * _667;
    bool _693 = _641 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _695 = isnan(_641);
    bool _697 = _693 || _695;
    bool _699 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _701 = _697 || _699;
    float _703 = float(_701);
    float _705 = 1.0 / _665;
    float _707 = _645 * _675;
    float _709 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _711 = _641 + _709;
    float _713 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _715 = _641 + _713;
    float _717 = _711 * _689;
    float _719 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _721 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _719;
    float _723 = -_703;
    float _725 = _723 + 1.0;
    float _727 = fma(_721, _707, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _729 = _687 * _725;
    bool _731 = _641 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _733 = isnan(_641);
    bool _735 = _731 || _733;
    bool _737 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _739 = _735 || _737;
    float _741 = float(_739);
    float _743 = _715 * _705;
    float _745 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _747 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _745;
    bool _749 = _641 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _751 = isnan(_641);
    bool _753 = _749 || _751;
    bool _755 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _757 = _753 || _755;
    float _759 = float(_757);
    bool _761 = _641 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _763 = isnan(_641);
    bool _765 = _761 || _763;
    bool _767 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _769 = _765 || _767;
    float _771 = float(_769);
    float _773 = fma(_747, _707, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _775 = -_687;
    float _777 = _775 + 1.0;
    float _779 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _781 = _779 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _783 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _785 = _783 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _787 = _759 * _777;
    float _789 = -_759;
    float _791 = _789 + 1.0;
    float _793 = fma(_781, _691, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _795 = fma(_785, _691, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _797 = _741 * _791;
    float _799 = -_741;
    float _801 = _799 + 1.0;
    float _803 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _805 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _803;
    float _807 = _771 * _801;
    float _809 = -_771;
    float _811 = _809 + 1.0;
    float _813 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _815 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _813;
    float _817 = fma(_805, _717, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _819 = _727 * _807;
    float _821 = _773 * _807;
    float _823 = fma(_815, _717, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _825 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _827 = _825 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _829 = fma(_811, (*spvDescriptorSet0.vp_c9)._m0[143].x, _819);
    float _831 = fma(_811, (*spvDescriptorSet0.vp_c9)._m0[143].y, _821);
    float _833 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _835 = _833 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _837 = fma(_827, _743, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _839 = fma(_793, _797, _829);
    float _841 = fma(_795, _797, _831);
    float _843 = fma(_835, _743, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _845 = fma(_823, _787, _839);
    float _847 = fma(_817, _787, _841);
    float _849 = fma(_837, _729, _845);
    float _851 = fma(_843, _729, _847);
    float _853 = fma(_703, (*spvDescriptorSet0.vp_c9)._m0[147].x, _849);
    float _855 = fma(_703, (*spvDescriptorSet0.vp_c9)._m0[147].y, _851);
    float _857 = _853 * _669;
    float _859 = _855 * _671;
    bool _861 = !_673;
    float _885;
    float _887;
    if (!_861)
    {
        float _863 = in.m_54.x;
        float _865 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _867 = float(_85);
        float _869 = 1.0 / _867;
        float _871 = _863 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _873 = _119 * _869;
        float _875 = fma(_871, (*spvDescriptorSet0.vp_c9)._m0[11].y, _119);
        float _877 = _875 * _865;
        float _879 = floor(_877);
        float _881 = -_879;
        float _883 = _877 + _881;
        _885 = _873;
        _887 = _883;
        _889 = true;
    }
    else
    {
        float _891 = float(_85);
        float _893 = 1.0 / _891;
        float _895 = _119 * _893;
        _885 = _895;
        _887 = _895;
    }
    _889 = false;
    float _897 = _885;
    float _899 = _887;
    float _901 = in.m_54.x;
    float _903 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _905 = in.m_54.w;
    float _907 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _909 = _907 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _911 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _913 = _911 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _915 = 1.0 / _909;
    float _917 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _919 = _917 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _921 = in.m_54.z;
    int _923 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _925 = _923 != 0;
    int _927 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _929 = _927 != 0;
    float _931 = 1.0 / _913;
    float _933 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _935 = _933 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    int _937 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _939 = _937 != 0;
    float _941 = _903 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _943 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _945 = _943 != 0;
    float _947 = _429 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _949 = _901 > 0.5;
    float _951 = _901 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _953 = 1.0 / _919;
    float _955 = fma(_427, (*spvDescriptorSet0.vp_c10)._m0[4].x, _947);
    float _957 = -_197;
    int _959 = _949 ? as_type<int>(_957) : as_type<int>(_197);
    bool _961 = _905 > 0.5;
    float _963 = _429 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _965 = 1.0 / _935;
    float _967 = _429 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _969 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _971 = _969 != 0;
    float _973 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _975 = in.m_54.y;
    float _977 = fma(_427, (*spvDescriptorSet0.vp_c10)._m0[5].x, _963);
    float _979 = fma(_427, (*spvDescriptorSet0.vp_c10)._m0[6].x, _967);
    float _981 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _983 = _981 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _985 = -_973;
    float _987 = fma(_951, 2.0, _985);
    float _989 = 1.0 / _983;
    float _991 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[4].z, _955);
    float _993 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[5].z, _977);
    float _995 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[6].z, _979);
    float _997 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _999 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _997;
    float _1001 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1003 = _1001 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1005 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1007 = _1005 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1009 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _1011 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _1009;
    float _1013 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _1015 = _1013 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1017 = 1.0 / _1003;
    float _1019 = _1007 * _931;
    float _1021 = _1015 * _965;
    float _1023 = _993 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1025 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1027 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _1025;
    float _1029 = _1011 * _953;
    float _1031 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _1033 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1035 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1037 = _1035 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1039 = _991 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1041 = _1031 * _901;
    bool _1043 = !_925;
    float _1045 = _1043 ? _197 : as_type<float>(_959);
    float _1047 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1049 = _1023 + _1047;
    float _1051 = _1027 * _989;
    float _1053 = _989;
    float _1055 = _921;
    if (!_971)
    {
        _1053 = _975;
    }
    float _1057 = _1053;
    float _1059 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _1061 = _1059 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1063 = fma(_901, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1033);
    float _1065 = _1057;
    if (_971)
    {
        _1065 = _901;
    }
    float _1067 = _1065;
    float _1069 = _995 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1071 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1073 = _1039 + _1071;
    float _1075 = _1049 * _1049;
    float _1077 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1079 = _1077 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _1081 = 1.0 / _1037;
    float _1083 = _1061 * _1017;
    float _1085 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1087 = _1085 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1089 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1091 = _1069 + _1089;
    float _1093 = fma(_1073, _1073, _1075);
    float _1095 = _999 * _915;
    float _1097 = _599 * _599;
    float _1099 = 1.0 / _1079;
    float _1101 = fma(_1091, _1091, _1093);
    float _1103 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1105 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _1103;
    float _1107 = fma(_601, _601, _1097);
    float _1109 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _1111 = _1109 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1113 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1115 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _1113;
    float _1117 = 1.0 / _1087;
    float _1119 = _1105 * _1081;
    float _1121 = fma(_603, _603, _1107);
    bool _1123 = _975 > 0.5;
    float _1125 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1127 = _897 + _1125;
    float _1129 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1131 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1133 = rsqrt(_1101);
    float _1135 = _1115 * _1099;
    float _1137 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1139 = _899 + _1137;
    float _1141 = -_201;
    int _1143 = _1123 ? as_type<int>(_1141) : as_type<int>(_201);
    float _1145 = _975 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1147 = _921 > 0.5;
    float _1149 = fma(_1095, _1139, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1151 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1153 = _897 + _1151;
    float _1155 = rsqrt(_1121);
    float _1157 = _1111 * _1117;
    float _1159 = _1117;
    float _1161 = _1121;
    float _1163 = _1069;
    if (!_971)
    {
        _1159 = _921;
    }
    float _1165 = _1159;
    float _1167 = fma(_975, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1131);
    float _1169 = _1165;
    if (_971)
    {
        _1169 = _975;
    }
    float _1171 = _1169;
    float _1173 = fma(_1029, _1127, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    if (_971)
    {
        _1055 = _975;
    }
    float _1175 = _1055;
    float _1177 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1179 = _899 + _1177;
    float _1181 = _1049 * _1133;
    float _1183 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1185 = _897 + _1183;
    float _1187 = fma(_1145, -2.0, _1129);
    float _1189 = fma(_1021, _1153, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    float _1191 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1193 = _897 + _1191;
    float _1195 = _1073 * _1133;
    float _1197 = -_1181;
    float _1199 = fma(_1197, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1049);
    float _1201 = fma(_1019, _1179, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1203 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1205 = _897 + _1203;
    float _1207 = fma(_1119, _1185, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _1209 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1211 = _897 + _1209;
    bool _1213 = _897 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1215 = isnan(_897);
    bool _1217 = _1213 || _1215;
    bool _1219 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1221 = _1217 || _1219;
    float _1223 = float(_1221);
    float _1225 = fma(_1083, _1193, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _1227 = -_1195;
    float _1229 = fma(_1227, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1073);
    float _1231 = _1199 * _1199;
    float _1233 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1235 = _897 + _1233;
    float _1237 = fma(_1157, _1205, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    float _1239 = fma(_1051, _1211, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    bool _1241 = _897 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1243 = isnan(_897);
    bool _1245 = _1241 || _1243;
    bool _1247 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _1249 = _1245 || _1247;
    float _1251 = float(_1249);
    float _1253 = _1155 * _603;
    float _1255 = -_1223;
    float _1257 = _1255 + 1.0;
    float _1259 = fma(_1229, _1229, _1231);
    float _1261 = fma(_1135, _1235, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    bool _1263 = _897 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1265 = isnan(_897);
    bool _1267 = _1263 || _1265;
    bool _1269 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1271 = _1267 || _1269;
    float _1273 = float(_1271);
    float _1275 = _1155 * _601;
    float _1277 = _1155 * _599;
    float _1279 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1281 = _1253 * _1279;
    float _1283 = _1251 * _1257;
    float _1285 = -_1251;
    float _1287 = _1285 + 1.0;
    bool _1289 = _897 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1291 = isnan(_897);
    bool _1293 = _1289 || _1291;
    bool _1295 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1297 = _1293 || _1295;
    float _1299 = float(_1297);
    float _1301 = -_1273;
    float _1303 = _1301 + 1.0;
    float _1305 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1307 = _1277 * _1305;
    float _1309 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1311 = -_1281;
    float _1313 = fma(_1275, _1309, _1311);
    float _1315 = _1273 * _1287;
    float _1317 = _1299 * _1303;
    float _1319 = -_1299;
    float _1321 = _1319 + 1.0;
    bool _1323 = _897 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1325 = isnan(_897);
    bool _1327 = _1323 || _1325;
    bool _1329 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _1331 = _1327 || _1329;
    float _1333 = float(_1331);
    float _1335 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1337 = -_1307;
    float _1339 = fma(_1253, _1335, _1337);
    float _1341 = _1313 * _1313;
    float _1343 = _1091 * _1133;
    bool _1345 = _897 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _1347 = isnan(_897);
    bool _1349 = _1345 || _1347;
    bool _1351 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _1353 = _1349 || _1351;
    float _1355 = float(_1353);
    float _1357 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1359 = _1275 * _1357;
    float _1361 = fma(_1339, _1339, _1341);
    float _1363 = -_1343;
    float _1365 = fma(_1363, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1091);
    float _1367 = _1333 * _1321;
    float _1369 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1371 = -_1359;
    float _1373 = fma(_1277, _1369, _1371);
    bool _1375 = _897 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _1377 = isnan(_897);
    bool _1379 = _1375 || _1377;
    bool _1381 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _1383 = _1379 || _1381;
    float _1385 = float(_1383);
    float _1387 = -_1355;
    float _1389 = _1387 + 1.0;
    float _1391 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1393 = -_1333;
    float _1395 = _1393 + 1.0;
    float _1397 = fma(_1365, _1365, _1259);
    float _1399 = fma(_1373, _1373, _1361);
    float _1401 = _1385 * _1389;
    float _1403 = _1355 * _1395;
    bool _1405 = _897 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _1407 = isnan(_897);
    bool _1409 = _1405 || _1407;
    bool _1411 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _1413 = _1409 || _1411;
    float _1415 = float(_1413);
    float _1417 = -_1385;
    float _1419 = _1417 + 1.0;
    float _1421 = sqrt(_1397);
    float _1423 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1187);
    bool _1425 = !_929;
    float _1427 = _1425 ? _201 : as_type<float>(_1143);
    float _1429 = _1045 + 0.5;
    float _1431 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1433 = rsqrt(_1399);
    float _1435 = _1391 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1437 = _1415 * _1419;
    float _1439 = _1427 + (-0.5);
    float _1441 = _1133 * _1421;
    float _1443 = -_119;
    float _1445 = fma(_1443, (*spvDescriptorSet0.vp_c9)._m0[76].x, _987);
    float _1447 = _859 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1449 = fma(_1175, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1431);
    float _1451 = -_201;
    int _1453 = _961 ? as_type<int>(_1451) : as_type<int>(_201);
    float _1455 = fma(_941, _1429, _1445);
    float _1457 = _1173 * _1437;
    float _1459 = -_1435;
    float _1461 = -_1423;
    float _1463 = fma(_1459, _1439, _1461);
    float _1465 = _1373 * _1433;
    float _1467 = -_197;
    int _1469 = _1147 ? as_type<int>(_1467) : as_type<int>(_197);
    float _1471 = _1339 * _1433;
    float _1473 = _1313 * _1433;
    float _1475 = _857 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1477 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _201);
    float _1479 = _1447 * _1441;
    bool _1481 = !_939;
    float _1483 = _1481 ? _197 : as_type<float>(_1469);
    float _1485 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _197);
    bool _1487 = _899 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1489 = isnan(_899);
    bool _1491 = _1487 || _1489;
    bool _1493 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1495 = _1491 || _1493;
    float _1497 = float(_1495);
    float _1499 = trunc(_1041);
    int _1501 = int(_1499);
    float _1503 = _1277 * _1465;
    float _1505 = _1475 * _1441;
    float _1507 = _1479 * _1477;
    bool _1509 = !_945;
    float _1511 = _1509 ? _201 : as_type<float>(_1453);
    float _1513 = -_1503;
    float _1515 = fma(_1253, _1473, _1513);
    bool _1517 = _899 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1519 = isnan(_899);
    bool _1521 = _1517 || _1519;
    bool _1523 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1525 = _1521 || _1523;
    float _1527 = float(_1525);
    float _1529 = -_1497;
    float _1531 = _1529 + 1.0;
    bool _1533 = _899 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1535 = isnan(_899);
    bool _1537 = _1533 || _1535;
    bool _1539 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1541 = _1537 || _1539;
    float _1543 = float(_1541);
    float _1545 = _1505 * _1485;
    float _1547 = _1275 * _1473;
    float _1549 = _1507 * _1253;
    float _1551 = -_1415;
    float _1553 = _1551 + 1.0;
    float _1555 = _1527 * _1531;
    float _1557 = _1507 * _1275;
    float _1559 = -_1547;
    float _1561 = fma(_1277, _1471, _1559);
    float _1563 = _1441 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1565 = _1563 * 0.5;
    float _1567 = fma(_1545, _1465, _1549);
    float _1569 = -_1527;
    float _1571 = _1569 + 1.0;
    float _1573 = fma(_1545, _1471, _1557);
    float _1575 = fma(_1553, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1457);
    float _1577 = fma(_1565, _1561, _1567);
    float _1579 = _1543 * _1571;
    int _1581 = _1501 << 4;
    int _1583 = _1581 + 1968;
    float _1585 = fma(_1565, _1515, _1573);
    float _1587 = _1069 + _1577;
    float _1589 = _1149 * _1579;
    int _1591 = _1583 + 8;
    uint _1594 = uint(int(uint(_1591) >> uint(2)));
    uint _1596 = uint(int(uint(int(_1594)) >> uint(2)));
    int _1598 = int(_1594) & 3;
    float _1600 = (*spvDescriptorSet0.vp_c9)._m0[int(_1596)][_1598];
    float _1602 = _1039 + _1585;
    float _1604 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1606 = _1587 + _1604;
    float _1608 = fma(_1189, _1401, _1575);
    float _1610 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1612 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1614 = _1602 + _1612;
    float _1616 = _1606 * _1606;
    float _1618 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    uint _1620 = uint(int(uint(_1583) >> uint(2)));
    uint _1622 = uint(int(uint(int(_1620)) >> uint(2)));
    int _1624 = int(_1620) & 3;
    float _1626 = (*spvDescriptorSet0.vp_c9)._m0[int(_1622)][_1624];
    int _1628 = int(_1620) + 1;
    uint _1630 = uint(int(uint(_1628) >> uint(2)));
    int _1632 = _1628 & 3;
    float _1634 = (*spvDescriptorSet0.vp_c9)._m0[int(_1630)][_1632];
    float _1636 = _1253 * _1471;
    float _1638 = fma(_1614, _1614, _1616);
    float _1640 = _1507 * _1277;
    float _1642 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1644 = fma(_1207, _1403, _1608);
    float _1646 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1648 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1650 = fma(_1067, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1618);
    float _1652 = -_1636;
    float _1654 = fma(_1275, _1465, _1652);
    float _1656 = fma(_1545, _1473, _1640);
    float _1658 = _1067 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1660 = sqrt(_1638);
    float _1662 = _1171 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1664 = -_1543;
    float _1666 = _1664 + 1.0;
    float _1668 = fma(_1237, _1367, _1644);
    float _1670 = fma(_1565, _1654, _1656);
    float _1672 = -_1646;
    float _1674 = fma(_1658, 2.0, _1672);
    float _1676 = fma(_1662, -2.0, _1648);
    float _1678 = fma(_1666, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1589);
    float _1680 = fma(_1239, _1317, _1668);
    float _1682 = _1023 + _1670;
    float _1684 = _1610 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1686 = fma(_1201, _1555, _1678);
    float _1688 = _1642 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1690 = _1483 + 0.5;
    float _1692 = -_119;
    float _1694 = fma(_1692, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1674);
    float _1696 = _1511 + (-0.5);
    bool _1698 = _1660 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1700 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1676);
    float _1702 = fma(_1225, _1315, _1680);
    float _1704 = fma(_1684, _1690, _1694);
    float _1706 = fma(_1497, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1686);
    float _1708 = -_1688;
    float _1710 = -_1700;
    float _1712 = fma(_1708, _1696, _1710);
    float _1714 = fma(_1261, _1283, _1702);
    float _1716 = _1237;
    float _1718 = _1602;
    float _1720 = _1587;
    if (!_1698)
    {
        _1716 = _1682;
    }
    float _1722 = _1716;
    bool _1724 = !_1698;
    float _1726 = _1722;
    if (!_1724)
    {
        float _1728 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1730 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1732 = _1660 + _1730;
        float _1734 = _1682 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1736 = rsqrt(_1638);
        float _1738 = _1732 * _1728;
        float _1740 = _1738 * 0.15915493667125701904296875;
        float _1742 = _1740 * 6.283185482025146484375;
        float _1744 = cos(_1742);
        float _1746 = _1740 * 6.283185482025146484375;
        float _1748 = sin(_1746);
        float _1750 = _1744 + (-1.0);
        float _1752 = _1750 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1754 = fma(_1748, _1734, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1756 = fma(_1682, _1744, _1752);
        float _1758 = _1736 * _1754;
        float _1760 = fma(_1614, _1758, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1762 = fma(_1606, _1758, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1726 = _1756;
        _1718 = _1760;
        _1720 = _1762;
    }
    float _1764 = _1726;
    float _1766 = _1718;
    float _1768 = _1720;
    float _1770 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1063);
    float _1772 = -_1023;
    float _1774 = _1772 + _1764;
    float _1776 = _1626 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1778 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1167);
    float _1780 = -_1770;
    float _1782 = _1780 + 1.0;
    float _1784 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1650);
    float _1786 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1449);
    float _1788 = -_1039;
    float _1790 = _1788 + _1766;
    float _1792 = _1774 * _1774;
    float _1794 = _1634 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1796 = -_1778;
    float _1798 = _1796 + 1.0;
    float _1800 = -_1782;
    float _1802 = fma(_1045, _1800, _1455);
    float _1804 = -_1784;
    float _1806 = _1804 + 1.0;
    float _1808 = -_1786;
    float _1810 = _1808 + 1.0;
    float _1812 = -_1069;
    float _1814 = _1812 + _1768;
    float _1816 = fma(_1790, _1790, _1792);
    float _1818 = fma(_1427, _1798, _1463);
    float _1820 = -_1806;
    float _1822 = fma(_1483, _1820, _1704);
    float _1824 = fma(_1511, _1810, _1712);
    float _1826 = fma(_1814, _1814, _1816);
    float _1828 = _1600 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1830 = sqrt(_1826);
    float _1832 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1834 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1836 = _1776 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1838 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1840 = _1832 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1842 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1844 = _1834 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1846 = _1794 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1848 = _1828 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1850 = _1838 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1852 = _1706 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1854 = fma(_1223, (*spvDescriptorSet0.vp_c9)._m0[158].x, _1714);
    out.m_56.x = _1802;
    out.m_56.y = _1818;
    out.m_56.z = _1822;
    out.m_56.w = _1824;
    bool _1856 = _1830 > 0.0;
    out.m_58.x = _1836;
    out.m_58.y = _1846;
    out.m_58.z = _1848;
    out.m_58.w = _1842;
    out.m_60.x = _1840;
    out.m_60.y = _1844;
    out.m_60.z = _1850;
    out.m_60.w = _1852;
    out.m_62.x = _1854;
    bool _1858 = !_1856;
    float _1860 = _1824;
    float _1862 = _1818;
    float _1864 = _1764;
    float _1866 = _1766;
    float _1868 = _1768;
    float _1870 = _1848;
    float _1872 = _1842;
    if (!_1858)
    {
        bool _1874 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _1876 = _1802;
        if (_1874)
        {
            float _1878 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _1876 = _1878;
        }
        float _1880 = _1876;
        float _1882 = _1880;
        if (_1874)
        {
            float _1884 = _1880 * _601;
            _1860 = _1884;
        }
        float _1886 = _1860;
        float _1888 = _1886;
        if (_1874)
        {
            float _1890 = _1880 * _599;
            _1862 = _1890;
        }
        float _1892 = _1862;
        float _1894 = _1892;
        if (_1874)
        {
            float _1896 = _1880 * _603;
            _1882 = _1896;
        }
        float _1898 = _1882;
        float _1900 = _1898;
        float _1902 = _1898;
        if (!_1874)
        {
            float _1904 = _119 + 1.0;
            float _1906 = _1904;
            if (!_161)
            {
                float _1908 = _1904 * _1904;
                float _1910 = _1908 * 0.5;
                _1900 = _1910;
            }
            float _1912 = _1900;
            float _1914 = _1912;
            if (!_161)
            {
                float _1916 = _1912 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1914 = _1916;
            }
            float _1918 = _1914;
            bool _1920 = !_161;
            float _1922 = _1918;
            if (!_1920)
            {
                float _1924 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1926 = log2(_1924);
                float _1928 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1930 = _1928 + 1.0;
                float _1932 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1934 = _1926 * _1904;
                float _1936 = 1.0 / _1930;
                float _1938 = _1932 * 0.693147182464599609375;
                float _1940 = exp2(_1934);
                float _1942 = 1.0 / _1938;
                float _1944 = _1940 + (-1.0);
                float _1946 = -_1944;
                float _1948 = fma(_1946, _1942, _1904);
                float _1950 = _1948 * _1936;
                float _1952 = _1950 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1922 = _1952;
            }
            float _1954 = _1922;
            float _1956 = _1954 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _1958 = _1954 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _1960 = !_161;
            if (!_1960)
            {
                float _1962 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1964 = log2(_1962);
                float _1966 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1968 = _1966 + 1.0;
                float _1970 = 1.0 / _1968;
                float _1972 = _1964 * _1904;
                float _1974 = exp2(_1972);
                float _1976 = -_1974;
                float _1978 = _1976 + 1.0;
                float _1980 = _1978 * _1970;
                _1906 = _1980;
            }
            float _1982 = _1906;
            float _1984 = fma(_1982, _149, _1958);
            float _1986 = _1954 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _1988 = fma(_1982, _147, _1956);
            float _1990 = -_359;
            float _1992 = _1990 + _1984;
            float _1994 = fma(_1982, _151, _1986);
            float _1996 = -_365;
            float _1998 = _1996 + _1988;
            float _2000 = _1992 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _2002 = _1992 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _2004 = -_373;
            float _2006 = _2004 + _1994;
            float _2008 = _1992 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _2010 = fma(_1998, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2000);
            float _2012 = fma(_1998, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2002);
            float _2014 = fma(_1998, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2008);
            float _2016 = fma(_2006, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2010);
            float _2018 = fma(_2006, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2012);
            float _2020 = fma(_2006, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2014);
            float _2022 = _2016 * _2016;
            float _2024 = fma(_2018, _2018, _2022);
            float _2026 = fma(_2020, _2020, _2024);
            _1161 = _2026;
            _609 = _2016;
            _611 = _2018;
            _613 = _2020;
            _1888 = _2018;
            _1894 = _2016;
            _1902 = _2020;
        }
        float _2028 = _1161;
        float _2030 = _609;
        float _2032 = _611;
        float _2034 = _613;
        float _2036 = _1888;
        float _2038 = _1894;
        float _2040 = _1902;
        float _2042 = sqrt(_2028);
        float _2044 = rsqrt(_1826);
        bool _2046 = _2042 > 0.0;
        float _2048 = _1790 * _2044;
        float _2050 = _1774 * _2044;
        float _2052 = _1814 * _2044;
        bool _2054 = !_2046;
        if (!_2054)
        {
            float _2056 = rsqrt(_2028);
            float _2058 = _2056 * _2030;
            float _2060 = _2056 * _2032;
            float _2062 = _2056 * _2034;
            float _2064 = _2050 * _2058;
            float _2066 = fma(_2048, _2060, _2064);
            float _2068 = fma(_2052, _2062, _2066);
            float _2070 = _2068 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2072 = fma(_2036, _2070, _1766);
            float _2074 = fma(_2038, _2070, _1764);
            float _2076 = fma(_2040, _2070, _1768);
            _1864 = _2074;
            _1866 = _2072;
            _1868 = _2076;
        }
    }
    float _2078 = _1864;
    float _2080 = _1866;
    float _2082 = _1868;
    bool _2084 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2086 = isnan(0.5);
    bool _2088 = _2084 || _2086;
    bool _2090 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2092 = _2088 || _2090;
    float _2094 = -_1181;
    float _2096 = fma(_2094, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2078);
    float _2098 = -_1195;
    float _2100 = fma(_2098, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1039);
    float _2102 = -_1195;
    float _2104 = fma(_2102, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2080);
    float _2106 = -_1343;
    float _2108 = fma(_2106, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2082);
    float _2110 = -_1181;
    float _2112 = fma(_2110, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1023);
    float _2114 = -_1343;
    float _2116 = fma(_2114, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1069);
    float _2118 = _2096;
    float _2120 = _2104;
    float _2122 = _2108;
    float _2124 = _2116;
    if (!_2092)
    {
        float _2126 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2128 = _2112 + _2126;
        float _2130 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2132 = _2100 + _2130;
        float _2134 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2136 = -_1069;
        float _2138 = _2136 + _2082;
        float _2140 = _2128 * _2128;
        float _2142 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2144 = _2116 + _2142;
        float _2146 = -_1039;
        float _2148 = _2146 + _2080;
        float _2150 = -_1023;
        float _2152 = _2150 + _2078;
        float _2154 = fma(_2132, _2132, _2140);
        float _2156 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2158 = fma(_2144, _2144, _2154);
        float _2160 = sqrt(_2158);
        float _2162 = 1.0 / _1441;
        float _2164 = _2156 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2166 = precise::min(_2160, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2168 = _2166 * _2134;
        float _2170 = _2168 * _2162;
        float _2172 = _2164 * _2170;
        float _2174 = _2138 * _2170;
        float _2176 = fma(_2148, _2172, _2100);
        float _2178 = fma(_2152, _2172, _2112);
        float _2180 = fma(_2164, _2174, _2116);
        _2118 = _2178;
        _2120 = _2176;
        _2122 = _2180;
        _1163 = _2174;
    }
    float _2182 = _2118;
    float _2184 = _2120;
    float _2186 = _2122;
    float _2188 = _1163;
    float _2190 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2192 = _2182 + _2190;
    float _2194 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2196 = _2184 + _2194;
    float _2198 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2200 = _2186 + _2198;
    float _2202 = _2192 * _2192;
    float _2204 = fma(_2196, _2196, _2202);
    float _2206 = fma(_2200, _2200, _2204);
    float _2208 = rsqrt(_2206);
    float _2210 = sqrt(_2206);
    float _2212 = _2208 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2214 = _2196 * _2212;
    float _2216 = _2200 * _2212;
    float _2218 = _2214 * _2214;
    float _2220 = _2216 * _2216;
    float _2222 = _2218 + _2220;
    float _2224 = sqrt(_2222);
    bool _2226 = _2224 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2228 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2230 = _2224 + _2228;
    float _2232 = _2200;
    float _2234 = _2230;
    float _2236 = _2192;
    float _2238 = _2188;
    if (_2226)
    {
        float _2240 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2232 = _2240;
    }
    float _2242 = _2232;
    if (_2226)
    {
        float _2244 = rsqrt(_2222);
        _1870 = _2244;
    }
    float _2246 = _1870;
    float _2248 = _2246;
    if (_2226)
    {
        float _2250 = _2230 * _2242;
        _2234 = _2250;
    }
    float _2252 = _2234;
    if (_2226)
    {
        float _2254 = _2252 * 0.15915493667125701904296875;
        _1872 = _2254;
    }
    float _2256 = _1872;
    float _2258 = _2202;
    if (_2226)
    {
        float _2260 = _2256 * 6.283185482025146484375;
        float _2262 = sin(_2260);
        _2258 = _2262;
    }
    float _2264 = _2258;
    float _2266 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2268 = precise::max(0.0, _2266);
    float _2270 = _2208;
    float _2272 = _2268;
    float _2274 = _2266;
    if (_2226)
    {
        float _2276 = _2256 * 6.283185482025146484375;
        float _2278 = cos(_2276);
        _2270 = _2278;
    }
    float _2280 = _2270;
    float _2282 = -_2212;
    float _2284 = -_2268;
    float _2286 = fma(_2192, _2282, _2284);
    if (!_2226)
    {
        _2272 = _2218;
    }
    float _2288 = _2272;
    float _2290 = _2288;
    if (_2226)
    {
        float _2292 = _2286 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2274 = _2292;
    }
    float _2294 = _2274;
    float _2296 = _2264;
    float _2298 = _2294;
    if (_2226)
    {
        float _2300 = fma(_2264, _2294, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2236 = _2300;
    }
    float _2302 = _2236;
    float _2304 = _2302;
    if (!_2226)
    {
        _2296 = _2214;
    }
    float _2306 = _2296;
    float _2308 = _2306;
    float _2310 = _2280;
    if (_2226)
    {
        float _2312 = _2280 + (-1.0);
        _2298 = _2312;
    }
    float _2314 = _2298;
    float _2316 = _2314;
    if (_2226)
    {
        float _2318 = _2246 * _2302;
        _2238 = _2318;
    }
    float _2320 = _2238;
    if (!_2226)
    {
        _2304 = _2286;
    }
    float _2322 = _2304;
    float _2324 = _2322;
    if (_2226)
    {
        float _2326 = _2314 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2248 = _2326;
    }
    float _2328 = _2248;
    if (_2226)
    {
        float _2330 = _2214 * _2320;
        _2308 = _2330;
    }
    float _2332 = _2308;
    if (!_2226)
    {
        _2316 = _2216;
    }
    float _2334 = _2316;
    float _2336 = _2334;
    if (_2226)
    {
        float _2338 = _2216 * _2320;
        _2336 = _2338;
    }
    float _2340 = _2336;
    if (_2226)
    {
        float _2342 = fma(_2286, _2280, _2328);
        _2324 = _2342;
    }
    float _2344 = _2324;
    if (_2226)
    {
        float _2346 = _2332 * _2332;
        _2290 = _2346;
    }
    float _2348 = _2290;
    if (!_2226)
    {
        _2310 = _2220;
    }
    float _2350 = _2310;
    float _2352 = _2350;
    if (_2226)
    {
        float _2354 = _2340 * _2340;
        _2352 = _2354;
    }
    float _2356 = _2352;
    float _2358 = fma(_2344, _2344, _2348);
    float _2360 = _2358 + _2356;
    float _2362 = _2182 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2364 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2366 = fma(_2210, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2364);
    float _2368 = precise::clamp(_2366, 0.0, 1.0);
    float _2370 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2372 = rsqrt(_2360);
    float _2374 = fma(_2184, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2362);
    float _2376 = _2182 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2378 = -_2368;
    float _2380 = _2378 + 1.0;
    float _2382 = fma(_2186, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2374);
    float _2384 = _2182 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2386 = fma(_2184, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2376);
    float _2388 = _2182 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2390 = _2382 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2392 = fma(_2184, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2384);
    float _2394 = fma(_2186, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2386);
    float _2396 = fma(_2184, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2388);
    float _2398 = _2390 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2400 = fma(_2186, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2392);
    float _2402 = _2394 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2404 = fma(_2186, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2396);
    float _2406 = abs(_2380);
    float _2408 = log2(_2406);
    float _2410 = _2372 * _2332;
    float _2412 = -_2398;
    float _2414 = fma(_2412, _2370, 1.0);
    float _2416 = _2400 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2418 = _2402 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2420 = _2372 * _2344;
    float _2422 = _2372 * _2340;
    float _2424 = fma(_2416, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2418);
    float _2426 = _2404 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2428 = _2410 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2430 = log2(_2414);
    float _2432 = fma(_2390, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2424);
    float _2434 = _2402 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2436 = -_2428;
    float _2438 = fma(_2420, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2436);
    float _2440 = _2420 + 1.0;
    float _2442 = fma(_2426, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2432);
    float _2444 = _2408 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2446 = -_2422;
    float _2448 = fma(_2446, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2438);
    float _2450 = _2402 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2452 = 1.0 / _2442;
    float _2454 = fma(_2416, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2434);
    float _2456 = fma(_2448, -0.5, 0.5);
    float _2458 = fma(_2416, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2450);
    float _2460 = fma(_2448, 0.5, 0.5);
    float _2462 = fma(_2390, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2454);
    float _2464 = fma(_2390, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2458);
    float _2466 = exp2(_2444);
    float _2468 = fma(_2460, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2470 = fma(_2426, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2462);
    float _2472 = fma(_2426, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2464);
    float _2474 = _2430 * 0.693147182464599609375;
    float _2476 = fma(_2460, _2468, -0.212114393711090087890625);
    float _2478 = sqrt(_2456);
    float _2480 = _2472 * _2452;
    float _2482 = _2470 * _2452;
    float _2484 = fma(_2460, _2476, 1.570728778839111328125);
    float _2486 = _2474 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2488 = fma(_2480, 0.5, 0.5);
    float _2490 = fma(_2482, -0.5, 0.5);
    float _2492 = -_2420;
    float _2494 = fma(_2466, _2440, _2492);
    float3 _6612 = float3(_2488, _2490, _2486);
    float _2496 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6612, float3(0.0), isnan(_6612)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6612, float3(0.0), isnan(_6612)), level(0.0)).x;
    float3 _6623 = float3(_2488, _2490, _2486);
    float4 _2499 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6623, float3(0.0), isnan(_6623)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6623, float3(0.0), isnan(_6623)), level(0.0)).xyzw;
    float _2501 = _2499.x;
    float _2503 = _2499.y;
    float _2505 = _2499.z;
    float _2507 = _2499.w;
    float _2509 = fma(_2494, 0.5, 0.5);
    float _2511 = _2478 * 0.636619746685028076171875;
    float _2513 = -_2484;
    float _2515 = fma(_2511, _2513, 1.0);
    float2 _6650 = float2(_2515, _2509);
    float3 _2519 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6650, float2(0.0), isnan(_6650)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6650, float2(0.0), isnan(_6650)), level(0.0)).xyz;
    float _2521 = _2519.x;
    float _2523 = _2519.y;
    float _2525 = _2519.z;
    float _2527 = _2112 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _2529 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2531 = isnan(0.5);
    bool _2533 = _2529 || _2531;
    bool _2535 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2537 = _2533 || _2535;
    float _2539 = fma(_2100, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2527);
    float _2541 = fma(_2116, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2539);
    float _2543 = _2112 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2545 = _2541 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2547 = fma(_2100, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2543);
    float _2549 = 1.0 / _2545;
    float _2551 = fma(_2116, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2547);
    float _2553 = _2490;
    float _2555 = _2511;
    float _2557 = _2402;
    if (!_2537)
    {
        _2124 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _2559 = _2124;
    float _2561 = _2551 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2563 = _2561 + _2545;
    if (!_2537)
    {
        _2553 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2565 = _2553;
    float _2567 = _2408 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2569 = _2402 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2571 = _2569;
    if (!_2537)
    {
        float _2573 = -_2565;
        float _2575 = _2573 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _2555 = _2575;
    }
    float _2577 = _2555;
    float _2579 = _2563 * _2549;
    float _2581 = _2579 * 0.5;
    float _2583 = exp2(_2567);
    float _2585 = _2549;
    float _2587 = _2577;
    if (!_2537)
    {
        float _2589 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2591 = fma(_2581, _2559, _2589);
        _2585 = _2591;
    }
    float _2593 = _2585;
    float _2595 = fma(_2416, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2569);
    if (_2537)
    {
        _2571 = 1.0;
    }
    float _2597 = _2571;
    float _2599 = _2597;
    if (!_2537)
    {
        float _2601 = 1.0 / _2577;
        _2587 = _2601;
    }
    float _2603 = _2587;
    float _2605 = fma(_2390, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2595);
    float _2607 = fma(_2426, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2605);
    float _2609 = _2593;
    if (!_2537)
    {
        float _2611 = 1.0 / _2593;
        _2609 = _2611;
    }
    float _2613 = _2609;
    float _2615 = -_2583;
    float _2617 = _2615 + 1.0;
    float _2619 = _2607 + _2442;
    float _2621 = _2617 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (!_2537)
    {
        float _2623 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2625 = -_2565;
        float _2627 = fma(_2613, _2623, _2625);
        _2557 = _2627;
    }
    float _2629 = _2557;
    if (!_2537)
    {
        float _2631 = _2629 * _2603;
        float _2633 = precise::clamp(_2631, 0.0, 1.0);
        _2599 = _2633;
    }
    float _2635 = _2599;
    float _2637 = _2619 * 0.5;
    out.gl_Position.x = _2472;
    out.gl_Position.y = _2470;
    out.gl_Position.z = _2607;
    out.gl_Position.w = _2442;
    float _2639 = _2635 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2641 = _2635 > 0.0;
    bool _2643 = isnan(_2635);
    bool _2645 = _2641 || _2643;
    bool _2647 = isnan(0.0);
    bool _2649 = _2645 || _2647;
    out.m_64.z = _2637;
    out.m_64.w = _2442;
    float _2651 = _2639 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_45.x = _2651;
    float _2653 = _2621 * _2496;
    float _2655 = -_2621;
    float _2657 = _2655 + 1.0;
    float _2659 = _2507 * _2653;
    float _2661 = _2525 * _2653;
    float _2663 = fma(_2521, _2659, _2501);
    float _2665 = fma(_2523, _2659, _2503);
    float _2667 = _2507 * _2657;
    float _2669 = fma(_2507, _2661, _2505);
    out.m_66.x = _2663;
    out.m_66.y = _2665;
    out.m_66.z = _2669;
    out.m_66.w = _2667;
    if (_2649)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _2671 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2671;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

