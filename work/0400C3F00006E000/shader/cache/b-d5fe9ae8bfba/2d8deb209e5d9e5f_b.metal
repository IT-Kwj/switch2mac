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
    float4 m_62 [[user(locn0)]];
    float4 m_58 [[user(locn1)]];
    float4 m_64 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_60 [[user(locn4)]];
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
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1281 = false;
    bool _635 = false;
    bool _473 = false;
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
        float _2273 = as_type<float>(_101);
        out.gl_Position.z = _2273;
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
        out.m_47.x = 0.0;
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
        float _2344 = as_type<float>(_139);
        out.gl_Position.z = _2344;
    }
    if (_131)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _143 = in.m_49.x;
    float _145 = in.m_49.y;
    float _147 = in.m_49.z;
    float _149 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _151 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _153 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _155 = _151 || _153;
    bool _157 = isnan(1.0);
    bool _159 = _155 || _157;
    float _161 = _149;
    if (!_159)
    {
        float _163 = _149 * _149;
        float _165 = _163 * 0.5;
        _141 = _165;
    }
    float _167 = _141;
    float _169 = 0.0;
    float _171 = _167;
    if (!_159)
    {
        float _173 = _119 * _119;
        float _175 = _173 * 0.5;
        _169 = _175;
    }
    float _177 = _169;
    if (!_159)
    {
        float _179 = _167 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _171 = _179;
    }
    float _181 = _171;
    bool _183 = !_159;
    float _185 = _181;
    float _187 = 0.0;
    float _189 = _145;
    float _191 = _145;
    if (!_183)
    {
        float _193 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _195 = log2(_193);
        float _197 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _199 = _197 + 1.0;
        float _201 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _203 = _149 * _195;
        float _205 = 1.0 / _199;
        float _207 = _201 * 0.693147182464599609375;
        float _209 = exp2(_203);
        float _211 = 1.0 / _207;
        float _213 = _209 + (-1.0);
        float _215 = -_213;
        float _217 = fma(_215, _211, _149);
        float _219 = _217 * _205;
        float _221 = _219 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _121 = _209;
        _185 = _221;
        _187 = _211;
    }
    float _223 = _121;
    float _225 = _185;
    float _227 = _187;
    bool _229 = !_159;
    float _231 = _223;
    float _233 = _227;
    if (!_229)
    {
        float _235 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _237 = log2(_235);
        float _239 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _241 = _239 + 1.0;
        float _243 = 1.0 / _241;
        float _245 = _149 * _237;
        float _247 = exp2(_245);
        float _249 = -_247;
        float _251 = _249 + 1.0;
        float _253 = _251 * _243;
        _231 = _247;
        _233 = _241;
        _161 = _253;
    }
    float _255 = _231;
    float _257 = _233;
    float _259 = _161;
    float _261 = _257;
    float _263 = _255;
    if (!_159)
    {
        _261 = _119;
    }
    float _265 = _261;
    float _267 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _269 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _271 = _265;
    if (!_159)
    {
        float _273 = _177 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _263 = _273;
    }
    float _275 = _263;
    bool _277 = !_159;
    float _279 = _275;
    if (!_277)
    {
        float _281 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _283 = log2(_281);
        float _285 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _287 = _285 + 1.0;
        float _289 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _291 = _119 * _283;
        float _293 = 1.0 / _287;
        float _295 = _289 * 0.693147182464599609375;
        float _297 = exp2(_291);
        float _299 = 1.0 / _295;
        float _301 = _297 + (-1.0);
        float _303 = -_301;
        float _305 = fma(_303, _299, _119);
        float _307 = _305 * _293;
        float _309 = _307 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _279 = _309;
    }
    float _311 = _279;
    bool _313 = !_159;
    if (!_313)
    {
        float _315 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _317 = log2(_315);
        float _319 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _321 = _319 + 1.0;
        float _323 = 1.0 / _321;
        float _325 = _119 * _317;
        float _327 = exp2(_325);
        float _329 = -_327;
        float _331 = _329 + 1.0;
        float _333 = _331 * _323;
        _271 = _333;
    }
    float _335 = _271;
    float _337 = _311 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _339 = fma(_259, _145, _269);
    float _341 = _311 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _343 = _311 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _345 = fma(_335, _145, _337);
    float _347 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _349 = fma(_259, _143, _267);
    float _351 = fma(_335, _143, _341);
    float _353 = -_345;
    float _355 = _339 + _353;
    float _357 = fma(_335, _147, _343);
    float _359 = fma(_259, _147, _347);
    float _361 = -_351;
    float _363 = _349 + _361;
    float _365 = _355 * _355;
    float _367 = in.m_51.w;
    float _369 = -_357;
    float _371 = _359 + _369;
    float _373 = _355 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _375 = fma(_363, _363, _365);
    float _377 = _355 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _379 = _355 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _381 = fma(_363, (*spvDescriptorSet0.vp_c10)._m0[4].x, _373);
    float _383 = fma(_371, _371, _375);
    float _385 = fma(_363, (*spvDescriptorSet0.vp_c10)._m0[5].x, _377);
    float _387 = in.m_44.x;
    float _389 = in.m_44.y;
    float _391 = in.m_44.z;
    float _393 = fma(_363, (*spvDescriptorSet0.vp_c10)._m0[6].x, _379);
    float _395 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[4].z, _381);
    float _397 = sqrt(_383);
    bool _399 = _397 >= 9.9999999747524270787835121154785e-07;
    bool _401 = isnan(_397);
    bool _403 = _399 || _401;
    bool _405 = isnan(9.9999999747524270787835121154785e-07);
    bool _407 = _403 || _405;
    float _409 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[5].z, _385);
    float _411 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[6].z, _393);
    float _413 = fma(_339, _367, _389);
    float _415 = fma(_349, _367, _387);
    float _417 = fma(_359, _367, _391);
    float _419 = _339;
    float _421 = _395;
    float _423 = _409;
    float _425 = _417;
    if (_407)
    {
        _419 = _395;
    }
    float _427 = _419;
    float _429 = _427;
    if (_407)
    {
        _421 = _411;
    }
    float _431 = _421;
    float _433 = _431;
    if (!_407)
    {
        bool _435 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _437 = !_435;
        if (!_437)
        {
            float _439 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _441 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _443 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _445 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _439);
            float _447 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _441);
            float _449 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _443);
            float _451 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _445);
            float _453 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _447);
            float _455 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _449);
            float _457 = _451 * _451;
            float _459 = fma(_453, _453, _457);
            float _461 = fma(_455, _455, _459);
            float _463 = rsqrt(_461);
            float _465 = _463 * 9.9999999747524270787835121154785e-07;
            float _467 = _453 * _465;
            float _469 = _451 * _465;
            float _471 = _455 * _465;
            _423 = _469;
            _429 = _467;
            _433 = _471;
            _473 = true;
        }
        else
        {
            float _475 = _145 * _145;
            float _477 = fma(_143, _143, _475);
            float _479 = fma(_147, _147, _477);
            float _481 = sqrt(_479);
            bool _483 = _481 >= 9.9999999747524270787835121154785e-07;
            bool _485 = isnan(_481);
            bool _487 = _483 || _485;
            bool _489 = isnan(9.9999999747524270787835121154785e-07);
            bool _491 = _487 || _489;
            if (!_491)
            {
                float _493 = _389 * _389;
                float _495 = fma(_387, _387, _493);
                float _497 = fma(_391, _391, _495);
                float _499 = sqrt(_497);
                bool _501 = _499 >= 9.9999999747524270787835121154785e-07;
                bool _503 = isnan(_499);
                bool _505 = _501 || _503;
                bool _507 = isnan(9.9999999747524270787835121154785e-07);
                bool _509 = _505 || _507;
                if (!_509)
                {
                    float _511 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _513 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _511);
                    float _515 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _513);
                    float _517 = rsqrt(_515);
                    float _519 = _517 * 9.9999999747524270787835121154785e-07;
                    float _521 = _519 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _523 = _519 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _525 = _519 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _423 = _523;
                    _429 = _521;
                    _433 = _525;
                    _473 = true;
                }
                else
                {
                    float _527 = _389 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _529 = _389 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _531 = _389 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _533 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[5].x, _527);
                    float _535 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[4].x, _529);
                    float _537 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[6].x, _531);
                    float _539 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[5].z, _533);
                    float _541 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[4].z, _535);
                    float _543 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[6].z, _537);
                    float _545 = _539 * _539;
                    float _547 = fma(_541, _541, _545);
                    float _549 = fma(_543, _543, _547);
                    float _551 = rsqrt(_549);
                    float _553 = _551 * 9.9999999747524270787835121154785e-07;
                    float _555 = _541 * _553;
                    float _557 = _539 * _553;
                    float _559 = _543 * _553;
                    _423 = _557;
                    _429 = _555;
                    _433 = _559;
                    _473 = true;
                }
            }
            else
            {
                float _561 = _145 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _563 = _145 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _565 = _145 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _567 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[5].x, _561);
                float _569 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[4].x, _563);
                float _571 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[6].x, _565);
                float _573 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[5].z, _567);
                float _575 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[4].z, _569);
                float _577 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[6].z, _571);
                float _579 = _573 * _573;
                float _581 = fma(_575, _575, _579);
                float _583 = fma(_577, _577, _581);
                float _585 = rsqrt(_583);
                float _587 = _585 * 9.9999999747524270787835121154785e-07;
                float _589 = _575 * _587;
                float _591 = _573 * _587;
                float _593 = _577 * _587;
                _423 = _591;
                _429 = _589;
                _433 = _593;
            }
        }
    }
    _473 = false;
    float _595 = _423;
    float _597 = _429;
    float _599 = _433;
    bool _601 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _603 = !_601;
    float _605 = _595;
    float _607 = _595;
    float _609 = _597;
    float _611 = _599;
    float _613 = _599;
    float _615 = _595;
    float _633;
    if (!_603)
    {
        float _617 = in.m_53.x;
        float _619 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _621 = _617 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _623 = fma(_621, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _625 = _623 * _619;
        float _627 = floor(_625);
        float _629 = -_627;
        float _631 = _625 + _629;
        _633 = _631;
        _635 = true;
    }
    else
    {
        float _637 = float(_85);
        float _639 = 1.0 / _637;
        float _641 = _119 * _639;
        _633 = _641;
    }
    _635 = false;
    float _643 = _633;
    float _645 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _647 = _643 + _645;
    float _649 = _595 * _595;
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _653 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _651;
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _657 = _655 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _659 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _661 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _659;
    float _663 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _665 = _663 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _669 = _643 + _667;
    float _671 = 1.0 / _653;
    float _673 = fma(_597, _597, _649);
    bool _675 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _677 = isnan(_643);
    bool _679 = _675 || _677;
    bool _681 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _683 = _679 || _681;
    float _685 = float(_683);
    float _687 = as_type<float>(int(gl_VertexIndex));
    bool _689 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _691 = isnan(_643);
    bool _693 = _689 || _691;
    bool _695 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _697 = _693 || _695;
    float _699 = float(_697);
    float _701 = fma(_599, _599, _673);
    bool _703 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _705 = isnan(_643);
    bool _707 = _703 || _705;
    bool _709 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _711 = _707 || _709;
    float _713 = float(_711);
    float _715 = 1.0 / _661;
    float _717 = -_699;
    float _719 = _717 + 1.0;
    float _721 = 1.0 / _657;
    float _723 = _647 * _671;
    float _725 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _727 = _643 + _725;
    float _729 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _731 = _643 + _729;
    float _733 = 1.0 / _665;
    float _735 = _727 * _715;
    float _737 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _739 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _737;
    float _741 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _743 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _741;
    int _745 = as_type<int>(_687) & 1;
    bool _747 = _745 != 0;
    int _749 = as_type<int>(_687) & 2;
    bool _751 = _749 != 0;
    float _753 = fma(_739, _723, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _755 = fma(_743, _723, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _757 = _731 * _721;
    bool _759 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _761 = isnan(_643);
    bool _763 = _759 || _761;
    bool _765 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _767 = _763 || _765;
    float _769 = float(_767);
    float _771 = rsqrt(_701);
    float _773 = -_769;
    float _775 = _773 + 1.0;
    float _777 = _669 * _733;
    bool _779 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _781 = isnan(_643);
    bool _783 = _779 || _781;
    bool _785 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _787 = _783 || _785;
    float _789 = float(_787);
    float _791 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _793 = _791 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _795 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _797 = _795 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _799 = -_789;
    float _801 = _799 + 1.0;
    float _803 = _789 * _775;
    float _805 = fma(_793, _757, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _807 = _713 * _719;
    float _809 = _685 * _801;
    float _811 = -_685;
    float _813 = _811 + 1.0;
    float _815 = _771 * _597;
    float _817 = _753 * _807;
    float _819 = _699 * _813;
    float _821 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _823 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _821;
    float _825 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _827 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _825;
    float _829 = _755 * _807;
    float _831 = -_713;
    float _833 = _831 + 1.0;
    float _835 = fma(_823, _735, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _837 = _771 * _599;
    float _839 = fma(_827, _735, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _841 = _771 * _595;
    float _843 = in.m_51.x;
    float _845 = in.m_51.y;
    float _847 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _849 = _837 * _847;
    float _851 = fma(_797, _757, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _853 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _855 = _841 * _853;
    float _857 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _859 = _815 * _857;
    float _861 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _863 = -_849;
    float _865 = fma(_815, _861, _863);
    float _867 = fma(_833, (*spvDescriptorSet0.vp_c9)._m0[143].x, _817);
    float _869 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _871 = -_855;
    float _873 = fma(_837, _869, _871);
    float _875 = fma(_833, (*spvDescriptorSet0.vp_c9)._m0[143].y, _829);
    float _877 = _865 * _865;
    float _879 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _881 = -_859;
    float _883 = fma(_841, _879, _881);
    float _885 = fma(_805, _819, _867);
    float _887 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _889 = _887 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _891 = fma(_873, _873, _877);
    float _893 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _895 = _893 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _897 = fma(_851, _819, _875);
    float _899 = fma(_889, _777, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _901 = fma(_883, _883, _891);
    float _903 = fma(_835, _809, _885);
    float _905 = fma(_895, _777, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _907 = fma(_839, _809, _897);
    float _909 = rsqrt(_901);
    float _911 = fma(_899, _803, _903);
    float _913 = fma(_905, _803, _907);
    float _915 = _413 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _917 = fma(_769, (*spvDescriptorSet0.vp_c9)._m0[147].x, _911);
    bool _919 = !_751;
    float _921 = _919 ? (-0.5) : 0.5;
    float _923 = fma(_769, (*spvDescriptorSet0.vp_c9)._m0[147].y, _913);
    bool _925 = !_747;
    float _927 = _925 ? (-0.5) : 0.5;
    float _929 = _917 * _843;
    float _931 = fma(_415, (*spvDescriptorSet0.vp_c10)._m0[6].x, _915);
    float _933 = _923 * _845;
    float _935 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _921);
    float _937 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _927);
    float _939 = _929 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _941 = _933 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _943 = _865 * _909;
    float _945 = _883 * _909;
    float _947 = _413 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _949 = _941 * _935;
    float _951 = _939 * _937;
    float _953 = _873 * _909;
    float _955 = fma(_415, (*spvDescriptorSet0.vp_c10)._m0[4].x, _947);
    float _957 = _815 * _943;
    float _959 = _841 * _945;
    float _961 = _949 * _815;
    float _963 = _949 * _837;
    float _965 = -_957;
    float _967 = fma(_841, _953, _965);
    float _969 = -_959;
    float _971 = fma(_837, _943, _969);
    float _973 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _975 = fma(_417, (*spvDescriptorSet0.vp_c10)._m0[4].z, _955);
    float _977 = fma(_417, (*spvDescriptorSet0.vp_c10)._m0[6].z, _931);
    float _979 = fma(_951, _953, _961);
    float _981 = fma(_951, _945, _963);
    float _983 = _975 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _985 = _977 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _987 = fma(_973, _971, _979);
    float _989 = fma(_973, _967, _981);
    float _991 = _413 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _993 = _949 * _841;
    float _995 = _983 + _987;
    float _997 = _985 + _989;
    float _999 = _837 * _953;
    float _1001 = in.m_53.x;
    float _1003 = in.m_53.y;
    float _1005 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1007 = _995 + _1005;
    float _1009 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1011 = _997 + _1009;
    float _1013 = fma(_415, (*spvDescriptorSet0.vp_c10)._m0[5].x, _991);
    float _1015 = fma(_951, _943, _993);
    float _1017 = _1007 * _1007;
    float _1019 = _1011 * _1011;
    float _1021 = -_999;
    float _1023 = fma(_815, _945, _1021);
    float _1025 = fma(_417, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1013);
    float _1027 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1029 = _1017 + _1019;
    float _1031 = fma(_973, _1023, _1015);
    float _1033 = _1025 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1035 = _1033 + _1031;
    float _1037 = sqrt(_1029);
    bool _1039 = _1001 > 0.5;
    float _1041 = -_927;
    float _1043 = _1039 ? _1041 : _927;
    int _1045 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1047 = _1045 != 0;
    bool _1049 = _1037 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _1051 = !_1047;
    float _1053 = _1051 ? _927 : _1043;
    float _1055 = _1031;
    float _1057 = _1043;
    float _1059 = _997;
    float _1061 = _995;
    float _1063 = _701;
    if (!_1049)
    {
        _1055 = _997;
    }
    float _1065 = _1055;
    float _1067 = _1065;
    if (!_1049)
    {
        _1057 = _1019;
    }
    float _1069 = _1057;
    float _1071 = _1069;
    if (!_1049)
    {
        _425 = _1017;
    }
    float _1073 = _425;
    float _1075 = _1073;
    if (!_1049)
    {
        _1059 = _1035;
    }
    float _1077 = _1059;
    bool _1079 = !_1049;
    float _1081 = _1077;
    if (!_1079)
    {
        float _1083 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1085 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1087 = _1037 + _1085;
        float _1089 = _1035 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1091 = rsqrt(_1029);
        float _1093 = _1087 * _1083;
        float _1095 = _1093 * 0.15915493667125701904296875;
        float _1097 = _1095 * 6.283185482025146484375;
        float _1099 = sin(_1097);
        float _1101 = _1095 * 6.283185482025146484375;
        float _1103 = cos(_1101);
        float _1105 = fma(_1099, _1089, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1107 = _1091 * _1105;
        float _1109 = _1103 + (-1.0);
        float _1111 = fma(_1007, _1107, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1113 = fma(_1011, _1107, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1115 = _1109 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1117 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1119 = _1111 + _1117;
        float _1121 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1123 = _1113 + _1121;
        float _1125 = fma(_1035, _1103, _1115);
        float _1127 = _1119 * _1119;
        float _1129 = _1123 * _1123;
        _1081 = _1125;
        _1075 = _1127;
        _1071 = _1129;
        _1061 = _1111;
        _1067 = _1113;
    }
    float _1131 = _1081;
    float _1133 = _1075;
    float _1135 = _1071;
    float _1137 = _1061;
    float _1139 = _1067;
    float _1141 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1143 = _1131 + _1141;
    float _1145 = _1053 + 0.5;
    bool _1147 = _1003 > 0.5;
    float _1149 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1151 = fma(_1143, _1143, _1133);
    float _1153 = _1145 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1155 = _927 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1157 = _1151 + _1135;
    float _1159 = _1153 * _1027;
    float _1161 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _1163 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1165 = _1163 != 0;
    float _1167 = sqrt(_1157);
    float _1169 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1171 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1173 = -_921;
    int _1175 = _1147 ? as_type<int>(_1173) : as_type<int>(_921);
    float _1177 = _1161 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1179 = _1169 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1181 = _1171 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1183 = !_1165;
    float _1185 = _1183 ? _921 : as_type<float>(_1175);
    float _1187 = _921 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    out.m_58.x = _1179;
    out.m_58.y = _1181;
    out.m_58.z = _1177;
    float _1189 = -_1185;
    float _1191 = _1189 + 0.5;
    float _1193 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1195 = _1191 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _1197 = _1167 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1199 = isnan(_1167);
    bool _1201 = _1197 || _1199;
    bool _1203 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1205 = _1201 || _1203;
    float _1207 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1209 = _1195 * _1149;
    float _1211 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1213 = _815 * _1187;
    float _1215 = _841 * _1187;
    float _1217 = _837 * _1187;
    float _1219 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1221 = _1193 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1223 = _1207 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1225 = _1211 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1227 = fma(_953, _1155, _1213);
    float _1229 = fma(_943, _1155, _1215);
    float _1231 = fma(_945, _1155, _1217);
    out.m_60.x = _1159;
    out.m_60.y = _1209;
    out.m_62.x = _1221;
    out.m_62.y = _1223;
    out.m_62.z = _1225;
    out.m_62.w = _1219;
    float _1233 = _1209;
    float _1235 = _1155;
    float _1237 = _1229;
    float _1239 = _1229;
    if (!_1205)
    {
        _1233 = 1.0;
    }
    float _1241 = _1233;
    float _1243 = _971 + _1227;
    float _1245 = _1023 + _1229;
    float _1247 = _967 + _1231;
    bool _1249 = !_1205;
    float _1251 = _1241;
    if (!_1249)
    {
        bool _1253 = _1167 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1255 = isnan(_1167);
        bool _1257 = _1253 || _1255;
        bool _1259 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1261 = _1257 || _1259;
        if (!_1261)
        {
            float _1263 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1265 = _1167 + _1263;
            float _1267 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1269 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1267;
            float _1271 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1273 = _1271 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1275 = 1.0 / _1269;
            float _1277 = _1265 * _1275;
            float _1279 = fma(_1277, _1273, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1251 = _1279;
            _1281 = true;
        }
        else
        {
            bool _1283 = _1167 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1285 = isnan(_1167);
            bool _1287 = _1283 || _1285;
            bool _1289 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1291 = _1287 || _1289;
            if (!_1291)
            {
                float _1293 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1295 = _1167 + _1293;
                float _1297 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1299 = _1297 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1301 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1303 = _1301 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1305 = 1.0 / _1299;
                float _1307 = _1295 * _1305;
                float _1309 = fma(_1307, _1303, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1251 = _1309;
                _1281 = true;
            }
            else
            {
                _1251 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1281 = false;
    float _1311 = _1251;
    float _1313 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1315 = _1131 + _1313;
    float _1317 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1319 = _1137 + _1317;
    float _1321 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1323 = _1139 + _1321;
    float _1325 = fma(_1315, _1311, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1327 = fma(_1319, _1311, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1329 = fma(_1323, _1311, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1331 = -_1033;
    float _1333 = _1331 + _1325;
    float _1335 = -_983;
    float _1337 = _1335 + _1327;
    float _1339 = -_985;
    float _1341 = _1339 + _1329;
    float _1343 = _1333 * _1333;
    float _1345 = fma(_1337, _1337, _1343);
    float _1347 = fma(_1341, _1341, _1345);
    float _1349 = sqrt(_1347);
    bool _1351 = _1349 > 0.0;
    bool _1353 = !_1351;
    float _1355 = _1349;
    float _1357 = _1327;
    float _1359 = _1325;
    float _1361 = _1329;
    float _1363 = _1341;
    float _1365 = _1337;
    if (!_1353)
    {
        bool _1367 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _1369 = _967;
        if (_1367)
        {
            float _1371 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _1369 = _1371;
        }
        float _1373 = _1369;
        if (_1367)
        {
            _1235 = _701;
        }
        float _1375 = _1235;
        float _1377 = _1375;
        if (_1367)
        {
            float _1379 = _1373 * _597;
            _1237 = _1379;
        }
        float _1381 = _1237;
        float _1383 = _1381;
        if (_1367)
        {
            float _1385 = _1373 * _595;
            _1355 = _1385;
        }
        float _1387 = _1355;
        float _1389 = _1387;
        if (_1367)
        {
            float _1391 = _1373 * _599;
            _1063 = _1391;
        }
        float _1393 = _1063;
        float _1395 = _1393;
        if (!_1367)
        {
            float _1397 = _119 + 1.0;
            float _1399 = _1397;
            if (!_159)
            {
                float _1401 = _1397 * _1397;
                float _1403 = _1401 * 0.5;
                _605 = _1403;
            }
            float _1405 = _605;
            float _1407 = _1405;
            if (!_159)
            {
                float _1409 = _1405 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1407 = _1409;
            }
            float _1411 = _1407;
            bool _1413 = !_159;
            float _1415 = _1411;
            if (!_1413)
            {
                float _1417 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1419 = log2(_1417);
                float _1421 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1423 = _1421 + 1.0;
                float _1425 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1427 = _1419 * _1397;
                float _1429 = exp2(_1427);
                float _1431 = _1425 * 0.693147182464599609375;
                float _1433 = 1.0 / _1431;
                float _1435 = 1.0 / _1423;
                float _1437 = _1429 + (-1.0);
                float _1439 = -_1437;
                float _1441 = fma(_1439, _1433, _1397);
                float _1443 = _1441 * _1435;
                float _1445 = _1443 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1415 = _1445;
            }
            float _1447 = _1415;
            float _1449 = _1447 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _1451 = _1447 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _1453 = !_159;
            if (!_1453)
            {
                float _1455 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1457 = log2(_1455);
                float _1459 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1461 = _1459 + 1.0;
                float _1463 = 1.0 / _1461;
                float _1465 = _1457 * _1397;
                float _1467 = exp2(_1465);
                float _1469 = -_1467;
                float _1471 = _1469 + 1.0;
                float _1473 = _1471 * _1463;
                _1399 = _1473;
            }
            float _1475 = _1399;
            float _1477 = fma(_1475, _145, _1451);
            float _1479 = fma(_1475, _143, _1449);
            float _1481 = _1447 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _1483 = -_345;
            float _1485 = _1483 + _1477;
            float _1487 = -_351;
            float _1489 = _1487 + _1479;
            float _1491 = fma(_1475, _147, _1481);
            float _1493 = _1485 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _1495 = _1485 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _1497 = -_357;
            float _1499 = _1497 + _1491;
            float _1501 = _1485 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _1503 = fma(_1489, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1493);
            float _1505 = fma(_1489, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1495);
            float _1507 = fma(_1489, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1501);
            float _1509 = fma(_1499, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1503);
            float _1511 = fma(_1499, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1505);
            float _1513 = fma(_1499, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1507);
            float _1515 = _1509 * _1509;
            float _1517 = fma(_1511, _1511, _1515);
            float _1519 = fma(_1513, _1513, _1517);
            _1377 = _1519;
            _607 = _1509;
            _609 = _1511;
            _611 = _1513;
            _1383 = _1511;
            _1389 = _1509;
            _1395 = _1513;
            _189 = _1507;
        }
        float _1521 = _1377;
        float _1523 = _607;
        float _1525 = _609;
        float _1527 = _611;
        float _1529 = _1383;
        float _1531 = _1389;
        float _1533 = _1395;
        float _1535 = _189;
        float _1537 = sqrt(_1521);
        float _1539 = rsqrt(_1347);
        bool _1541 = _1537 > 0.0;
        float _1543 = _1337 * _1539;
        float _1545 = _1333 * _1539;
        float _1547 = _1341 * _1539;
        bool _1549 = !_1541;
        _613 = _1527;
        _191 = _1535;
        _1365 = _1543;
        _615 = _1523;
        _1239 = _1529;
        if (!_1549)
        {
            float _1551 = rsqrt(_1521);
            float _1553 = _1551 * _1523;
            float _1555 = _1551 * _1525;
            float _1557 = _1545 * _1553;
            float _1559 = _1551 * _1527;
            float _1561 = fma(_1543, _1555, _1557);
            float _1563 = fma(_1547, _1559, _1561);
            float _1565 = _1563 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1567 = fma(_1529, _1565, _1327);
            float _1569 = fma(_1531, _1565, _1325);
            float _1571 = fma(_1533, _1565, _1329);
            _1357 = _1567;
            _1359 = _1569;
            _1361 = _1571;
            _191 = _1559;
            _1363 = _1557;
        }
    }
    float _1573 = _1357;
    float _1575 = _1359;
    float _1577 = _1361;
    float _1579 = _613;
    float _1581 = _191;
    float _1583 = _1363;
    float _1585 = _1365;
    float _1587 = _615;
    float _1589 = _1239;
    bool _1591 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1593 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1595 = _1591 || _1593;
    bool _1597 = isnan(0.5);
    bool _1599 = _1595 || _1597;
    float _1601 = _1581;
    float _1603 = _1579;
    float _1605 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _1607 = _1573;
    float _1609 = _1585;
    float _1611 = _1589;
    if (_1599)
    {
        _1601 = _1573;
    }
    float _1613 = _1601;
    float _1615 = _1613;
    if (_1599)
    {
        _1603 = _1575;
    }
    float _1617 = _1603;
    float _1619 = _1617;
    if (_1599)
    {
        _1605 = _1577;
    }
    float _1621 = _1605;
    float _1623 = _1621;
    if (!_1599)
    {
        float _1625 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1627 = _1033 + _1625;
        float _1629 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1631 = _983 + _1629;
        float _1633 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1635 = -_983;
        float _1637 = _1635 + _1573;
        float _1639 = _1627 * _1627;
        float _1641 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1643 = _985 + _1641;
        float _1645 = -_985;
        float _1647 = _1645 + _1577;
        float _1649 = fma(_1631, _1631, _1639);
        float _1651 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1653 = fma(_1643, _1643, _1649);
        float _1655 = sqrt(_1653);
        float _1657 = _1633 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1659 = precise::min(_1655, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1661 = _1659 * _1651;
        float _1663 = -_1033;
        float _1665 = _1663 + _1575;
        float _1667 = _1657 * _1661;
        float _1669 = fma(_1637, _1667, _983);
        float _1671 = fma(_1665, _1667, _1033);
        float _1673 = fma(_1647, _1667, _985);
        _1619 = _1671;
        _1615 = _1669;
        _1623 = _1673;
        _1607 = _1637;
    }
    float _1675 = _1619;
    float _1677 = _1615;
    float _1679 = _1623;
    float _1681 = _1607;
    float _1683 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1685 = _1675 + _1683;
    float _1687 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1689 = _1677 + _1687;
    float _1691 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1693 = _1679 + _1691;
    float _1695 = _1685 * _1685;
    float _1697 = fma(_1689, _1689, _1695);
    float _1699 = fma(_1693, _1693, _1697);
    float _1701 = rsqrt(_1699);
    float _1703 = sqrt(_1699);
    float _1705 = _1689 * _1701;
    float _1707 = _1693 * _1701;
    float _1709 = _1685 * _1701;
    float _1711 = _1705 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1713 = _1707 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1715 = _1711 * _1711;
    float _1717 = _1713 * _1713;
    float _1719 = _1715 + _1717;
    float _1721 = sqrt(_1719);
    bool _1723 = _1721 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1725 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1727 = _1721 + _1725;
    float _1729 = _1583;
    float _1731 = _1727;
    float _1733 = _1701;
    float _1735 = _1705;
    if (_1723)
    {
        float _1737 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1729 = _1737;
    }
    float _1739 = _1729;
    if (_1723)
    {
        float _1741 = _1727 * _1739;
        _1731 = _1741;
    }
    float _1743 = _1731;
    if (_1723)
    {
        float _1745 = _1743 * 0.15915493667125701904296875;
        _1609 = _1745;
    }
    float _1747 = _1609;
    float _1749 = _1681;
    float _1751 = _1747;
    if (_1723)
    {
        float _1753 = _1747 * 6.283185482025146484375;
        float _1755 = sin(_1753);
        _1749 = _1755;
    }
    float _1757 = _1749;
    float _1759 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1761 = precise::max(0.0, _1759);
    float _1763 = _1587;
    float _1765 = _1761;
    if (_1723)
    {
        float _1767 = _1747 * 6.283185482025146484375;
        float _1769 = cos(_1767);
        _1763 = _1769;
    }
    float _1771 = _1763;
    float _1773 = -_1709;
    float _1775 = -_1761;
    float _1777 = fma(_1773, (*spvDescriptorSet0.vp_c15)._m0[24].y, _1775);
    float _1779 = _1759;
    if (_1723)
    {
        float _1781 = rsqrt(_1719);
        _1779 = _1781;
    }
    float _1783 = _1779;
    if (_1723)
    {
        float _1785 = _1777 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1765 = _1785;
    }
    float _1787 = _1765;
    float _1789 = _1787;
    float _1791 = _1757;
    if (_1723)
    {
        float _1793 = fma(_1757, _1787, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1789 = _1793;
    }
    float _1795 = _1789;
    float _1797 = _1795;
    if (!_1723)
    {
        _1791 = _1711;
    }
    float _1799 = _1791;
    float _1801 = _1799;
    float _1803 = _1771;
    if (_1723)
    {
        float _1805 = _1771 + (-1.0);
        _1733 = _1805;
    }
    float _1807 = _1733;
    float _1809 = _1807;
    if (_1723)
    {
        float _1811 = _1807 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1751 = _1811;
    }
    float _1813 = _1751;
    if (!_1723)
    {
        _1809 = _1715;
    }
    float _1815 = _1809;
    float _1817 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1819 = _1783;
    float _1821 = _1815;
    if (_1723)
    {
        float _1823 = _1783 * _1795;
        _1611 = _1823;
    }
    float _1825 = _1611;
    if (!_1723)
    {
        _1797 = _1777;
    }
    float _1827 = _1797;
    float _1829 = _1827;
    if (_1723)
    {
        float _1831 = fma(_1777, _1771, _1813);
        _1829 = _1831;
    }
    float _1833 = _1829;
    if (!_1723)
    {
        _1819 = _1713;
    }
    float _1835 = _1819;
    float _1837 = _1835;
    if (_1723)
    {
        float _1839 = _1711 * _1825;
        _1801 = _1839;
    }
    float _1841 = _1801;
    if (_1723)
    {
        float _1843 = _1713 * _1825;
        _1837 = _1843;
    }
    float _1845 = _1837;
    if (!_1723)
    {
        _1803 = _1717;
    }
    float _1847 = _1803;
    float _1849 = _1675 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1851 = _1847;
    if (_1723)
    {
        float _1853 = _1841 * _1841;
        _1821 = _1853;
    }
    float _1855 = _1821;
    if (_1723)
    {
        float _1857 = _1845 * _1845;
        _1851 = _1857;
    }
    float _1859 = _1851;
    float _1861 = fma(_1833, _1833, _1855);
    float _1863 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1865 = fma(_1703, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1863);
    float _1867 = precise::clamp(_1865, 0.0, 1.0);
    float _1869 = _1861 + _1859;
    float _1871 = _1675 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1873 = -_1867;
    float _1875 = _1873 + 1.0;
    float _1877 = rsqrt(_1869);
    float _1879 = fma(_1677, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1871);
    float _1881 = _1675 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1883 = _1675 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1885 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1879);
    float _1887 = fma(_1677, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1881);
    float _1889 = fma(_1677, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1883);
    float _1891 = abs(_1875);
    float _1893 = log2(_1891);
    float _1895 = _1885 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1897 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1887);
    float _1899 = fma(_1677, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1849);
    float _1901 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1889);
    float _1903 = _1895 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1905 = _1897 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1907 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1899);
    float _1909 = _1877 * _1841;
    float _1911 = _1877 * _1833;
    float _1913 = -_1903;
    float _1915 = fma(_1913, _1817, 1.0);
    float _1917 = _1901 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1919 = _1909 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1921 = _1905 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1923 = _1877 * _1845;
    float _1925 = _1907 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1927 = -_1919;
    float _1929 = fma(_1911, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1927);
    float _1931 = fma(_1917, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1921);
    float _1933 = _1893 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1935 = log2(_1915);
    float _1937 = -_1923;
    float _1939 = fma(_1937, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1929);
    float _1941 = fma(_1895, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1931);
    float _1943 = _1905 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1945 = _1905 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1947 = fma(_1939, -0.5, 0.5);
    float _1949 = fma(_1925, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1941);
    float _1951 = exp2(_1933);
    float _1953 = fma(_1939, 0.5, 0.5);
    float _1955 = fma(_1917, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1943);
    float _1957 = fma(_1917, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1945);
    float _1959 = _1911 + 1.0;
    float _1961 = fma(_1895, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1955);
    float _1963 = fma(_1895, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1957);
    float _1965 = 1.0 / _1949;
    float _1967 = fma(_1953, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1969 = _1935 * 0.693147182464599609375;
    float _1971 = fma(_1953, _1967, -0.212114393711090087890625);
    float _1973 = _1969 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1975 = sqrt(_1947);
    float _1977 = -_1911;
    float _1979 = fma(_1951, _1959, _1977);
    float _1981 = fma(_1925, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1961);
    float _1983 = fma(_1925, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1963);
    float _1985 = fma(_1953, _1971, 1.570728778839111328125);
    float _1987 = fma(_1979, 0.5, 0.5);
    float _1989 = _1981 * _1965;
    float _1991 = _1983 * _1965;
    float _1993 = fma(_1989, 0.5, 0.5);
    float _1995 = fma(_1991, -0.5, 0.5);
    float _1997 = _1975 * 0.636619746685028076171875;
    float _1999 = -_1985;
    float _2001 = fma(_1997, _1999, 1.0);
    float3 _5340 = float3(_1993, _1995, _1973);
    float _2003 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5340, float3(0.0), isnan(_5340)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5340, float3(0.0), isnan(_5340)), level(0.0)).x;
    float3 _5351 = float3(_1993, _1995, _1973);
    float4 _2006 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5351, float3(0.0), isnan(_5351)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5351, float3(0.0), isnan(_5351)), level(0.0)).xyzw;
    float _2008 = _2006.x;
    float _2010 = _2006.y;
    float _2012 = _2006.z;
    float _2014 = _2006.w;
    float2 _5368 = float2(_2001, _1987);
    float3 _2018 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5368, float2(0.0), isnan(_5368)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5368, float2(0.0), isnan(_5368)), level(0.0)).xyz;
    float _2020 = _2018.x;
    float _2022 = _2018.y;
    float _2024 = _2018.z;
    float _2026 = _1033 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2028 = _1245 * _1709;
    float _2030 = _1033 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2032 = fma(_983, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2026);
    float _2034 = -(*spvDescriptorSet0.vp_c9)._m0[139].z;
    float _2036 = (*spvDescriptorSet0.vp_c9)._m0[139].w + _2034;
    float _2038 = fma(_1243, _1705, _2028);
    float _2040 = fma(_985, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2032);
    float _2042 = fma(_983, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2030);
    float _2044 = _1905 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2046 = fma(_1247, _1707, _2038);
    float _2048 = _2040 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2050 = 1.0 / _2036;
    float _2052 = _1893 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2054 = fma(_985, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2042);
    float _2056 = fma(_1917, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2044);
    bool _2058 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2060 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2062 = _2058 || _2060;
    bool _2064 = isnan(0.5);
    bool _2066 = _2062 || _2064;
    float _2068 = abs(_2046);
    float _2070 = -(*spvDescriptorSet0.vp_c9)._m0[139].z;
    float _2072 = _2068 + _2070;
    float _2074 = _2054 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2076 = 1.0 / _2048;
    float _2078 = fma(_1895, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2056);
    float _2080 = _2074 + _2048;
    float _2082 = fma(_1925, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2078);
    float _2084 = exp2(_2052);
    float _2086 = _2072 * _2050;
    float _2088 = precise::clamp(_2086, 0.0, 1.0);
    if (_2066)
    {
        _1735 = 1.0;
    }
    float _2090 = _1735;
    float _2092 = _2088 * _2088;
    float _2094 = _2080 * _2076;
    float _2096 = _2094 * 0.5;
    float _2098 = fma(_2088, -2.0, 3.0);
    float _2100 = _2090;
    if (!_2066)
    {
        float _2102 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2104 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2106 = fma(_2096, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2104);
        float _2108 = _2102 * 0.15915493667125701904296875;
        float _2110 = _2108 * 6.283185482025146484375;
        float _2112 = cos(_2110);
        float _2114 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2116 = _2114 * 0.15915493667125701904296875;
        float _2118 = _2108 * 6.283185482025146484375;
        float _2120 = sin(_2118);
        float _2122 = 1.0 / _2112;
        float _2124 = _2116 * 6.283185482025146484375;
        float _2126 = cos(_2124);
        float _2128 = _2120 * _2122;
        float _2130 = 1.0 / _2106;
        float _2132 = _2126 * _2128;
        float _2134 = _2116 * 6.283185482025146484375;
        float _2136 = sin(_2134);
        float _2138 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2140 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2138;
        float _2142 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2144 = _2130 * _2142;
        float _2146 = 1.0 / _2132;
        float _2148 = 1.0 / _2140;
        float _2150 = _2136 * _2146;
        float _2152 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2154 = fma(_2150, _2144, _2152);
        float _2156 = _2154 * _2148;
        float _2158 = precise::clamp(_2156, 0.0, 1.0);
        _2100 = _2158;
    }
    float _2160 = _2100;
    float _2162 = -_2084;
    float _2164 = _2162 + 1.0;
    float _2166 = _2092 * _2098;
    float _2168 = _1949 * 0.5;
    bool _2170 = _2160 > 0.0;
    bool _2172 = isnan(_2160);
    bool _2174 = _2170 || _2172;
    bool _2176 = isnan(0.0);
    bool _2178 = _2174 || _2176;
    float _2180 = _2164 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2182 = _2166 * _2160;
    float _2184 = fma(_1983, -0.5, _2168);
    float _2186 = _2082 + _1949;
    float _2188 = _2180 * _2003;
    float _2190 = _1981 + _1949;
    float _2192 = _2182 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.gl_Position.x = _1981;
    out.gl_Position.y = _1983;
    out.gl_Position.z = _2082;
    out.gl_Position.w = _1949;
    float _2194 = _2014 * _2188;
    float _2196 = _2024 * _2188;
    float _2198 = -_2180;
    float _2200 = _2198 + 1.0;
    float _2202 = _2186 * 0.5;
    float _2204 = _2190 * 0.5;
    float _2206 = _2014 * _2200;
    float _2208 = _2192 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2210 = fma(_2020, _2194, _2008);
    float _2212 = fma(_2022, _2194, _2010);
    float _2214 = fma(_2014, _2196, _2012);
    out.m_64.x = _2204;
    out.m_64.y = _2184;
    out.m_64.z = _2202;
    out.m_64.w = _1949;
    out.m_47.x = _2208;
    out.m_66.x = _2210;
    out.m_66.y = _2212;
    out.m_66.z = _2214;
    out.m_66.w = _2206;
    if (_2178)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _2216 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2216;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1281 = false;
    bool _635 = false;
    bool _473 = false;
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
        float _2273 = as_type<float>(_101);
        out.gl_Position.z = _2273;
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
        out.m_47.x = 0.0;
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
        float _2344 = as_type<float>(_139);
        out.gl_Position.z = _2344;
    }
    if (_131)
    {
        return out;
    }
    float _143 = in.m_49.x;
    float _145 = in.m_49.y;
    float _147 = in.m_49.z;
    float _149 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _151 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _153 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _155 = _151 || _153;
    bool _157 = isnan(1.0);
    bool _159 = _155 || _157;
    float _161 = _149;
    if (!_159)
    {
        float _163 = _149 * _149;
        float _165 = _163 * 0.5;
        _141 = _165;
    }
    float _167 = _141;
    float _169 = 0.0;
    float _171 = _167;
    if (!_159)
    {
        float _173 = _119 * _119;
        float _175 = _173 * 0.5;
        _169 = _175;
    }
    float _177 = _169;
    if (!_159)
    {
        float _179 = _167 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _171 = _179;
    }
    float _181 = _171;
    bool _183 = !_159;
    float _185 = _181;
    float _187 = 0.0;
    float _189 = _145;
    float _191 = _145;
    if (!_183)
    {
        float _193 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _195 = log2(_193);
        float _197 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _199 = _197 + 1.0;
        float _201 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _203 = _149 * _195;
        float _205 = 1.0 / _199;
        float _207 = _201 * 0.693147182464599609375;
        float _209 = exp2(_203);
        float _211 = 1.0 / _207;
        float _213 = _209 + (-1.0);
        float _215 = -_213;
        float _217 = fma(_215, _211, _149);
        float _219 = _217 * _205;
        float _221 = _219 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _121 = _209;
        _185 = _221;
        _187 = _211;
    }
    float _223 = _121;
    float _225 = _185;
    float _227 = _187;
    bool _229 = !_159;
    float _231 = _223;
    float _233 = _227;
    if (!_229)
    {
        float _235 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _237 = log2(_235);
        float _239 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _241 = _239 + 1.0;
        float _243 = 1.0 / _241;
        float _245 = _149 * _237;
        float _247 = exp2(_245);
        float _249 = -_247;
        float _251 = _249 + 1.0;
        float _253 = _251 * _243;
        _231 = _247;
        _233 = _241;
        _161 = _253;
    }
    float _255 = _231;
    float _257 = _233;
    float _259 = _161;
    float _261 = _257;
    float _263 = _255;
    if (!_159)
    {
        _261 = _119;
    }
    float _265 = _261;
    float _267 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _269 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _271 = _265;
    if (!_159)
    {
        float _273 = _177 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _263 = _273;
    }
    float _275 = _263;
    bool _277 = !_159;
    float _279 = _275;
    if (!_277)
    {
        float _281 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _283 = log2(_281);
        float _285 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _287 = _285 + 1.0;
        float _289 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _291 = _119 * _283;
        float _293 = 1.0 / _287;
        float _295 = _289 * 0.693147182464599609375;
        float _297 = exp2(_291);
        float _299 = 1.0 / _295;
        float _301 = _297 + (-1.0);
        float _303 = -_301;
        float _305 = fma(_303, _299, _119);
        float _307 = _305 * _293;
        float _309 = _307 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _279 = _309;
    }
    float _311 = _279;
    bool _313 = !_159;
    if (!_313)
    {
        float _315 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _317 = log2(_315);
        float _319 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _321 = _319 + 1.0;
        float _323 = 1.0 / _321;
        float _325 = _119 * _317;
        float _327 = exp2(_325);
        float _329 = -_327;
        float _331 = _329 + 1.0;
        float _333 = _331 * _323;
        _271 = _333;
    }
    float _335 = _271;
    float _337 = _311 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _339 = fma(_259, _145, _269);
    float _341 = _311 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _343 = _311 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _345 = fma(_335, _145, _337);
    float _347 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _349 = fma(_259, _143, _267);
    float _351 = fma(_335, _143, _341);
    float _353 = -_345;
    float _355 = _339 + _353;
    float _357 = fma(_335, _147, _343);
    float _359 = fma(_259, _147, _347);
    float _361 = -_351;
    float _363 = _349 + _361;
    float _365 = _355 * _355;
    float _367 = in.m_51.w;
    float _369 = -_357;
    float _371 = _359 + _369;
    float _373 = _355 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _375 = fma(_363, _363, _365);
    float _377 = _355 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _379 = _355 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _381 = fma(_363, (*spvDescriptorSet0.vp_c10)._m0[4].x, _373);
    float _383 = fma(_371, _371, _375);
    float _385 = fma(_363, (*spvDescriptorSet0.vp_c10)._m0[5].x, _377);
    float _387 = in.m_44.x;
    float _389 = in.m_44.y;
    float _391 = in.m_44.z;
    float _393 = fma(_363, (*spvDescriptorSet0.vp_c10)._m0[6].x, _379);
    float _395 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[4].z, _381);
    float _397 = sqrt(_383);
    bool _399 = _397 >= 9.9999999747524270787835121154785e-07;
    bool _401 = isnan(_397);
    bool _403 = _399 || _401;
    bool _405 = isnan(9.9999999747524270787835121154785e-07);
    bool _407 = _403 || _405;
    float _409 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[5].z, _385);
    float _411 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[6].z, _393);
    float _413 = fma(_339, _367, _389);
    float _415 = fma(_349, _367, _387);
    float _417 = fma(_359, _367, _391);
    float _419 = _339;
    float _421 = _395;
    float _423 = _409;
    float _425 = _417;
    if (_407)
    {
        _419 = _395;
    }
    float _427 = _419;
    float _429 = _427;
    if (_407)
    {
        _421 = _411;
    }
    float _431 = _421;
    float _433 = _431;
    if (!_407)
    {
        bool _435 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _437 = !_435;
        if (!_437)
        {
            float _439 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _441 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _443 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _445 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _439);
            float _447 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _441);
            float _449 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _443);
            float _451 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _445);
            float _453 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _447);
            float _455 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _449);
            float _457 = _451 * _451;
            float _459 = fma(_453, _453, _457);
            float _461 = fma(_455, _455, _459);
            float _463 = rsqrt(_461);
            float _465 = _463 * 9.9999999747524270787835121154785e-07;
            float _467 = _453 * _465;
            float _469 = _451 * _465;
            float _471 = _455 * _465;
            _423 = _469;
            _429 = _467;
            _433 = _471;
            _473 = true;
        }
        else
        {
            float _475 = _145 * _145;
            float _477 = fma(_143, _143, _475);
            float _479 = fma(_147, _147, _477);
            float _481 = sqrt(_479);
            bool _483 = _481 >= 9.9999999747524270787835121154785e-07;
            bool _485 = isnan(_481);
            bool _487 = _483 || _485;
            bool _489 = isnan(9.9999999747524270787835121154785e-07);
            bool _491 = _487 || _489;
            if (!_491)
            {
                float _493 = _389 * _389;
                float _495 = fma(_387, _387, _493);
                float _497 = fma(_391, _391, _495);
                float _499 = sqrt(_497);
                bool _501 = _499 >= 9.9999999747524270787835121154785e-07;
                bool _503 = isnan(_499);
                bool _505 = _501 || _503;
                bool _507 = isnan(9.9999999747524270787835121154785e-07);
                bool _509 = _505 || _507;
                if (!_509)
                {
                    float _511 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _513 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _511);
                    float _515 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _513);
                    float _517 = rsqrt(_515);
                    float _519 = _517 * 9.9999999747524270787835121154785e-07;
                    float _521 = _519 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _523 = _519 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _525 = _519 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _423 = _523;
                    _429 = _521;
                    _433 = _525;
                    _473 = true;
                }
                else
                {
                    float _527 = _389 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _529 = _389 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _531 = _389 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _533 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[5].x, _527);
                    float _535 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[4].x, _529);
                    float _537 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[6].x, _531);
                    float _539 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[5].z, _533);
                    float _541 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[4].z, _535);
                    float _543 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[6].z, _537);
                    float _545 = _539 * _539;
                    float _547 = fma(_541, _541, _545);
                    float _549 = fma(_543, _543, _547);
                    float _551 = rsqrt(_549);
                    float _553 = _551 * 9.9999999747524270787835121154785e-07;
                    float _555 = _541 * _553;
                    float _557 = _539 * _553;
                    float _559 = _543 * _553;
                    _423 = _557;
                    _429 = _555;
                    _433 = _559;
                    _473 = true;
                }
            }
            else
            {
                float _561 = _145 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _563 = _145 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _565 = _145 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _567 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[5].x, _561);
                float _569 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[4].x, _563);
                float _571 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[6].x, _565);
                float _573 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[5].z, _567);
                float _575 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[4].z, _569);
                float _577 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[6].z, _571);
                float _579 = _573 * _573;
                float _581 = fma(_575, _575, _579);
                float _583 = fma(_577, _577, _581);
                float _585 = rsqrt(_583);
                float _587 = _585 * 9.9999999747524270787835121154785e-07;
                float _589 = _575 * _587;
                float _591 = _573 * _587;
                float _593 = _577 * _587;
                _423 = _591;
                _429 = _589;
                _433 = _593;
            }
        }
    }
    _473 = false;
    float _595 = _423;
    float _597 = _429;
    float _599 = _433;
    bool _601 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _603 = !_601;
    float _605 = _595;
    float _607 = _595;
    float _609 = _597;
    float _611 = _599;
    float _613 = _599;
    float _615 = _595;
    float _633;
    if (!_603)
    {
        float _617 = in.m_53.x;
        float _619 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _621 = _617 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _623 = fma(_621, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _625 = _623 * _619;
        float _627 = floor(_625);
        float _629 = -_627;
        float _631 = _625 + _629;
        _633 = _631;
        _635 = true;
    }
    else
    {
        float _637 = float(_85);
        float _639 = 1.0 / _637;
        float _641 = _119 * _639;
        _633 = _641;
    }
    _635 = false;
    float _643 = _633;
    float _645 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _647 = _643 + _645;
    float _649 = _595 * _595;
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _653 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _651;
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _657 = _655 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _659 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _661 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _659;
    float _663 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _665 = _663 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _669 = _643 + _667;
    float _671 = 1.0 / _653;
    float _673 = fma(_597, _597, _649);
    bool _675 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _677 = isnan(_643);
    bool _679 = _675 || _677;
    bool _681 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _683 = _679 || _681;
    float _685 = float(_683);
    float _687 = as_type<float>(int(gl_VertexIndex));
    bool _689 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _691 = isnan(_643);
    bool _693 = _689 || _691;
    bool _695 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _697 = _693 || _695;
    float _699 = float(_697);
    float _701 = fma(_599, _599, _673);
    bool _703 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _705 = isnan(_643);
    bool _707 = _703 || _705;
    bool _709 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _711 = _707 || _709;
    float _713 = float(_711);
    float _715 = 1.0 / _661;
    float _717 = -_699;
    float _719 = _717 + 1.0;
    float _721 = 1.0 / _657;
    float _723 = _647 * _671;
    float _725 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _727 = _643 + _725;
    float _729 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _731 = _643 + _729;
    float _733 = 1.0 / _665;
    float _735 = _727 * _715;
    float _737 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _739 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _737;
    float _741 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _743 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _741;
    int _745 = as_type<int>(_687) & 1;
    bool _747 = _745 != 0;
    int _749 = as_type<int>(_687) & 2;
    bool _751 = _749 != 0;
    float _753 = fma(_739, _723, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _755 = fma(_743, _723, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _757 = _731 * _721;
    bool _759 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _761 = isnan(_643);
    bool _763 = _759 || _761;
    bool _765 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _767 = _763 || _765;
    float _769 = float(_767);
    float _771 = rsqrt(_701);
    float _773 = -_769;
    float _775 = _773 + 1.0;
    float _777 = _669 * _733;
    bool _779 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _781 = isnan(_643);
    bool _783 = _779 || _781;
    bool _785 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _787 = _783 || _785;
    float _789 = float(_787);
    float _791 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _793 = _791 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _795 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _797 = _795 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _799 = -_789;
    float _801 = _799 + 1.0;
    float _803 = _789 * _775;
    float _805 = fma(_793, _757, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _807 = _713 * _719;
    float _809 = _685 * _801;
    float _811 = -_685;
    float _813 = _811 + 1.0;
    float _815 = _771 * _597;
    float _817 = _753 * _807;
    float _819 = _699 * _813;
    float _821 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _823 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _821;
    float _825 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _827 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _825;
    float _829 = _755 * _807;
    float _831 = -_713;
    float _833 = _831 + 1.0;
    float _835 = fma(_823, _735, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _837 = _771 * _599;
    float _839 = fma(_827, _735, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _841 = _771 * _595;
    float _843 = in.m_51.x;
    float _845 = in.m_51.y;
    float _847 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _849 = _837 * _847;
    float _851 = fma(_797, _757, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _853 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _855 = _841 * _853;
    float _857 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _859 = _815 * _857;
    float _861 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _863 = -_849;
    float _865 = fma(_815, _861, _863);
    float _867 = fma(_833, (*spvDescriptorSet0.vp_c9)._m0[143].x, _817);
    float _869 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _871 = -_855;
    float _873 = fma(_837, _869, _871);
    float _875 = fma(_833, (*spvDescriptorSet0.vp_c9)._m0[143].y, _829);
    float _877 = _865 * _865;
    float _879 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _881 = -_859;
    float _883 = fma(_841, _879, _881);
    float _885 = fma(_805, _819, _867);
    float _887 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _889 = _887 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _891 = fma(_873, _873, _877);
    float _893 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _895 = _893 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _897 = fma(_851, _819, _875);
    float _899 = fma(_889, _777, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _901 = fma(_883, _883, _891);
    float _903 = fma(_835, _809, _885);
    float _905 = fma(_895, _777, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _907 = fma(_839, _809, _897);
    float _909 = rsqrt(_901);
    float _911 = fma(_899, _803, _903);
    float _913 = fma(_905, _803, _907);
    float _915 = _413 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _917 = fma(_769, (*spvDescriptorSet0.vp_c9)._m0[147].x, _911);
    bool _919 = !_751;
    float _921 = _919 ? (-0.5) : 0.5;
    float _923 = fma(_769, (*spvDescriptorSet0.vp_c9)._m0[147].y, _913);
    bool _925 = !_747;
    float _927 = _925 ? (-0.5) : 0.5;
    float _929 = _917 * _843;
    float _931 = fma(_415, (*spvDescriptorSet0.vp_c10)._m0[6].x, _915);
    float _933 = _923 * _845;
    float _935 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _921);
    float _937 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _927);
    float _939 = _929 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _941 = _933 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _943 = _865 * _909;
    float _945 = _883 * _909;
    float _947 = _413 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _949 = _941 * _935;
    float _951 = _939 * _937;
    float _953 = _873 * _909;
    float _955 = fma(_415, (*spvDescriptorSet0.vp_c10)._m0[4].x, _947);
    float _957 = _815 * _943;
    float _959 = _841 * _945;
    float _961 = _949 * _815;
    float _963 = _949 * _837;
    float _965 = -_957;
    float _967 = fma(_841, _953, _965);
    float _969 = -_959;
    float _971 = fma(_837, _943, _969);
    float _973 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _975 = fma(_417, (*spvDescriptorSet0.vp_c10)._m0[4].z, _955);
    float _977 = fma(_417, (*spvDescriptorSet0.vp_c10)._m0[6].z, _931);
    float _979 = fma(_951, _953, _961);
    float _981 = fma(_951, _945, _963);
    float _983 = _975 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _985 = _977 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _987 = fma(_973, _971, _979);
    float _989 = fma(_973, _967, _981);
    float _991 = _413 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _993 = _949 * _841;
    float _995 = _983 + _987;
    float _997 = _985 + _989;
    float _999 = _837 * _953;
    float _1001 = in.m_53.x;
    float _1003 = in.m_53.y;
    float _1005 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1007 = _995 + _1005;
    float _1009 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1011 = _997 + _1009;
    float _1013 = fma(_415, (*spvDescriptorSet0.vp_c10)._m0[5].x, _991);
    float _1015 = fma(_951, _943, _993);
    float _1017 = _1007 * _1007;
    float _1019 = _1011 * _1011;
    float _1021 = -_999;
    float _1023 = fma(_815, _945, _1021);
    float _1025 = fma(_417, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1013);
    float _1027 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1029 = _1017 + _1019;
    float _1031 = fma(_973, _1023, _1015);
    float _1033 = _1025 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1035 = _1033 + _1031;
    float _1037 = sqrt(_1029);
    bool _1039 = _1001 > 0.5;
    float _1041 = -_927;
    float _1043 = _1039 ? _1041 : _927;
    int _1045 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1047 = _1045 != 0;
    bool _1049 = _1037 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _1051 = !_1047;
    float _1053 = _1051 ? _927 : _1043;
    float _1055 = _1031;
    float _1057 = _1043;
    float _1059 = _997;
    float _1061 = _995;
    float _1063 = _701;
    if (!_1049)
    {
        _1055 = _997;
    }
    float _1065 = _1055;
    float _1067 = _1065;
    if (!_1049)
    {
        _1057 = _1019;
    }
    float _1069 = _1057;
    float _1071 = _1069;
    if (!_1049)
    {
        _425 = _1017;
    }
    float _1073 = _425;
    float _1075 = _1073;
    if (!_1049)
    {
        _1059 = _1035;
    }
    float _1077 = _1059;
    bool _1079 = !_1049;
    float _1081 = _1077;
    if (!_1079)
    {
        float _1083 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1085 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1087 = _1037 + _1085;
        float _1089 = _1035 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1091 = rsqrt(_1029);
        float _1093 = _1087 * _1083;
        float _1095 = _1093 * 0.15915493667125701904296875;
        float _1097 = _1095 * 6.283185482025146484375;
        float _1099 = sin(_1097);
        float _1101 = _1095 * 6.283185482025146484375;
        float _1103 = cos(_1101);
        float _1105 = fma(_1099, _1089, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1107 = _1091 * _1105;
        float _1109 = _1103 + (-1.0);
        float _1111 = fma(_1007, _1107, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1113 = fma(_1011, _1107, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1115 = _1109 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1117 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1119 = _1111 + _1117;
        float _1121 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1123 = _1113 + _1121;
        float _1125 = fma(_1035, _1103, _1115);
        float _1127 = _1119 * _1119;
        float _1129 = _1123 * _1123;
        _1081 = _1125;
        _1075 = _1127;
        _1071 = _1129;
        _1061 = _1111;
        _1067 = _1113;
    }
    float _1131 = _1081;
    float _1133 = _1075;
    float _1135 = _1071;
    float _1137 = _1061;
    float _1139 = _1067;
    float _1141 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1143 = _1131 + _1141;
    float _1145 = _1053 + 0.5;
    bool _1147 = _1003 > 0.5;
    float _1149 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1151 = fma(_1143, _1143, _1133);
    float _1153 = _1145 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1155 = _927 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1157 = _1151 + _1135;
    float _1159 = _1153 * _1027;
    float _1161 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _1163 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1165 = _1163 != 0;
    float _1167 = sqrt(_1157);
    float _1169 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1171 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1173 = -_921;
    int _1175 = _1147 ? as_type<int>(_1173) : as_type<int>(_921);
    float _1177 = _1161 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1179 = _1169 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1181 = _1171 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1183 = !_1165;
    float _1185 = _1183 ? _921 : as_type<float>(_1175);
    float _1187 = _921 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    out.m_58.x = _1179;
    out.m_58.y = _1181;
    out.m_58.z = _1177;
    float _1189 = -_1185;
    float _1191 = _1189 + 0.5;
    float _1193 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1195 = _1191 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _1197 = _1167 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1199 = isnan(_1167);
    bool _1201 = _1197 || _1199;
    bool _1203 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1205 = _1201 || _1203;
    float _1207 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1209 = _1195 * _1149;
    float _1211 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1213 = _815 * _1187;
    float _1215 = _841 * _1187;
    float _1217 = _837 * _1187;
    float _1219 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1221 = _1193 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1223 = _1207 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1225 = _1211 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1227 = fma(_953, _1155, _1213);
    float _1229 = fma(_943, _1155, _1215);
    float _1231 = fma(_945, _1155, _1217);
    out.m_60.x = _1159;
    out.m_60.y = _1209;
    out.m_62.x = _1221;
    out.m_62.y = _1223;
    out.m_62.z = _1225;
    out.m_62.w = _1219;
    float _1233 = _1209;
    float _1235 = _1155;
    float _1237 = _1229;
    float _1239 = _1229;
    if (!_1205)
    {
        _1233 = 1.0;
    }
    float _1241 = _1233;
    float _1243 = _971 + _1227;
    float _1245 = _1023 + _1229;
    float _1247 = _967 + _1231;
    bool _1249 = !_1205;
    float _1251 = _1241;
    if (!_1249)
    {
        bool _1253 = _1167 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1255 = isnan(_1167);
        bool _1257 = _1253 || _1255;
        bool _1259 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1261 = _1257 || _1259;
        if (!_1261)
        {
            float _1263 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1265 = _1167 + _1263;
            float _1267 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1269 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1267;
            float _1271 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1273 = _1271 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1275 = 1.0 / _1269;
            float _1277 = _1265 * _1275;
            float _1279 = fma(_1277, _1273, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1251 = _1279;
            _1281 = true;
        }
        else
        {
            bool _1283 = _1167 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1285 = isnan(_1167);
            bool _1287 = _1283 || _1285;
            bool _1289 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1291 = _1287 || _1289;
            if (!_1291)
            {
                float _1293 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1295 = _1167 + _1293;
                float _1297 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1299 = _1297 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1301 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1303 = _1301 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1305 = 1.0 / _1299;
                float _1307 = _1295 * _1305;
                float _1309 = fma(_1307, _1303, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1251 = _1309;
                _1281 = true;
            }
            else
            {
                _1251 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1281 = false;
    float _1311 = _1251;
    float _1313 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1315 = _1131 + _1313;
    float _1317 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1319 = _1137 + _1317;
    float _1321 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1323 = _1139 + _1321;
    float _1325 = fma(_1315, _1311, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1327 = fma(_1319, _1311, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1329 = fma(_1323, _1311, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1331 = -_1033;
    float _1333 = _1331 + _1325;
    float _1335 = -_983;
    float _1337 = _1335 + _1327;
    float _1339 = -_985;
    float _1341 = _1339 + _1329;
    float _1343 = _1333 * _1333;
    float _1345 = fma(_1337, _1337, _1343);
    float _1347 = fma(_1341, _1341, _1345);
    float _1349 = sqrt(_1347);
    bool _1351 = _1349 > 0.0;
    bool _1353 = !_1351;
    float _1355 = _1349;
    float _1357 = _1327;
    float _1359 = _1325;
    float _1361 = _1329;
    float _1363 = _1341;
    float _1365 = _1337;
    if (!_1353)
    {
        bool _1367 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _1369 = _967;
        if (_1367)
        {
            float _1371 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _1369 = _1371;
        }
        float _1373 = _1369;
        if (_1367)
        {
            _1235 = _701;
        }
        float _1375 = _1235;
        float _1377 = _1375;
        if (_1367)
        {
            float _1379 = _1373 * _597;
            _1237 = _1379;
        }
        float _1381 = _1237;
        float _1383 = _1381;
        if (_1367)
        {
            float _1385 = _1373 * _595;
            _1355 = _1385;
        }
        float _1387 = _1355;
        float _1389 = _1387;
        if (_1367)
        {
            float _1391 = _1373 * _599;
            _1063 = _1391;
        }
        float _1393 = _1063;
        float _1395 = _1393;
        if (!_1367)
        {
            float _1397 = _119 + 1.0;
            float _1399 = _1397;
            if (!_159)
            {
                float _1401 = _1397 * _1397;
                float _1403 = _1401 * 0.5;
                _605 = _1403;
            }
            float _1405 = _605;
            float _1407 = _1405;
            if (!_159)
            {
                float _1409 = _1405 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1407 = _1409;
            }
            float _1411 = _1407;
            bool _1413 = !_159;
            float _1415 = _1411;
            if (!_1413)
            {
                float _1417 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1419 = log2(_1417);
                float _1421 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1423 = _1421 + 1.0;
                float _1425 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1427 = _1419 * _1397;
                float _1429 = exp2(_1427);
                float _1431 = _1425 * 0.693147182464599609375;
                float _1433 = 1.0 / _1431;
                float _1435 = 1.0 / _1423;
                float _1437 = _1429 + (-1.0);
                float _1439 = -_1437;
                float _1441 = fma(_1439, _1433, _1397);
                float _1443 = _1441 * _1435;
                float _1445 = _1443 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1415 = _1445;
            }
            float _1447 = _1415;
            float _1449 = _1447 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _1451 = _1447 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _1453 = !_159;
            if (!_1453)
            {
                float _1455 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1457 = log2(_1455);
                float _1459 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1461 = _1459 + 1.0;
                float _1463 = 1.0 / _1461;
                float _1465 = _1457 * _1397;
                float _1467 = exp2(_1465);
                float _1469 = -_1467;
                float _1471 = _1469 + 1.0;
                float _1473 = _1471 * _1463;
                _1399 = _1473;
            }
            float _1475 = _1399;
            float _1477 = fma(_1475, _145, _1451);
            float _1479 = fma(_1475, _143, _1449);
            float _1481 = _1447 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _1483 = -_345;
            float _1485 = _1483 + _1477;
            float _1487 = -_351;
            float _1489 = _1487 + _1479;
            float _1491 = fma(_1475, _147, _1481);
            float _1493 = _1485 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _1495 = _1485 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _1497 = -_357;
            float _1499 = _1497 + _1491;
            float _1501 = _1485 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _1503 = fma(_1489, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1493);
            float _1505 = fma(_1489, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1495);
            float _1507 = fma(_1489, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1501);
            float _1509 = fma(_1499, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1503);
            float _1511 = fma(_1499, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1505);
            float _1513 = fma(_1499, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1507);
            float _1515 = _1509 * _1509;
            float _1517 = fma(_1511, _1511, _1515);
            float _1519 = fma(_1513, _1513, _1517);
            _1377 = _1519;
            _607 = _1509;
            _609 = _1511;
            _611 = _1513;
            _1383 = _1511;
            _1389 = _1509;
            _1395 = _1513;
            _189 = _1507;
        }
        float _1521 = _1377;
        float _1523 = _607;
        float _1525 = _609;
        float _1527 = _611;
        float _1529 = _1383;
        float _1531 = _1389;
        float _1533 = _1395;
        float _1535 = _189;
        float _1537 = sqrt(_1521);
        float _1539 = rsqrt(_1347);
        bool _1541 = _1537 > 0.0;
        float _1543 = _1337 * _1539;
        float _1545 = _1333 * _1539;
        float _1547 = _1341 * _1539;
        bool _1549 = !_1541;
        _613 = _1527;
        _191 = _1535;
        _1365 = _1543;
        _615 = _1523;
        _1239 = _1529;
        if (!_1549)
        {
            float _1551 = rsqrt(_1521);
            float _1553 = _1551 * _1523;
            float _1555 = _1551 * _1525;
            float _1557 = _1545 * _1553;
            float _1559 = _1551 * _1527;
            float _1561 = fma(_1543, _1555, _1557);
            float _1563 = fma(_1547, _1559, _1561);
            float _1565 = _1563 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1567 = fma(_1529, _1565, _1327);
            float _1569 = fma(_1531, _1565, _1325);
            float _1571 = fma(_1533, _1565, _1329);
            _1357 = _1567;
            _1359 = _1569;
            _1361 = _1571;
            _191 = _1559;
            _1363 = _1557;
        }
    }
    float _1573 = _1357;
    float _1575 = _1359;
    float _1577 = _1361;
    float _1579 = _613;
    float _1581 = _191;
    float _1583 = _1363;
    float _1585 = _1365;
    float _1587 = _615;
    float _1589 = _1239;
    bool _1591 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1593 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1595 = _1591 || _1593;
    bool _1597 = isnan(0.5);
    bool _1599 = _1595 || _1597;
    float _1601 = _1581;
    float _1603 = _1579;
    float _1605 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _1607 = _1573;
    float _1609 = _1585;
    float _1611 = _1589;
    if (_1599)
    {
        _1601 = _1573;
    }
    float _1613 = _1601;
    float _1615 = _1613;
    if (_1599)
    {
        _1603 = _1575;
    }
    float _1617 = _1603;
    float _1619 = _1617;
    if (_1599)
    {
        _1605 = _1577;
    }
    float _1621 = _1605;
    float _1623 = _1621;
    if (!_1599)
    {
        float _1625 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1627 = _1033 + _1625;
        float _1629 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1631 = _983 + _1629;
        float _1633 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1635 = -_983;
        float _1637 = _1635 + _1573;
        float _1639 = _1627 * _1627;
        float _1641 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1643 = _985 + _1641;
        float _1645 = -_985;
        float _1647 = _1645 + _1577;
        float _1649 = fma(_1631, _1631, _1639);
        float _1651 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1653 = fma(_1643, _1643, _1649);
        float _1655 = sqrt(_1653);
        float _1657 = _1633 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1659 = precise::min(_1655, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1661 = _1659 * _1651;
        float _1663 = -_1033;
        float _1665 = _1663 + _1575;
        float _1667 = _1657 * _1661;
        float _1669 = fma(_1637, _1667, _983);
        float _1671 = fma(_1665, _1667, _1033);
        float _1673 = fma(_1647, _1667, _985);
        _1619 = _1671;
        _1615 = _1669;
        _1623 = _1673;
        _1607 = _1637;
    }
    float _1675 = _1619;
    float _1677 = _1615;
    float _1679 = _1623;
    float _1681 = _1607;
    float _1683 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1685 = _1675 + _1683;
    float _1687 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1689 = _1677 + _1687;
    float _1691 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1693 = _1679 + _1691;
    float _1695 = _1685 * _1685;
    float _1697 = fma(_1689, _1689, _1695);
    float _1699 = fma(_1693, _1693, _1697);
    float _1701 = rsqrt(_1699);
    float _1703 = sqrt(_1699);
    float _1705 = _1689 * _1701;
    float _1707 = _1693 * _1701;
    float _1709 = _1685 * _1701;
    float _1711 = _1705 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1713 = _1707 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1715 = _1711 * _1711;
    float _1717 = _1713 * _1713;
    float _1719 = _1715 + _1717;
    float _1721 = sqrt(_1719);
    bool _1723 = _1721 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1725 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1727 = _1721 + _1725;
    float _1729 = _1583;
    float _1731 = _1727;
    float _1733 = _1701;
    float _1735 = _1705;
    if (_1723)
    {
        float _1737 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1729 = _1737;
    }
    float _1739 = _1729;
    if (_1723)
    {
        float _1741 = _1727 * _1739;
        _1731 = _1741;
    }
    float _1743 = _1731;
    if (_1723)
    {
        float _1745 = _1743 * 0.15915493667125701904296875;
        _1609 = _1745;
    }
    float _1747 = _1609;
    float _1749 = _1681;
    float _1751 = _1747;
    if (_1723)
    {
        float _1753 = _1747 * 6.283185482025146484375;
        float _1755 = sin(_1753);
        _1749 = _1755;
    }
    float _1757 = _1749;
    float _1759 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1761 = precise::max(0.0, _1759);
    float _1763 = _1587;
    float _1765 = _1761;
    if (_1723)
    {
        float _1767 = _1747 * 6.283185482025146484375;
        float _1769 = cos(_1767);
        _1763 = _1769;
    }
    float _1771 = _1763;
    float _1773 = -_1709;
    float _1775 = -_1761;
    float _1777 = fma(_1773, (*spvDescriptorSet0.vp_c15)._m0[24].y, _1775);
    float _1779 = _1759;
    if (_1723)
    {
        float _1781 = rsqrt(_1719);
        _1779 = _1781;
    }
    float _1783 = _1779;
    if (_1723)
    {
        float _1785 = _1777 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1765 = _1785;
    }
    float _1787 = _1765;
    float _1789 = _1787;
    float _1791 = _1757;
    if (_1723)
    {
        float _1793 = fma(_1757, _1787, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1789 = _1793;
    }
    float _1795 = _1789;
    float _1797 = _1795;
    if (!_1723)
    {
        _1791 = _1711;
    }
    float _1799 = _1791;
    float _1801 = _1799;
    float _1803 = _1771;
    if (_1723)
    {
        float _1805 = _1771 + (-1.0);
        _1733 = _1805;
    }
    float _1807 = _1733;
    float _1809 = _1807;
    if (_1723)
    {
        float _1811 = _1807 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1751 = _1811;
    }
    float _1813 = _1751;
    if (!_1723)
    {
        _1809 = _1715;
    }
    float _1815 = _1809;
    float _1817 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1819 = _1783;
    float _1821 = _1815;
    if (_1723)
    {
        float _1823 = _1783 * _1795;
        _1611 = _1823;
    }
    float _1825 = _1611;
    if (!_1723)
    {
        _1797 = _1777;
    }
    float _1827 = _1797;
    float _1829 = _1827;
    if (_1723)
    {
        float _1831 = fma(_1777, _1771, _1813);
        _1829 = _1831;
    }
    float _1833 = _1829;
    if (!_1723)
    {
        _1819 = _1713;
    }
    float _1835 = _1819;
    float _1837 = _1835;
    if (_1723)
    {
        float _1839 = _1711 * _1825;
        _1801 = _1839;
    }
    float _1841 = _1801;
    if (_1723)
    {
        float _1843 = _1713 * _1825;
        _1837 = _1843;
    }
    float _1845 = _1837;
    if (!_1723)
    {
        _1803 = _1717;
    }
    float _1847 = _1803;
    float _1849 = _1675 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1851 = _1847;
    if (_1723)
    {
        float _1853 = _1841 * _1841;
        _1821 = _1853;
    }
    float _1855 = _1821;
    if (_1723)
    {
        float _1857 = _1845 * _1845;
        _1851 = _1857;
    }
    float _1859 = _1851;
    float _1861 = fma(_1833, _1833, _1855);
    float _1863 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1865 = fma(_1703, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1863);
    float _1867 = precise::clamp(_1865, 0.0, 1.0);
    float _1869 = _1861 + _1859;
    float _1871 = _1675 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1873 = -_1867;
    float _1875 = _1873 + 1.0;
    float _1877 = rsqrt(_1869);
    float _1879 = fma(_1677, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1871);
    float _1881 = _1675 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1883 = _1675 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1885 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1879);
    float _1887 = fma(_1677, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1881);
    float _1889 = fma(_1677, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1883);
    float _1891 = abs(_1875);
    float _1893 = log2(_1891);
    float _1895 = _1885 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1897 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1887);
    float _1899 = fma(_1677, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1849);
    float _1901 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1889);
    float _1903 = _1895 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1905 = _1897 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1907 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1899);
    float _1909 = _1877 * _1841;
    float _1911 = _1877 * _1833;
    float _1913 = -_1903;
    float _1915 = fma(_1913, _1817, 1.0);
    float _1917 = _1901 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1919 = _1909 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1921 = _1905 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1923 = _1877 * _1845;
    float _1925 = _1907 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1927 = -_1919;
    float _1929 = fma(_1911, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1927);
    float _1931 = fma(_1917, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1921);
    float _1933 = _1893 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1935 = log2(_1915);
    float _1937 = -_1923;
    float _1939 = fma(_1937, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1929);
    float _1941 = fma(_1895, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1931);
    float _1943 = _1905 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1945 = _1905 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1947 = fma(_1939, -0.5, 0.5);
    float _1949 = fma(_1925, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1941);
    float _1951 = exp2(_1933);
    float _1953 = fma(_1939, 0.5, 0.5);
    float _1955 = fma(_1917, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1943);
    float _1957 = fma(_1917, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1945);
    float _1959 = _1911 + 1.0;
    float _1961 = fma(_1895, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1955);
    float _1963 = fma(_1895, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1957);
    float _1965 = 1.0 / _1949;
    float _1967 = fma(_1953, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1969 = _1935 * 0.693147182464599609375;
    float _1971 = fma(_1953, _1967, -0.212114393711090087890625);
    float _1973 = _1969 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1975 = sqrt(_1947);
    float _1977 = -_1911;
    float _1979 = fma(_1951, _1959, _1977);
    float _1981 = fma(_1925, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1961);
    float _1983 = fma(_1925, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1963);
    float _1985 = fma(_1953, _1971, 1.570728778839111328125);
    float _1987 = fma(_1979, 0.5, 0.5);
    float _1989 = _1981 * _1965;
    float _1991 = _1983 * _1965;
    float _1993 = fma(_1989, 0.5, 0.5);
    float _1995 = fma(_1991, -0.5, 0.5);
    float _1997 = _1975 * 0.636619746685028076171875;
    float _1999 = -_1985;
    float _2001 = fma(_1997, _1999, 1.0);
    float3 _5340 = float3(_1993, _1995, _1973);
    float _2003 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5340, float3(0.0), isnan(_5340)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5340, float3(0.0), isnan(_5340)), level(0.0)).x;
    float3 _5351 = float3(_1993, _1995, _1973);
    float4 _2006 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5351, float3(0.0), isnan(_5351)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5351, float3(0.0), isnan(_5351)), level(0.0)).xyzw;
    float _2008 = _2006.x;
    float _2010 = _2006.y;
    float _2012 = _2006.z;
    float _2014 = _2006.w;
    float2 _5368 = float2(_2001, _1987);
    float3 _2018 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5368, float2(0.0), isnan(_5368)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5368, float2(0.0), isnan(_5368)), level(0.0)).xyz;
    float _2020 = _2018.x;
    float _2022 = _2018.y;
    float _2024 = _2018.z;
    float _2026 = _1033 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2028 = _1245 * _1709;
    float _2030 = _1033 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2032 = fma(_983, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2026);
    float _2034 = -(*spvDescriptorSet0.vp_c9)._m0[139].z;
    float _2036 = (*spvDescriptorSet0.vp_c9)._m0[139].w + _2034;
    float _2038 = fma(_1243, _1705, _2028);
    float _2040 = fma(_985, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2032);
    float _2042 = fma(_983, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2030);
    float _2044 = _1905 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2046 = fma(_1247, _1707, _2038);
    float _2048 = _2040 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2050 = 1.0 / _2036;
    float _2052 = _1893 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2054 = fma(_985, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2042);
    float _2056 = fma(_1917, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2044);
    bool _2058 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2060 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2062 = _2058 || _2060;
    bool _2064 = isnan(0.5);
    bool _2066 = _2062 || _2064;
    float _2068 = abs(_2046);
    float _2070 = -(*spvDescriptorSet0.vp_c9)._m0[139].z;
    float _2072 = _2068 + _2070;
    float _2074 = _2054 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2076 = 1.0 / _2048;
    float _2078 = fma(_1895, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2056);
    float _2080 = _2074 + _2048;
    float _2082 = fma(_1925, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2078);
    float _2084 = exp2(_2052);
    float _2086 = _2072 * _2050;
    float _2088 = precise::clamp(_2086, 0.0, 1.0);
    if (_2066)
    {
        _1735 = 1.0;
    }
    float _2090 = _1735;
    float _2092 = _2088 * _2088;
    float _2094 = _2080 * _2076;
    float _2096 = _2094 * 0.5;
    float _2098 = fma(_2088, -2.0, 3.0);
    float _2100 = _2090;
    if (!_2066)
    {
        float _2102 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2104 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2106 = fma(_2096, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2104);
        float _2108 = _2102 * 0.15915493667125701904296875;
        float _2110 = _2108 * 6.283185482025146484375;
        float _2112 = cos(_2110);
        float _2114 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2116 = _2114 * 0.15915493667125701904296875;
        float _2118 = _2108 * 6.283185482025146484375;
        float _2120 = sin(_2118);
        float _2122 = 1.0 / _2112;
        float _2124 = _2116 * 6.283185482025146484375;
        float _2126 = cos(_2124);
        float _2128 = _2120 * _2122;
        float _2130 = 1.0 / _2106;
        float _2132 = _2126 * _2128;
        float _2134 = _2116 * 6.283185482025146484375;
        float _2136 = sin(_2134);
        float _2138 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2140 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2138;
        float _2142 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2144 = _2130 * _2142;
        float _2146 = 1.0 / _2132;
        float _2148 = 1.0 / _2140;
        float _2150 = _2136 * _2146;
        float _2152 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2154 = fma(_2150, _2144, _2152);
        float _2156 = _2154 * _2148;
        float _2158 = precise::clamp(_2156, 0.0, 1.0);
        _2100 = _2158;
    }
    float _2160 = _2100;
    float _2162 = -_2084;
    float _2164 = _2162 + 1.0;
    float _2166 = _2092 * _2098;
    float _2168 = _1949 * 0.5;
    bool _2170 = _2160 > 0.0;
    bool _2172 = isnan(_2160);
    bool _2174 = _2170 || _2172;
    bool _2176 = isnan(0.0);
    bool _2178 = _2174 || _2176;
    float _2180 = _2164 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2182 = _2166 * _2160;
    float _2184 = fma(_1983, -0.5, _2168);
    float _2186 = _2082 + _1949;
    float _2188 = _2180 * _2003;
    float _2190 = _1981 + _1949;
    float _2192 = _2182 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.gl_Position.x = _1981;
    out.gl_Position.y = _1983;
    out.gl_Position.z = _2082;
    out.gl_Position.w = _1949;
    float _2194 = _2014 * _2188;
    float _2196 = _2024 * _2188;
    float _2198 = -_2180;
    float _2200 = _2198 + 1.0;
    float _2202 = _2186 * 0.5;
    float _2204 = _2190 * 0.5;
    float _2206 = _2014 * _2200;
    float _2208 = _2192 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2210 = fma(_2020, _2194, _2008);
    float _2212 = fma(_2022, _2194, _2010);
    float _2214 = fma(_2014, _2196, _2012);
    out.m_64.x = _2204;
    out.m_64.y = _2184;
    out.m_64.z = _2202;
    out.m_64.w = _1949;
    out.m_47.x = _2208;
    out.m_66.x = _2210;
    out.m_66.y = _2212;
    out.m_66.z = _2214;
    out.m_66.w = _2206;
    if (_2178)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _2216 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2216;
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
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1281 = false;
    bool _635 = false;
    bool _473 = false;
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
        float _2273 = as_type<float>(_101);
        out.gl_Position.z = _2273;
    }
    if (!_89)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        out.m_47.x = 0.0;
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
        float _2344 = as_type<float>(_139);
        out.gl_Position.z = _2344;
    }
    if (_131)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _143 = in.m_49.x;
    float _145 = in.m_49.y;
    float _147 = in.m_49.z;
    float _149 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _151 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _153 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _155 = _151 || _153;
    bool _157 = isnan(1.0);
    bool _159 = _155 || _157;
    float _161 = _149;
    if (!_159)
    {
        float _163 = _149 * _149;
        float _165 = _163 * 0.5;
        _141 = _165;
    }
    float _167 = _141;
    float _169 = 0.0;
    float _171 = _167;
    if (!_159)
    {
        float _173 = _119 * _119;
        float _175 = _173 * 0.5;
        _169 = _175;
    }
    float _177 = _169;
    if (!_159)
    {
        float _179 = _167 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _171 = _179;
    }
    float _181 = _171;
    bool _183 = !_159;
    float _185 = _181;
    float _187 = 0.0;
    float _189 = _145;
    float _191 = _145;
    if (!_183)
    {
        float _193 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _195 = log2(_193);
        float _197 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _199 = _197 + 1.0;
        float _201 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _203 = _149 * _195;
        float _205 = 1.0 / _199;
        float _207 = _201 * 0.693147182464599609375;
        float _209 = exp2(_203);
        float _211 = 1.0 / _207;
        float _213 = _209 + (-1.0);
        float _215 = -_213;
        float _217 = fma(_215, _211, _149);
        float _219 = _217 * _205;
        float _221 = _219 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _121 = _209;
        _185 = _221;
        _187 = _211;
    }
    float _223 = _121;
    float _225 = _185;
    float _227 = _187;
    bool _229 = !_159;
    float _231 = _223;
    float _233 = _227;
    if (!_229)
    {
        float _235 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _237 = log2(_235);
        float _239 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _241 = _239 + 1.0;
        float _243 = 1.0 / _241;
        float _245 = _149 * _237;
        float _247 = exp2(_245);
        float _249 = -_247;
        float _251 = _249 + 1.0;
        float _253 = _251 * _243;
        _231 = _247;
        _233 = _241;
        _161 = _253;
    }
    float _255 = _231;
    float _257 = _233;
    float _259 = _161;
    float _261 = _257;
    float _263 = _255;
    if (!_159)
    {
        _261 = _119;
    }
    float _265 = _261;
    float _267 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _269 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _271 = _265;
    if (!_159)
    {
        float _273 = _177 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _263 = _273;
    }
    float _275 = _263;
    bool _277 = !_159;
    float _279 = _275;
    if (!_277)
    {
        float _281 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _283 = log2(_281);
        float _285 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _287 = _285 + 1.0;
        float _289 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _291 = _119 * _283;
        float _293 = 1.0 / _287;
        float _295 = _289 * 0.693147182464599609375;
        float _297 = exp2(_291);
        float _299 = 1.0 / _295;
        float _301 = _297 + (-1.0);
        float _303 = -_301;
        float _305 = fma(_303, _299, _119);
        float _307 = _305 * _293;
        float _309 = _307 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _279 = _309;
    }
    float _311 = _279;
    bool _313 = !_159;
    if (!_313)
    {
        float _315 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _317 = log2(_315);
        float _319 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _321 = _319 + 1.0;
        float _323 = 1.0 / _321;
        float _325 = _119 * _317;
        float _327 = exp2(_325);
        float _329 = -_327;
        float _331 = _329 + 1.0;
        float _333 = _331 * _323;
        _271 = _333;
    }
    float _335 = _271;
    float _337 = _311 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _339 = fma(_259, _145, _269);
    float _341 = _311 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _343 = _311 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _345 = fma(_335, _145, _337);
    float _347 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _349 = fma(_259, _143, _267);
    float _351 = fma(_335, _143, _341);
    float _353 = -_345;
    float _355 = _339 + _353;
    float _357 = fma(_335, _147, _343);
    float _359 = fma(_259, _147, _347);
    float _361 = -_351;
    float _363 = _349 + _361;
    float _365 = _355 * _355;
    float _367 = in.m_51.w;
    float _369 = -_357;
    float _371 = _359 + _369;
    float _373 = _355 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _375 = fma(_363, _363, _365);
    float _377 = _355 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _379 = _355 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _381 = fma(_363, (*spvDescriptorSet0.vp_c10)._m0[4].x, _373);
    float _383 = fma(_371, _371, _375);
    float _385 = fma(_363, (*spvDescriptorSet0.vp_c10)._m0[5].x, _377);
    float _387 = in.m_44.x;
    float _389 = in.m_44.y;
    float _391 = in.m_44.z;
    float _393 = fma(_363, (*spvDescriptorSet0.vp_c10)._m0[6].x, _379);
    float _395 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[4].z, _381);
    float _397 = sqrt(_383);
    bool _399 = _397 >= 9.9999999747524270787835121154785e-07;
    bool _401 = isnan(_397);
    bool _403 = _399 || _401;
    bool _405 = isnan(9.9999999747524270787835121154785e-07);
    bool _407 = _403 || _405;
    float _409 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[5].z, _385);
    float _411 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[6].z, _393);
    float _413 = fma(_339, _367, _389);
    float _415 = fma(_349, _367, _387);
    float _417 = fma(_359, _367, _391);
    float _419 = _339;
    float _421 = _395;
    float _423 = _409;
    float _425 = _417;
    if (_407)
    {
        _419 = _395;
    }
    float _427 = _419;
    float _429 = _427;
    if (_407)
    {
        _421 = _411;
    }
    float _431 = _421;
    float _433 = _431;
    if (!_407)
    {
        bool _435 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _437 = !_435;
        if (!_437)
        {
            float _439 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _441 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _443 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _445 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _439);
            float _447 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _441);
            float _449 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _443);
            float _451 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _445);
            float _453 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _447);
            float _455 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _449);
            float _457 = _451 * _451;
            float _459 = fma(_453, _453, _457);
            float _461 = fma(_455, _455, _459);
            float _463 = rsqrt(_461);
            float _465 = _463 * 9.9999999747524270787835121154785e-07;
            float _467 = _453 * _465;
            float _469 = _451 * _465;
            float _471 = _455 * _465;
            _423 = _469;
            _429 = _467;
            _433 = _471;
            _473 = true;
        }
        else
        {
            float _475 = _145 * _145;
            float _477 = fma(_143, _143, _475);
            float _479 = fma(_147, _147, _477);
            float _481 = sqrt(_479);
            bool _483 = _481 >= 9.9999999747524270787835121154785e-07;
            bool _485 = isnan(_481);
            bool _487 = _483 || _485;
            bool _489 = isnan(9.9999999747524270787835121154785e-07);
            bool _491 = _487 || _489;
            if (!_491)
            {
                float _493 = _389 * _389;
                float _495 = fma(_387, _387, _493);
                float _497 = fma(_391, _391, _495);
                float _499 = sqrt(_497);
                bool _501 = _499 >= 9.9999999747524270787835121154785e-07;
                bool _503 = isnan(_499);
                bool _505 = _501 || _503;
                bool _507 = isnan(9.9999999747524270787835121154785e-07);
                bool _509 = _505 || _507;
                if (!_509)
                {
                    float _511 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _513 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _511);
                    float _515 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _513);
                    float _517 = rsqrt(_515);
                    float _519 = _517 * 9.9999999747524270787835121154785e-07;
                    float _521 = _519 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _523 = _519 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _525 = _519 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _423 = _523;
                    _429 = _521;
                    _433 = _525;
                    _473 = true;
                }
                else
                {
                    float _527 = _389 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _529 = _389 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _531 = _389 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _533 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[5].x, _527);
                    float _535 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[4].x, _529);
                    float _537 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[6].x, _531);
                    float _539 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[5].z, _533);
                    float _541 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[4].z, _535);
                    float _543 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[6].z, _537);
                    float _545 = _539 * _539;
                    float _547 = fma(_541, _541, _545);
                    float _549 = fma(_543, _543, _547);
                    float _551 = rsqrt(_549);
                    float _553 = _551 * 9.9999999747524270787835121154785e-07;
                    float _555 = _541 * _553;
                    float _557 = _539 * _553;
                    float _559 = _543 * _553;
                    _423 = _557;
                    _429 = _555;
                    _433 = _559;
                    _473 = true;
                }
            }
            else
            {
                float _561 = _145 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _563 = _145 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _565 = _145 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _567 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[5].x, _561);
                float _569 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[4].x, _563);
                float _571 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[6].x, _565);
                float _573 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[5].z, _567);
                float _575 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[4].z, _569);
                float _577 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[6].z, _571);
                float _579 = _573 * _573;
                float _581 = fma(_575, _575, _579);
                float _583 = fma(_577, _577, _581);
                float _585 = rsqrt(_583);
                float _587 = _585 * 9.9999999747524270787835121154785e-07;
                float _589 = _575 * _587;
                float _591 = _573 * _587;
                float _593 = _577 * _587;
                _423 = _591;
                _429 = _589;
                _433 = _593;
            }
        }
    }
    _473 = false;
    float _595 = _423;
    float _597 = _429;
    float _599 = _433;
    bool _601 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _603 = !_601;
    float _605 = _595;
    float _607 = _595;
    float _609 = _597;
    float _611 = _599;
    float _613 = _599;
    float _615 = _595;
    float _633;
    if (!_603)
    {
        float _617 = in.m_53.x;
        float _619 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _621 = _617 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _623 = fma(_621, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _625 = _623 * _619;
        float _627 = floor(_625);
        float _629 = -_627;
        float _631 = _625 + _629;
        _633 = _631;
        _635 = true;
    }
    else
    {
        float _637 = float(_85);
        float _639 = 1.0 / _637;
        float _641 = _119 * _639;
        _633 = _641;
    }
    _635 = false;
    float _643 = _633;
    float _645 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _647 = _643 + _645;
    float _649 = _595 * _595;
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _653 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _651;
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _657 = _655 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _659 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _661 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _659;
    float _663 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _665 = _663 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _669 = _643 + _667;
    float _671 = 1.0 / _653;
    float _673 = fma(_597, _597, _649);
    bool _675 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _677 = isnan(_643);
    bool _679 = _675 || _677;
    bool _681 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _683 = _679 || _681;
    float _685 = float(_683);
    float _687 = as_type<float>(int(gl_VertexIndex));
    bool _689 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _691 = isnan(_643);
    bool _693 = _689 || _691;
    bool _695 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _697 = _693 || _695;
    float _699 = float(_697);
    float _701 = fma(_599, _599, _673);
    bool _703 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _705 = isnan(_643);
    bool _707 = _703 || _705;
    bool _709 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _711 = _707 || _709;
    float _713 = float(_711);
    float _715 = 1.0 / _661;
    float _717 = -_699;
    float _719 = _717 + 1.0;
    float _721 = 1.0 / _657;
    float _723 = _647 * _671;
    float _725 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _727 = _643 + _725;
    float _729 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _731 = _643 + _729;
    float _733 = 1.0 / _665;
    float _735 = _727 * _715;
    float _737 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _739 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _737;
    float _741 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _743 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _741;
    int _745 = as_type<int>(_687) & 1;
    bool _747 = _745 != 0;
    int _749 = as_type<int>(_687) & 2;
    bool _751 = _749 != 0;
    float _753 = fma(_739, _723, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _755 = fma(_743, _723, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _757 = _731 * _721;
    bool _759 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _761 = isnan(_643);
    bool _763 = _759 || _761;
    bool _765 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _767 = _763 || _765;
    float _769 = float(_767);
    float _771 = rsqrt(_701);
    float _773 = -_769;
    float _775 = _773 + 1.0;
    float _777 = _669 * _733;
    bool _779 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _781 = isnan(_643);
    bool _783 = _779 || _781;
    bool _785 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _787 = _783 || _785;
    float _789 = float(_787);
    float _791 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _793 = _791 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _795 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _797 = _795 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _799 = -_789;
    float _801 = _799 + 1.0;
    float _803 = _789 * _775;
    float _805 = fma(_793, _757, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _807 = _713 * _719;
    float _809 = _685 * _801;
    float _811 = -_685;
    float _813 = _811 + 1.0;
    float _815 = _771 * _597;
    float _817 = _753 * _807;
    float _819 = _699 * _813;
    float _821 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _823 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _821;
    float _825 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _827 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _825;
    float _829 = _755 * _807;
    float _831 = -_713;
    float _833 = _831 + 1.0;
    float _835 = fma(_823, _735, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _837 = _771 * _599;
    float _839 = fma(_827, _735, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _841 = _771 * _595;
    float _843 = in.m_51.x;
    float _845 = in.m_51.y;
    float _847 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _849 = _837 * _847;
    float _851 = fma(_797, _757, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _853 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _855 = _841 * _853;
    float _857 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _859 = _815 * _857;
    float _861 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _863 = -_849;
    float _865 = fma(_815, _861, _863);
    float _867 = fma(_833, (*spvDescriptorSet0.vp_c9)._m0[143].x, _817);
    float _869 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _871 = -_855;
    float _873 = fma(_837, _869, _871);
    float _875 = fma(_833, (*spvDescriptorSet0.vp_c9)._m0[143].y, _829);
    float _877 = _865 * _865;
    float _879 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _881 = -_859;
    float _883 = fma(_841, _879, _881);
    float _885 = fma(_805, _819, _867);
    float _887 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _889 = _887 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _891 = fma(_873, _873, _877);
    float _893 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _895 = _893 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _897 = fma(_851, _819, _875);
    float _899 = fma(_889, _777, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _901 = fma(_883, _883, _891);
    float _903 = fma(_835, _809, _885);
    float _905 = fma(_895, _777, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _907 = fma(_839, _809, _897);
    float _909 = rsqrt(_901);
    float _911 = fma(_899, _803, _903);
    float _913 = fma(_905, _803, _907);
    float _915 = _413 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _917 = fma(_769, (*spvDescriptorSet0.vp_c9)._m0[147].x, _911);
    bool _919 = !_751;
    float _921 = _919 ? (-0.5) : 0.5;
    float _923 = fma(_769, (*spvDescriptorSet0.vp_c9)._m0[147].y, _913);
    bool _925 = !_747;
    float _927 = _925 ? (-0.5) : 0.5;
    float _929 = _917 * _843;
    float _931 = fma(_415, (*spvDescriptorSet0.vp_c10)._m0[6].x, _915);
    float _933 = _923 * _845;
    float _935 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _921);
    float _937 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _927);
    float _939 = _929 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _941 = _933 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _943 = _865 * _909;
    float _945 = _883 * _909;
    float _947 = _413 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _949 = _941 * _935;
    float _951 = _939 * _937;
    float _953 = _873 * _909;
    float _955 = fma(_415, (*spvDescriptorSet0.vp_c10)._m0[4].x, _947);
    float _957 = _815 * _943;
    float _959 = _841 * _945;
    float _961 = _949 * _815;
    float _963 = _949 * _837;
    float _965 = -_957;
    float _967 = fma(_841, _953, _965);
    float _969 = -_959;
    float _971 = fma(_837, _943, _969);
    float _973 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _975 = fma(_417, (*spvDescriptorSet0.vp_c10)._m0[4].z, _955);
    float _977 = fma(_417, (*spvDescriptorSet0.vp_c10)._m0[6].z, _931);
    float _979 = fma(_951, _953, _961);
    float _981 = fma(_951, _945, _963);
    float _983 = _975 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _985 = _977 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _987 = fma(_973, _971, _979);
    float _989 = fma(_973, _967, _981);
    float _991 = _413 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _993 = _949 * _841;
    float _995 = _983 + _987;
    float _997 = _985 + _989;
    float _999 = _837 * _953;
    float _1001 = in.m_53.x;
    float _1003 = in.m_53.y;
    float _1005 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1007 = _995 + _1005;
    float _1009 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1011 = _997 + _1009;
    float _1013 = fma(_415, (*spvDescriptorSet0.vp_c10)._m0[5].x, _991);
    float _1015 = fma(_951, _943, _993);
    float _1017 = _1007 * _1007;
    float _1019 = _1011 * _1011;
    float _1021 = -_999;
    float _1023 = fma(_815, _945, _1021);
    float _1025 = fma(_417, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1013);
    float _1027 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1029 = _1017 + _1019;
    float _1031 = fma(_973, _1023, _1015);
    float _1033 = _1025 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1035 = _1033 + _1031;
    float _1037 = sqrt(_1029);
    bool _1039 = _1001 > 0.5;
    float _1041 = -_927;
    float _1043 = _1039 ? _1041 : _927;
    int _1045 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1047 = _1045 != 0;
    bool _1049 = _1037 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _1051 = !_1047;
    float _1053 = _1051 ? _927 : _1043;
    float _1055 = _1031;
    float _1057 = _1043;
    float _1059 = _997;
    float _1061 = _995;
    float _1063 = _701;
    if (!_1049)
    {
        _1055 = _997;
    }
    float _1065 = _1055;
    float _1067 = _1065;
    if (!_1049)
    {
        _1057 = _1019;
    }
    float _1069 = _1057;
    float _1071 = _1069;
    if (!_1049)
    {
        _425 = _1017;
    }
    float _1073 = _425;
    float _1075 = _1073;
    if (!_1049)
    {
        _1059 = _1035;
    }
    float _1077 = _1059;
    bool _1079 = !_1049;
    float _1081 = _1077;
    if (!_1079)
    {
        float _1083 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1085 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1087 = _1037 + _1085;
        float _1089 = _1035 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1091 = rsqrt(_1029);
        float _1093 = _1087 * _1083;
        float _1095 = _1093 * 0.15915493667125701904296875;
        float _1097 = _1095 * 6.283185482025146484375;
        float _1099 = sin(_1097);
        float _1101 = _1095 * 6.283185482025146484375;
        float _1103 = cos(_1101);
        float _1105 = fma(_1099, _1089, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1107 = _1091 * _1105;
        float _1109 = _1103 + (-1.0);
        float _1111 = fma(_1007, _1107, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1113 = fma(_1011, _1107, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1115 = _1109 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1117 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1119 = _1111 + _1117;
        float _1121 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1123 = _1113 + _1121;
        float _1125 = fma(_1035, _1103, _1115);
        float _1127 = _1119 * _1119;
        float _1129 = _1123 * _1123;
        _1081 = _1125;
        _1075 = _1127;
        _1071 = _1129;
        _1061 = _1111;
        _1067 = _1113;
    }
    float _1131 = _1081;
    float _1133 = _1075;
    float _1135 = _1071;
    float _1137 = _1061;
    float _1139 = _1067;
    float _1141 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1143 = _1131 + _1141;
    float _1145 = _1053 + 0.5;
    bool _1147 = _1003 > 0.5;
    float _1149 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1151 = fma(_1143, _1143, _1133);
    float _1153 = _1145 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1155 = _927 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1157 = _1151 + _1135;
    float _1159 = _1153 * _1027;
    float _1161 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _1163 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1165 = _1163 != 0;
    float _1167 = sqrt(_1157);
    float _1169 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1171 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1173 = -_921;
    int _1175 = _1147 ? as_type<int>(_1173) : as_type<int>(_921);
    float _1177 = _1161 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1179 = _1169 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1181 = _1171 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1183 = !_1165;
    float _1185 = _1183 ? _921 : as_type<float>(_1175);
    float _1187 = _921 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    out.m_58.x = _1179;
    out.m_58.y = _1181;
    out.m_58.z = _1177;
    float _1189 = -_1185;
    float _1191 = _1189 + 0.5;
    float _1193 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1195 = _1191 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _1197 = _1167 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1199 = isnan(_1167);
    bool _1201 = _1197 || _1199;
    bool _1203 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1205 = _1201 || _1203;
    float _1207 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1209 = _1195 * _1149;
    float _1211 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1213 = _815 * _1187;
    float _1215 = _841 * _1187;
    float _1217 = _837 * _1187;
    float _1219 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1221 = _1193 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1223 = _1207 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1225 = _1211 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1227 = fma(_953, _1155, _1213);
    float _1229 = fma(_943, _1155, _1215);
    float _1231 = fma(_945, _1155, _1217);
    out.m_60.x = _1159;
    out.m_60.y = _1209;
    out.m_62.x = _1221;
    out.m_62.y = _1223;
    out.m_62.z = _1225;
    out.m_62.w = _1219;
    float _1233 = _1209;
    float _1235 = _1155;
    float _1237 = _1229;
    float _1239 = _1229;
    if (!_1205)
    {
        _1233 = 1.0;
    }
    float _1241 = _1233;
    float _1243 = _971 + _1227;
    float _1245 = _1023 + _1229;
    float _1247 = _967 + _1231;
    bool _1249 = !_1205;
    float _1251 = _1241;
    if (!_1249)
    {
        bool _1253 = _1167 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1255 = isnan(_1167);
        bool _1257 = _1253 || _1255;
        bool _1259 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1261 = _1257 || _1259;
        if (!_1261)
        {
            float _1263 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1265 = _1167 + _1263;
            float _1267 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1269 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1267;
            float _1271 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1273 = _1271 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1275 = 1.0 / _1269;
            float _1277 = _1265 * _1275;
            float _1279 = fma(_1277, _1273, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1251 = _1279;
            _1281 = true;
        }
        else
        {
            bool _1283 = _1167 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1285 = isnan(_1167);
            bool _1287 = _1283 || _1285;
            bool _1289 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1291 = _1287 || _1289;
            if (!_1291)
            {
                float _1293 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1295 = _1167 + _1293;
                float _1297 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1299 = _1297 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1301 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1303 = _1301 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1305 = 1.0 / _1299;
                float _1307 = _1295 * _1305;
                float _1309 = fma(_1307, _1303, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1251 = _1309;
                _1281 = true;
            }
            else
            {
                _1251 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1281 = false;
    float _1311 = _1251;
    float _1313 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1315 = _1131 + _1313;
    float _1317 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1319 = _1137 + _1317;
    float _1321 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1323 = _1139 + _1321;
    float _1325 = fma(_1315, _1311, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1327 = fma(_1319, _1311, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1329 = fma(_1323, _1311, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1331 = -_1033;
    float _1333 = _1331 + _1325;
    float _1335 = -_983;
    float _1337 = _1335 + _1327;
    float _1339 = -_985;
    float _1341 = _1339 + _1329;
    float _1343 = _1333 * _1333;
    float _1345 = fma(_1337, _1337, _1343);
    float _1347 = fma(_1341, _1341, _1345);
    float _1349 = sqrt(_1347);
    bool _1351 = _1349 > 0.0;
    bool _1353 = !_1351;
    float _1355 = _1349;
    float _1357 = _1327;
    float _1359 = _1325;
    float _1361 = _1329;
    float _1363 = _1341;
    float _1365 = _1337;
    if (!_1353)
    {
        bool _1367 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _1369 = _967;
        if (_1367)
        {
            float _1371 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _1369 = _1371;
        }
        float _1373 = _1369;
        if (_1367)
        {
            _1235 = _701;
        }
        float _1375 = _1235;
        float _1377 = _1375;
        if (_1367)
        {
            float _1379 = _1373 * _597;
            _1237 = _1379;
        }
        float _1381 = _1237;
        float _1383 = _1381;
        if (_1367)
        {
            float _1385 = _1373 * _595;
            _1355 = _1385;
        }
        float _1387 = _1355;
        float _1389 = _1387;
        if (_1367)
        {
            float _1391 = _1373 * _599;
            _1063 = _1391;
        }
        float _1393 = _1063;
        float _1395 = _1393;
        if (!_1367)
        {
            float _1397 = _119 + 1.0;
            float _1399 = _1397;
            if (!_159)
            {
                float _1401 = _1397 * _1397;
                float _1403 = _1401 * 0.5;
                _605 = _1403;
            }
            float _1405 = _605;
            float _1407 = _1405;
            if (!_159)
            {
                float _1409 = _1405 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1407 = _1409;
            }
            float _1411 = _1407;
            bool _1413 = !_159;
            float _1415 = _1411;
            if (!_1413)
            {
                float _1417 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1419 = log2(_1417);
                float _1421 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1423 = _1421 + 1.0;
                float _1425 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1427 = _1419 * _1397;
                float _1429 = exp2(_1427);
                float _1431 = _1425 * 0.693147182464599609375;
                float _1433 = 1.0 / _1431;
                float _1435 = 1.0 / _1423;
                float _1437 = _1429 + (-1.0);
                float _1439 = -_1437;
                float _1441 = fma(_1439, _1433, _1397);
                float _1443 = _1441 * _1435;
                float _1445 = _1443 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1415 = _1445;
            }
            float _1447 = _1415;
            float _1449 = _1447 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _1451 = _1447 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _1453 = !_159;
            if (!_1453)
            {
                float _1455 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1457 = log2(_1455);
                float _1459 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1461 = _1459 + 1.0;
                float _1463 = 1.0 / _1461;
                float _1465 = _1457 * _1397;
                float _1467 = exp2(_1465);
                float _1469 = -_1467;
                float _1471 = _1469 + 1.0;
                float _1473 = _1471 * _1463;
                _1399 = _1473;
            }
            float _1475 = _1399;
            float _1477 = fma(_1475, _145, _1451);
            float _1479 = fma(_1475, _143, _1449);
            float _1481 = _1447 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _1483 = -_345;
            float _1485 = _1483 + _1477;
            float _1487 = -_351;
            float _1489 = _1487 + _1479;
            float _1491 = fma(_1475, _147, _1481);
            float _1493 = _1485 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _1495 = _1485 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _1497 = -_357;
            float _1499 = _1497 + _1491;
            float _1501 = _1485 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _1503 = fma(_1489, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1493);
            float _1505 = fma(_1489, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1495);
            float _1507 = fma(_1489, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1501);
            float _1509 = fma(_1499, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1503);
            float _1511 = fma(_1499, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1505);
            float _1513 = fma(_1499, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1507);
            float _1515 = _1509 * _1509;
            float _1517 = fma(_1511, _1511, _1515);
            float _1519 = fma(_1513, _1513, _1517);
            _1377 = _1519;
            _607 = _1509;
            _609 = _1511;
            _611 = _1513;
            _1383 = _1511;
            _1389 = _1509;
            _1395 = _1513;
            _189 = _1507;
        }
        float _1521 = _1377;
        float _1523 = _607;
        float _1525 = _609;
        float _1527 = _611;
        float _1529 = _1383;
        float _1531 = _1389;
        float _1533 = _1395;
        float _1535 = _189;
        float _1537 = sqrt(_1521);
        float _1539 = rsqrt(_1347);
        bool _1541 = _1537 > 0.0;
        float _1543 = _1337 * _1539;
        float _1545 = _1333 * _1539;
        float _1547 = _1341 * _1539;
        bool _1549 = !_1541;
        _613 = _1527;
        _191 = _1535;
        _1365 = _1543;
        _615 = _1523;
        _1239 = _1529;
        if (!_1549)
        {
            float _1551 = rsqrt(_1521);
            float _1553 = _1551 * _1523;
            float _1555 = _1551 * _1525;
            float _1557 = _1545 * _1553;
            float _1559 = _1551 * _1527;
            float _1561 = fma(_1543, _1555, _1557);
            float _1563 = fma(_1547, _1559, _1561);
            float _1565 = _1563 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1567 = fma(_1529, _1565, _1327);
            float _1569 = fma(_1531, _1565, _1325);
            float _1571 = fma(_1533, _1565, _1329);
            _1357 = _1567;
            _1359 = _1569;
            _1361 = _1571;
            _191 = _1559;
            _1363 = _1557;
        }
    }
    float _1573 = _1357;
    float _1575 = _1359;
    float _1577 = _1361;
    float _1579 = _613;
    float _1581 = _191;
    float _1583 = _1363;
    float _1585 = _1365;
    float _1587 = _615;
    float _1589 = _1239;
    bool _1591 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1593 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1595 = _1591 || _1593;
    bool _1597 = isnan(0.5);
    bool _1599 = _1595 || _1597;
    float _1601 = _1581;
    float _1603 = _1579;
    float _1605 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _1607 = _1573;
    float _1609 = _1585;
    float _1611 = _1589;
    if (_1599)
    {
        _1601 = _1573;
    }
    float _1613 = _1601;
    float _1615 = _1613;
    if (_1599)
    {
        _1603 = _1575;
    }
    float _1617 = _1603;
    float _1619 = _1617;
    if (_1599)
    {
        _1605 = _1577;
    }
    float _1621 = _1605;
    float _1623 = _1621;
    if (!_1599)
    {
        float _1625 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1627 = _1033 + _1625;
        float _1629 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1631 = _983 + _1629;
        float _1633 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1635 = -_983;
        float _1637 = _1635 + _1573;
        float _1639 = _1627 * _1627;
        float _1641 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1643 = _985 + _1641;
        float _1645 = -_985;
        float _1647 = _1645 + _1577;
        float _1649 = fma(_1631, _1631, _1639);
        float _1651 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1653 = fma(_1643, _1643, _1649);
        float _1655 = sqrt(_1653);
        float _1657 = _1633 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1659 = precise::min(_1655, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1661 = _1659 * _1651;
        float _1663 = -_1033;
        float _1665 = _1663 + _1575;
        float _1667 = _1657 * _1661;
        float _1669 = fma(_1637, _1667, _983);
        float _1671 = fma(_1665, _1667, _1033);
        float _1673 = fma(_1647, _1667, _985);
        _1619 = _1671;
        _1615 = _1669;
        _1623 = _1673;
        _1607 = _1637;
    }
    float _1675 = _1619;
    float _1677 = _1615;
    float _1679 = _1623;
    float _1681 = _1607;
    float _1683 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1685 = _1675 + _1683;
    float _1687 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1689 = _1677 + _1687;
    float _1691 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1693 = _1679 + _1691;
    float _1695 = _1685 * _1685;
    float _1697 = fma(_1689, _1689, _1695);
    float _1699 = fma(_1693, _1693, _1697);
    float _1701 = rsqrt(_1699);
    float _1703 = sqrt(_1699);
    float _1705 = _1689 * _1701;
    float _1707 = _1693 * _1701;
    float _1709 = _1685 * _1701;
    float _1711 = _1705 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1713 = _1707 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1715 = _1711 * _1711;
    float _1717 = _1713 * _1713;
    float _1719 = _1715 + _1717;
    float _1721 = sqrt(_1719);
    bool _1723 = _1721 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1725 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1727 = _1721 + _1725;
    float _1729 = _1583;
    float _1731 = _1727;
    float _1733 = _1701;
    float _1735 = _1705;
    if (_1723)
    {
        float _1737 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1729 = _1737;
    }
    float _1739 = _1729;
    if (_1723)
    {
        float _1741 = _1727 * _1739;
        _1731 = _1741;
    }
    float _1743 = _1731;
    if (_1723)
    {
        float _1745 = _1743 * 0.15915493667125701904296875;
        _1609 = _1745;
    }
    float _1747 = _1609;
    float _1749 = _1681;
    float _1751 = _1747;
    if (_1723)
    {
        float _1753 = _1747 * 6.283185482025146484375;
        float _1755 = sin(_1753);
        _1749 = _1755;
    }
    float _1757 = _1749;
    float _1759 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1761 = precise::max(0.0, _1759);
    float _1763 = _1587;
    float _1765 = _1761;
    if (_1723)
    {
        float _1767 = _1747 * 6.283185482025146484375;
        float _1769 = cos(_1767);
        _1763 = _1769;
    }
    float _1771 = _1763;
    float _1773 = -_1709;
    float _1775 = -_1761;
    float _1777 = fma(_1773, (*spvDescriptorSet0.vp_c15)._m0[24].y, _1775);
    float _1779 = _1759;
    if (_1723)
    {
        float _1781 = rsqrt(_1719);
        _1779 = _1781;
    }
    float _1783 = _1779;
    if (_1723)
    {
        float _1785 = _1777 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1765 = _1785;
    }
    float _1787 = _1765;
    float _1789 = _1787;
    float _1791 = _1757;
    if (_1723)
    {
        float _1793 = fma(_1757, _1787, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1789 = _1793;
    }
    float _1795 = _1789;
    float _1797 = _1795;
    if (!_1723)
    {
        _1791 = _1711;
    }
    float _1799 = _1791;
    float _1801 = _1799;
    float _1803 = _1771;
    if (_1723)
    {
        float _1805 = _1771 + (-1.0);
        _1733 = _1805;
    }
    float _1807 = _1733;
    float _1809 = _1807;
    if (_1723)
    {
        float _1811 = _1807 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1751 = _1811;
    }
    float _1813 = _1751;
    if (!_1723)
    {
        _1809 = _1715;
    }
    float _1815 = _1809;
    float _1817 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1819 = _1783;
    float _1821 = _1815;
    if (_1723)
    {
        float _1823 = _1783 * _1795;
        _1611 = _1823;
    }
    float _1825 = _1611;
    if (!_1723)
    {
        _1797 = _1777;
    }
    float _1827 = _1797;
    float _1829 = _1827;
    if (_1723)
    {
        float _1831 = fma(_1777, _1771, _1813);
        _1829 = _1831;
    }
    float _1833 = _1829;
    if (!_1723)
    {
        _1819 = _1713;
    }
    float _1835 = _1819;
    float _1837 = _1835;
    if (_1723)
    {
        float _1839 = _1711 * _1825;
        _1801 = _1839;
    }
    float _1841 = _1801;
    if (_1723)
    {
        float _1843 = _1713 * _1825;
        _1837 = _1843;
    }
    float _1845 = _1837;
    if (!_1723)
    {
        _1803 = _1717;
    }
    float _1847 = _1803;
    float _1849 = _1675 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1851 = _1847;
    if (_1723)
    {
        float _1853 = _1841 * _1841;
        _1821 = _1853;
    }
    float _1855 = _1821;
    if (_1723)
    {
        float _1857 = _1845 * _1845;
        _1851 = _1857;
    }
    float _1859 = _1851;
    float _1861 = fma(_1833, _1833, _1855);
    float _1863 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1865 = fma(_1703, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1863);
    float _1867 = precise::clamp(_1865, 0.0, 1.0);
    float _1869 = _1861 + _1859;
    float _1871 = _1675 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1873 = -_1867;
    float _1875 = _1873 + 1.0;
    float _1877 = rsqrt(_1869);
    float _1879 = fma(_1677, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1871);
    float _1881 = _1675 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1883 = _1675 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1885 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1879);
    float _1887 = fma(_1677, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1881);
    float _1889 = fma(_1677, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1883);
    float _1891 = abs(_1875);
    float _1893 = log2(_1891);
    float _1895 = _1885 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1897 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1887);
    float _1899 = fma(_1677, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1849);
    float _1901 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1889);
    float _1903 = _1895 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1905 = _1897 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1907 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1899);
    float _1909 = _1877 * _1841;
    float _1911 = _1877 * _1833;
    float _1913 = -_1903;
    float _1915 = fma(_1913, _1817, 1.0);
    float _1917 = _1901 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1919 = _1909 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1921 = _1905 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1923 = _1877 * _1845;
    float _1925 = _1907 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1927 = -_1919;
    float _1929 = fma(_1911, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1927);
    float _1931 = fma(_1917, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1921);
    float _1933 = _1893 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1935 = log2(_1915);
    float _1937 = -_1923;
    float _1939 = fma(_1937, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1929);
    float _1941 = fma(_1895, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1931);
    float _1943 = _1905 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1945 = _1905 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1947 = fma(_1939, -0.5, 0.5);
    float _1949 = fma(_1925, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1941);
    float _1951 = exp2(_1933);
    float _1953 = fma(_1939, 0.5, 0.5);
    float _1955 = fma(_1917, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1943);
    float _1957 = fma(_1917, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1945);
    float _1959 = _1911 + 1.0;
    float _1961 = fma(_1895, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1955);
    float _1963 = fma(_1895, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1957);
    float _1965 = 1.0 / _1949;
    float _1967 = fma(_1953, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1969 = _1935 * 0.693147182464599609375;
    float _1971 = fma(_1953, _1967, -0.212114393711090087890625);
    float _1973 = _1969 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1975 = sqrt(_1947);
    float _1977 = -_1911;
    float _1979 = fma(_1951, _1959, _1977);
    float _1981 = fma(_1925, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1961);
    float _1983 = fma(_1925, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1963);
    float _1985 = fma(_1953, _1971, 1.570728778839111328125);
    float _1987 = fma(_1979, 0.5, 0.5);
    float _1989 = _1981 * _1965;
    float _1991 = _1983 * _1965;
    float _1993 = fma(_1989, 0.5, 0.5);
    float _1995 = fma(_1991, -0.5, 0.5);
    float _1997 = _1975 * 0.636619746685028076171875;
    float _1999 = -_1985;
    float _2001 = fma(_1997, _1999, 1.0);
    float3 _5340 = float3(_1993, _1995, _1973);
    float _2003 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5340, float3(0.0), isnan(_5340)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5340, float3(0.0), isnan(_5340)), level(0.0)).x;
    float3 _5351 = float3(_1993, _1995, _1973);
    float4 _2006 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5351, float3(0.0), isnan(_5351)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5351, float3(0.0), isnan(_5351)), level(0.0)).xyzw;
    float _2008 = _2006.x;
    float _2010 = _2006.y;
    float _2012 = _2006.z;
    float _2014 = _2006.w;
    float2 _5368 = float2(_2001, _1987);
    float3 _2018 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5368, float2(0.0), isnan(_5368)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5368, float2(0.0), isnan(_5368)), level(0.0)).xyz;
    float _2020 = _2018.x;
    float _2022 = _2018.y;
    float _2024 = _2018.z;
    float _2026 = _1033 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2028 = _1245 * _1709;
    float _2030 = _1033 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2032 = fma(_983, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2026);
    float _2034 = -(*spvDescriptorSet0.vp_c9)._m0[139].z;
    float _2036 = (*spvDescriptorSet0.vp_c9)._m0[139].w + _2034;
    float _2038 = fma(_1243, _1705, _2028);
    float _2040 = fma(_985, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2032);
    float _2042 = fma(_983, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2030);
    float _2044 = _1905 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2046 = fma(_1247, _1707, _2038);
    float _2048 = _2040 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2050 = 1.0 / _2036;
    float _2052 = _1893 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2054 = fma(_985, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2042);
    float _2056 = fma(_1917, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2044);
    bool _2058 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2060 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2062 = _2058 || _2060;
    bool _2064 = isnan(0.5);
    bool _2066 = _2062 || _2064;
    float _2068 = abs(_2046);
    float _2070 = -(*spvDescriptorSet0.vp_c9)._m0[139].z;
    float _2072 = _2068 + _2070;
    float _2074 = _2054 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2076 = 1.0 / _2048;
    float _2078 = fma(_1895, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2056);
    float _2080 = _2074 + _2048;
    float _2082 = fma(_1925, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2078);
    float _2084 = exp2(_2052);
    float _2086 = _2072 * _2050;
    float _2088 = precise::clamp(_2086, 0.0, 1.0);
    if (_2066)
    {
        _1735 = 1.0;
    }
    float _2090 = _1735;
    float _2092 = _2088 * _2088;
    float _2094 = _2080 * _2076;
    float _2096 = _2094 * 0.5;
    float _2098 = fma(_2088, -2.0, 3.0);
    float _2100 = _2090;
    if (!_2066)
    {
        float _2102 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2104 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2106 = fma(_2096, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2104);
        float _2108 = _2102 * 0.15915493667125701904296875;
        float _2110 = _2108 * 6.283185482025146484375;
        float _2112 = cos(_2110);
        float _2114 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2116 = _2114 * 0.15915493667125701904296875;
        float _2118 = _2108 * 6.283185482025146484375;
        float _2120 = sin(_2118);
        float _2122 = 1.0 / _2112;
        float _2124 = _2116 * 6.283185482025146484375;
        float _2126 = cos(_2124);
        float _2128 = _2120 * _2122;
        float _2130 = 1.0 / _2106;
        float _2132 = _2126 * _2128;
        float _2134 = _2116 * 6.283185482025146484375;
        float _2136 = sin(_2134);
        float _2138 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2140 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2138;
        float _2142 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2144 = _2130 * _2142;
        float _2146 = 1.0 / _2132;
        float _2148 = 1.0 / _2140;
        float _2150 = _2136 * _2146;
        float _2152 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2154 = fma(_2150, _2144, _2152);
        float _2156 = _2154 * _2148;
        float _2158 = precise::clamp(_2156, 0.0, 1.0);
        _2100 = _2158;
    }
    float _2160 = _2100;
    float _2162 = -_2084;
    float _2164 = _2162 + 1.0;
    float _2166 = _2092 * _2098;
    float _2168 = _1949 * 0.5;
    bool _2170 = _2160 > 0.0;
    bool _2172 = isnan(_2160);
    bool _2174 = _2170 || _2172;
    bool _2176 = isnan(0.0);
    bool _2178 = _2174 || _2176;
    float _2180 = _2164 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2182 = _2166 * _2160;
    float _2184 = fma(_1983, -0.5, _2168);
    float _2186 = _2082 + _1949;
    float _2188 = _2180 * _2003;
    float _2190 = _1981 + _1949;
    float _2192 = _2182 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.gl_Position.x = _1981;
    out.gl_Position.y = _1983;
    out.gl_Position.z = _2082;
    out.gl_Position.w = _1949;
    float _2194 = _2014 * _2188;
    float _2196 = _2024 * _2188;
    float _2198 = -_2180;
    float _2200 = _2198 + 1.0;
    float _2202 = _2186 * 0.5;
    float _2204 = _2190 * 0.5;
    float _2206 = _2014 * _2200;
    float _2208 = _2192 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2210 = fma(_2020, _2194, _2008);
    float _2212 = fma(_2022, _2194, _2010);
    float _2214 = fma(_2014, _2196, _2012);
    out.m_64.x = _2204;
    out.m_64.y = _2184;
    out.m_64.z = _2202;
    out.m_64.w = _1949;
    out.m_47.x = _2208;
    out.m_66.x = _2210;
    out.m_66.y = _2212;
    out.m_66.z = _2214;
    out.m_66.w = _2206;
    if (_2178)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _2216 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2216;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

