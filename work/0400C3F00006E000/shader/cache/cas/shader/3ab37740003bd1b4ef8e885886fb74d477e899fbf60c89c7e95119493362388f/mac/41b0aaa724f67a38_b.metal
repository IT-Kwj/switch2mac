#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

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
    constant _16* vp_c11 [[id(0)]];
    constant _16* vp_c9 [[id(1)]];
    constant _16* vp_c7 [[id(2)]];
    constant _16* vp_c6 [[id(3)]];
    constant _16* vp_c4 [[id(4)]];
};

struct main0_out
{
    float4 m_39 [[user(locn0)]];
    float4 m_47 [[user(locn1)]];
    float4 m_49 [[user(locn2)]];
    float4 m_51 [[user(locn3)]];
    float4 m_41 [[user(locn4)]];
    float4 m_45 [[user(locn5)]];
    float4 m_43 [[user(locn6)]];
    float4 m_53 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_30 [[attribute(0)]];
    float4 m_32 [[attribute(1)]];
    float4 m_34 [[attribute(2)]];
    float4 m_36 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_39 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    bool _135 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _67 = -(*spvDescriptorSet0.vp_c9)._m0[26].y;
    float _69 = (*spvDescriptorSet0.vp_c7)._m0[1].w + _67;
    float _71 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _73 = (*spvDescriptorSet0.vp_c7)._m0[0].w + _71;
    float _75 = _69 * _69;
    float _77 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _79 = (*spvDescriptorSet0.vp_c7)._m0[2].w + _77;
    float _81 = fma(_73, _73, _75);
    float _83 = fma(_79, _79, _81);
    float _85 = sqrt(_83);
    bool _89 = _85 >= (*spvDescriptorSet0.vp_c6)._m0[6].x;
    bool _91 = isnan(_85);
    bool _93 = _89 || _91;
    bool _95 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].x);
    bool _97 = _93 || _95;
    float _99 = _79;
    if (!_97)
    {
        _99 = 1.0;
    }
    float _101 = _99;
    bool _103 = !_97;
    float _105 = _101;
    if (!_103)
    {
        bool _107 = _85 >= (*spvDescriptorSet0.vp_c6)._m0[6].y;
        bool _109 = isnan(_85);
        bool _111 = _107 || _109;
        bool _113 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].y);
        bool _115 = _111 || _113;
        if (!_115)
        {
            float _117 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _119 = _85 + _117;
            float _121 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _123 = (*spvDescriptorSet0.vp_c6)._m0[6].y + _121;
            float _125 = -(*spvDescriptorSet0.vp_c6)._m0[7].x;
            float _127 = _125 + (*spvDescriptorSet0.vp_c6)._m0[7].y;
            float _129 = 1.0 / _123;
            float _131 = _119 * _129;
            float _133 = fma(_131, _127, (*spvDescriptorSet0.vp_c6)._m0[7].x);
            _105 = _133;
            _135 = true;
        }
        else
        {
            bool _137 = _85 >= (*spvDescriptorSet0.vp_c6)._m0[6].z;
            bool _139 = isnan(_85);
            bool _141 = _137 || _139;
            bool _143 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].z);
            bool _145 = _141 || _143;
            if (!_145)
            {
                float _147 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _149 = _85 + _147;
                float _151 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _153 = _151 + (*spvDescriptorSet0.vp_c6)._m0[6].z;
                float _155 = -(*spvDescriptorSet0.vp_c6)._m0[7].y;
                float _157 = _155 + (*spvDescriptorSet0.vp_c6)._m0[7].z;
                float _159 = 1.0 / _153;
                float _161 = _149 * _159;
                float _163 = fma(_161, _157, (*spvDescriptorSet0.vp_c6)._m0[7].y);
                _105 = _163;
                _135 = true;
            }
            else
            {
                _105 = (*spvDescriptorSet0.vp_c6)._m0[7].z;
            }
        }
    }
    _135 = false;
    float _165 = _105;
    float _167 = in.m_30.x;
    float _169 = in.m_30.y;
    float _171 = in.m_30.z;
    float _173 = _165 + (-1.0);
    float _175 = in.m_32.x;
    float _177 = in.m_32.y;
    float _179 = in.m_32.z;
    float _181 = _173 * (*spvDescriptorSet0.vp_c6)._m0[8].y;
    float _183 = _173 * (*spvDescriptorSet0.vp_c6)._m0[8].z;
    float _185 = in.m_34.x;
    float _187 = in.m_34.y;
    float _189 = in.m_34.z;
    float _191 = in.m_36.x;
    float _193 = in.m_36.y;
    float _195 = in.m_34.w;
    float _197 = fma(_165, _169, _181);
    float _199 = _173 * (*spvDescriptorSet0.vp_c6)._m0[8].x;
    float _201 = fma(_165, _171, _183);
    float _203 = _197 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _205 = fma(_165, _167, _199);
    float _207 = _197 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _209 = _177 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _211 = _177 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _213 = fma(_205, (*spvDescriptorSet0.vp_c7)._m0[2].x, _203);
    float _215 = fma(_205, (*spvDescriptorSet0.vp_c7)._m0[0].x, _207);
    float _217 = _177 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _219 = fma(_175, (*spvDescriptorSet0.vp_c7)._m0[0].x, _209);
    float _221 = fma(_201, (*spvDescriptorSet0.vp_c7)._m0[2].z, _213);
    float _223 = fma(_201, (*spvDescriptorSet0.vp_c7)._m0[0].z, _215);
    float _225 = fma(_175, (*spvDescriptorSet0.vp_c7)._m0[1].x, _217);
    float _227 = fma(_175, (*spvDescriptorSet0.vp_c7)._m0[2].x, _211);
    float _229 = _221 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _231 = _223 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _233 = _187 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _235 = _187 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _237 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _239 = _229 + _237;
    float _241 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _243 = _231 + _241;
    float _245 = fma(_185, (*spvDescriptorSet0.vp_c7)._m0[1].x, _233);
    float _247 = _197 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _249 = _239 * _239;
    float _251 = _187 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _253 = fma(_185, (*spvDescriptorSet0.vp_c7)._m0[0].x, _235);
    float _255 = fma(_179, (*spvDescriptorSet0.vp_c7)._m0[1].z, _225);
    float _257 = fma(_243, _243, _249);
    float _259 = fma(_189, (*spvDescriptorSet0.vp_c7)._m0[1].z, _245);
    float _261 = fma(_205, (*spvDescriptorSet0.vp_c7)._m0[1].x, _247);
    float _263 = fma(_185, (*spvDescriptorSet0.vp_c7)._m0[2].x, _251);
    float _265 = sqrt(_257);
    float _267 = fma(_179, (*spvDescriptorSet0.vp_c7)._m0[0].z, _219);
    float _269 = fma(_179, (*spvDescriptorSet0.vp_c7)._m0[2].z, _227);
    float _271 = _255 * _255;
    float _273 = fma(_189, (*spvDescriptorSet0.vp_c7)._m0[0].z, _253);
    float _275 = _259 * _259;
    float _277 = fma(_201, (*spvDescriptorSet0.vp_c7)._m0[1].z, _261);
    float _279 = fma(_267, _267, _271);
    float _281 = fma(_189, (*spvDescriptorSet0.vp_c7)._m0[2].z, _263);
    float _283 = fma(_273, _273, _275);
    float _285 = _277 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    out.m_39.x = _191;
    float _287 = fma(_269, _269, _279);
    float _289 = _285 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    bool _291 = _265 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _293 = fma(_231, (*spvDescriptorSet0.vp_c4)._m0[2].x, _289);
    float _295 = fma(_281, _281, _283);
    float _297 = rsqrt(_287);
    float _299 = fma(_229, (*spvDescriptorSet0.vp_c4)._m0[2].z, _293);
    float _301 = _299 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _303 = rsqrt(_295);
    float _305 = _283;
    float _307 = _261;
    float _309 = _279;
    float _311 = _275;
    if (!_291)
    {
        _305 = _231;
    }
    float _313 = _305;
    float _315 = _313;
    if (!_291)
    {
        _307 = _301;
    }
    float _317 = _307;
    float _319 = _317;
    if (!_291)
    {
        _309 = _285;
    }
    float _321 = _309;
    float _323 = _321;
    if (!_291)
    {
        _311 = _229;
    }
    float _325 = _311;
    bool _327 = !_291;
    float _329 = _325;
    if (!_327)
    {
        float _331 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _333 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _335 = _265 + _333;
        float _337 = rsqrt(_257);
        float _339 = _335 * _331;
        float _341 = _285 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _343 = _339 * 0.15915493667125701904296875;
        float _345 = _343 * 6.283185482025146484375;
        float _347 = cos(_345);
        float _349 = _343 * 6.283185482025146484375;
        float _351 = sin(_349);
        float _353 = _347 + (-1.0);
        float _355 = _353 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _357 = fma(_351, _341, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _359 = fma(_285, _347, _355);
        float _361 = _337 * _357;
        float _363 = _359 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _365 = fma(_243, _361, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _367 = fma(_239, _361, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _369 = fma(_365, (*spvDescriptorSet0.vp_c4)._m0[2].x, _363);
        float _371 = fma(_367, (*spvDescriptorSet0.vp_c4)._m0[2].z, _369);
        float _373 = _371 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _323 = _359;
        _315 = _365;
        _329 = _367;
        _319 = _373;
    }
    float _375 = _323;
    float _377 = _315;
    float _379 = _329;
    float _381 = _319;
    float _383 = _375 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _385 = _375 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    out.m_39.y = _193;
    float _387 = _255 * _297;
    float _389 = fma(_377, (*spvDescriptorSet0.vp_c4)._m0[0].x, _383);
    float _391 = fma(_377, (*spvDescriptorSet0.vp_c4)._m0[1].x, _385);
    out.m_41.w = _195;
    float _393 = _273 * _303;
    float _395 = fma(_379, (*spvDescriptorSet0.vp_c4)._m0[0].z, _389);
    float _397 = fma(_379, (*spvDescriptorSet0.vp_c4)._m0[1].z, _391);
    float _399 = _267 * _297;
    float _401 = _269 * _297;
    out.m_43.x = _231;
    out.m_43.y = _285;
    out.m_43.z = _229;
    float _403 = _397 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _405 = _285 * (*spvDescriptorSet0.vp_c4)._m0[42].y;
    float _407 = _285 * (*spvDescriptorSet0.vp_c4)._m0[43].y;
    float _409 = _285 * (*spvDescriptorSet0.vp_c4)._m0[44].y;
    float _411 = _285 * (*spvDescriptorSet0.vp_c4)._m0[45].y;
    float _413 = _285 * (*spvDescriptorSet0.vp_c4)._m0[46].y;
    float _415 = _285 * (*spvDescriptorSet0.vp_c4)._m0[47].y;
    float _417 = _285 * (*spvDescriptorSet0.vp_c4)._m0[48].y;
    float _419 = _285 * (*spvDescriptorSet0.vp_c4)._m0[49].y;
    float _421 = _285 * (*spvDescriptorSet0.vp_c4)._m0[50].y;
    float _423 = _285 * (*spvDescriptorSet0.vp_c4)._m0[51].y;
    float _425 = _285 * (*spvDescriptorSet0.vp_c4)._m0[52].y;
    float _427 = _285 * (*spvDescriptorSet0.vp_c4)._m0[53].y;
    float _429 = _395 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _431 = _403 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _433 = _259 * _303;
    float _435 = fma(_231, (*spvDescriptorSet0.vp_c4)._m0[42].x, _405);
    float _437 = fma(_231, (*spvDescriptorSet0.vp_c4)._m0[43].x, _407);
    float _439 = fma(_429, (*spvDescriptorSet0.vp_c4)._m0[9].x, _431);
    float _441 = _403 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _443 = fma(_231, (*spvDescriptorSet0.vp_c4)._m0[44].x, _409);
    float _445 = fma(_231, (*spvDescriptorSet0.vp_c4)._m0[45].x, _411);
    float _447 = fma(_381, (*spvDescriptorSet0.vp_c4)._m0[9].z, _439);
    float _449 = fma(_429, (*spvDescriptorSet0.vp_c4)._m0[10].x, _441);
    float _451 = fma(_231, (*spvDescriptorSet0.vp_c4)._m0[46].x, _413);
    float _453 = fma(_231, (*spvDescriptorSet0.vp_c4)._m0[47].x, _415);
    float _455 = _447 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _457 = fma(_231, (*spvDescriptorSet0.vp_c4)._m0[48].x, _417);
    float _459 = fma(_231, (*spvDescriptorSet0.vp_c4)._m0[49].x, _419);
    float _461 = fma(_231, (*spvDescriptorSet0.vp_c4)._m0[50].x, _421);
    float _463 = fma(_231, (*spvDescriptorSet0.vp_c4)._m0[51].x, _423);
    float _465 = fma(_231, (*spvDescriptorSet0.vp_c4)._m0[52].x, _425);
    float _467 = fma(_231, (*spvDescriptorSet0.vp_c4)._m0[53].x, _427);
    float _469 = fma(_381, (*spvDescriptorSet0.vp_c4)._m0[10].z, _449);
    float _471 = _455 * 10000.0;
    float _473 = precise::clamp(_471, 0.0, 1.0);
    float _475 = _281 * _303;
    float _477 = _469 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    float _479 = _473 * (*spvDescriptorSet0.vp_c11)._m0[42].x;
    float _481 = _403 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _483 = _403 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    out.m_41.x = _393;
    out.m_41.y = _433;
    out.m_41.z = _475;
    float _485 = fma(_479, (*spvDescriptorSet0.vp_c4)._m0[10].z, _477);
    float _487 = fma(_229, (*spvDescriptorSet0.vp_c4)._m0[42].z, _435);
    float _489 = fma(_229, (*spvDescriptorSet0.vp_c4)._m0[43].z, _437);
    float _491 = fma(_229, (*spvDescriptorSet0.vp_c4)._m0[44].z, _443);
    float _493 = fma(_229, (*spvDescriptorSet0.vp_c4)._m0[45].z, _445);
    float _495 = fma(_229, (*spvDescriptorSet0.vp_c4)._m0[46].z, _451);
    float _497 = fma(_229, (*spvDescriptorSet0.vp_c4)._m0[47].z, _453);
    float _499 = fma(_229, (*spvDescriptorSet0.vp_c4)._m0[48].z, _457);
    float _501 = fma(_229, (*spvDescriptorSet0.vp_c4)._m0[49].z, _459);
    float _503 = fma(_229, (*spvDescriptorSet0.vp_c4)._m0[50].z, _461);
    float _505 = fma(_229, (*spvDescriptorSet0.vp_c4)._m0[51].z, _463);
    float _507 = 1.0 / _485;
    float _509 = fma(_429, (*spvDescriptorSet0.vp_c4)._m0[7].x, _481);
    float _511 = fma(_429, (*spvDescriptorSet0.vp_c4)._m0[8].x, _483);
    float _513 = fma(_229, (*spvDescriptorSet0.vp_c4)._m0[52].z, _465);
    float _515 = fma(_229, (*spvDescriptorSet0.vp_c4)._m0[53].z, _467);
    float _517 = fma(_479, (*spvDescriptorSet0.vp_c4)._m0[9].z, _455);
    float _519 = fma(_381, (*spvDescriptorSet0.vp_c4)._m0[7].z, _509);
    float _521 = fma(_381, (*spvDescriptorSet0.vp_c4)._m0[8].z, _511);
    out.m_45.x = _399;
    out.m_45.y = _387;
    out.m_45.z = _401;
    float _523 = _493 + (*spvDescriptorSet0.vp_c4)._m0[45].w;
    float _525 = _495 + (*spvDescriptorSet0.vp_c4)._m0[46].w;
    float _527 = _499 + (*spvDescriptorSet0.vp_c4)._m0[48].w;
    float _529 = _503 + (*spvDescriptorSet0.vp_c4)._m0[50].w;
    float _531 = _513 + (*spvDescriptorSet0.vp_c4)._m0[52].w;
    float _533 = _519 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _535 = _477 * _507;
    float _537 = -_301;
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[72].y;
    float _541 = _537 + _539;
    float _543 = _521 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _545 = _487 + (*spvDescriptorSet0.vp_c4)._m0[42].w;
    float _547 = _489 + (*spvDescriptorSet0.vp_c4)._m0[43].w;
    float _549 = _491 + (*spvDescriptorSet0.vp_c4)._m0[44].w;
    float _551 = _517 * _535;
    float _553 = _497 + (*spvDescriptorSet0.vp_c4)._m0[47].w;
    float _555 = _501 + (*spvDescriptorSet0.vp_c4)._m0[49].w;
    float _557 = _505 + (*spvDescriptorSet0.vp_c4)._m0[51].w;
    float _559 = _515 + (*spvDescriptorSet0.vp_c4)._m0[53].w;
    float _561 = _541 * (*spvDescriptorSet0.vp_c9)._m0[72].z;
    out.m_47.x = _545;
    out.m_47.y = _547;
    out.m_47.z = _549;
    out.m_47.w = _523;
    out.m_49.x = _525;
    out.m_49.y = _553;
    out.m_49.z = _527;
    out.m_49.w = _555;
    out.m_51.x = _529;
    out.m_51.y = _557;
    out.m_51.z = _531;
    out.m_51.w = _559;
    out.m_53.w = _301;
    out.m_45.w = _561;
    out.gl_Position.x = _533;
    out.gl_Position.y = _543;
    out.gl_Position.z = _551;
    out.gl_Position.w = _477;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_39 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    bool _135 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _67 = -(*spvDescriptorSet0.vp_c9)._m0[26].y;
    float _69 = (*spvDescriptorSet0.vp_c7)._m0[1].w + _67;
    float _71 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _73 = (*spvDescriptorSet0.vp_c7)._m0[0].w + _71;
    float _75 = _69 * _69;
    float _77 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _79 = (*spvDescriptorSet0.vp_c7)._m0[2].w + _77;
    float _81 = fma(_73, _73, _75);
    float _83 = fma(_79, _79, _81);
    float _85 = sqrt(_83);
    bool _89 = _85 >= (*spvDescriptorSet0.vp_c6)._m0[6].x;
    bool _91 = isnan(_85);
    bool _93 = _89 || _91;
    bool _95 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].x);
    bool _97 = _93 || _95;
    float _99 = _79;
    if (!_97)
    {
        _99 = 1.0;
    }
    float _101 = _99;
    bool _103 = !_97;
    float _105 = _101;
    if (!_103)
    {
        bool _107 = _85 >= (*spvDescriptorSet0.vp_c6)._m0[6].y;
        bool _109 = isnan(_85);
        bool _111 = _107 || _109;
        bool _113 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].y);
        bool _115 = _111 || _113;
        if (!_115)
        {
            float _117 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _119 = _85 + _117;
            float _121 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _123 = (*spvDescriptorSet0.vp_c6)._m0[6].y + _121;
            float _125 = -(*spvDescriptorSet0.vp_c6)._m0[7].x;
            float _127 = _125 + (*spvDescriptorSet0.vp_c6)._m0[7].y;
            float _129 = 1.0 / _123;
            float _131 = _119 * _129;
            float _133 = fma(_131, _127, (*spvDescriptorSet0.vp_c6)._m0[7].x);
            _105 = _133;
            _135 = true;
        }
        else
        {
            bool _137 = _85 >= (*spvDescriptorSet0.vp_c6)._m0[6].z;
            bool _139 = isnan(_85);
            bool _141 = _137 || _139;
            bool _143 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].z);
            bool _145 = _141 || _143;
            if (!_145)
            {
                float _147 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _149 = _85 + _147;
                float _151 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _153 = _151 + (*spvDescriptorSet0.vp_c6)._m0[6].z;
                float _155 = -(*spvDescriptorSet0.vp_c6)._m0[7].y;
                float _157 = _155 + (*spvDescriptorSet0.vp_c6)._m0[7].z;
                float _159 = 1.0 / _153;
                float _161 = _149 * _159;
                float _163 = fma(_161, _157, (*spvDescriptorSet0.vp_c6)._m0[7].y);
                _105 = _163;
                _135 = true;
            }
            else
            {
                _105 = (*spvDescriptorSet0.vp_c6)._m0[7].z;
            }
        }
    }
    _135 = false;
    float _165 = _105;
    float _167 = in.m_30.x;
    float _169 = in.m_30.y;
    float _171 = in.m_30.z;
    float _173 = _165 + (-1.0);
    float _175 = in.m_32.x;
    float _177 = in.m_32.y;
    float _179 = in.m_32.z;
    float _181 = _173 * (*spvDescriptorSet0.vp_c6)._m0[8].y;
    float _183 = _173 * (*spvDescriptorSet0.vp_c6)._m0[8].z;
    float _185 = in.m_34.x;
    float _187 = in.m_34.y;
    float _189 = in.m_34.z;
    float _191 = in.m_36.x;
    float _193 = in.m_36.y;
    float _195 = in.m_34.w;
    float _197 = fma(_165, _169, _181);
    float _199 = _173 * (*spvDescriptorSet0.vp_c6)._m0[8].x;
    float _201 = fma(_165, _171, _183);
    float _203 = _197 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _205 = fma(_165, _167, _199);
    float _207 = _197 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _209 = _177 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _211 = _177 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _213 = fma(_205, (*spvDescriptorSet0.vp_c7)._m0[2].x, _203);
    float _215 = fma(_205, (*spvDescriptorSet0.vp_c7)._m0[0].x, _207);
    float _217 = _177 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _219 = fma(_175, (*spvDescriptorSet0.vp_c7)._m0[0].x, _209);
    float _221 = fma(_201, (*spvDescriptorSet0.vp_c7)._m0[2].z, _213);
    float _223 = fma(_201, (*spvDescriptorSet0.vp_c7)._m0[0].z, _215);
    float _225 = fma(_175, (*spvDescriptorSet0.vp_c7)._m0[1].x, _217);
    float _227 = fma(_175, (*spvDescriptorSet0.vp_c7)._m0[2].x, _211);
    float _229 = _221 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _231 = _223 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _233 = _187 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _235 = _187 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _237 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _239 = _229 + _237;
    float _241 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _243 = _231 + _241;
    float _245 = fma(_185, (*spvDescriptorSet0.vp_c7)._m0[1].x, _233);
    float _247 = _197 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _249 = _239 * _239;
    float _251 = _187 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _253 = fma(_185, (*spvDescriptorSet0.vp_c7)._m0[0].x, _235);
    float _255 = fma(_179, (*spvDescriptorSet0.vp_c7)._m0[1].z, _225);
    float _257 = fma(_243, _243, _249);
    float _259 = fma(_189, (*spvDescriptorSet0.vp_c7)._m0[1].z, _245);
    float _261 = fma(_205, (*spvDescriptorSet0.vp_c7)._m0[1].x, _247);
    float _263 = fma(_185, (*spvDescriptorSet0.vp_c7)._m0[2].x, _251);
    float _265 = sqrt(_257);
    float _267 = fma(_179, (*spvDescriptorSet0.vp_c7)._m0[0].z, _219);
    float _269 = fma(_179, (*spvDescriptorSet0.vp_c7)._m0[2].z, _227);
    float _271 = _255 * _255;
    float _273 = fma(_189, (*spvDescriptorSet0.vp_c7)._m0[0].z, _253);
    float _275 = _259 * _259;
    float _277 = fma(_201, (*spvDescriptorSet0.vp_c7)._m0[1].z, _261);
    float _279 = fma(_267, _267, _271);
    float _281 = fma(_189, (*spvDescriptorSet0.vp_c7)._m0[2].z, _263);
    float _283 = fma(_273, _273, _275);
    float _285 = _277 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    out.m_39.x = _191;
    float _287 = fma(_269, _269, _279);
    float _289 = _285 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    bool _291 = _265 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _293 = fma(_231, (*spvDescriptorSet0.vp_c4)._m0[2].x, _289);
    float _295 = fma(_281, _281, _283);
    float _297 = rsqrt(_287);
    float _299 = fma(_229, (*spvDescriptorSet0.vp_c4)._m0[2].z, _293);
    float _301 = _299 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _303 = rsqrt(_295);
    float _305 = _283;
    float _307 = _261;
    float _309 = _279;
    float _311 = _275;
    if (!_291)
    {
        _305 = _231;
    }
    float _313 = _305;
    float _315 = _313;
    if (!_291)
    {
        _307 = _301;
    }
    float _317 = _307;
    float _319 = _317;
    if (!_291)
    {
        _309 = _285;
    }
    float _321 = _309;
    float _323 = _321;
    if (!_291)
    {
        _311 = _229;
    }
    float _325 = _311;
    bool _327 = !_291;
    float _329 = _325;
    if (!_327)
    {
        float _331 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _333 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _335 = _265 + _333;
        float _337 = rsqrt(_257);
        float _339 = _335 * _331;
        float _341 = _285 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _343 = _339 * 0.15915493667125701904296875;
        float _345 = _343 * 6.283185482025146484375;
        float _347 = cos(_345);
        float _349 = _343 * 6.283185482025146484375;
        float _351 = sin(_349);
        float _353 = _347 + (-1.0);
        float _355 = _353 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _357 = fma(_351, _341, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _359 = fma(_285, _347, _355);
        float _361 = _337 * _357;
        float _363 = _359 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _365 = fma(_243, _361, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _367 = fma(_239, _361, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _369 = fma(_365, (*spvDescriptorSet0.vp_c4)._m0[2].x, _363);
        float _371 = fma(_367, (*spvDescriptorSet0.vp_c4)._m0[2].z, _369);
        float _373 = _371 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _323 = _359;
        _315 = _365;
        _329 = _367;
        _319 = _373;
    }
    float _375 = _323;
    float _377 = _315;
    float _379 = _329;
    float _381 = _319;
    float _383 = _375 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _385 = _375 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    out.m_39.y = _193;
    float _387 = _255 * _297;
    float _389 = fma(_377, (*spvDescriptorSet0.vp_c4)._m0[0].x, _383);
    float _391 = fma(_377, (*spvDescriptorSet0.vp_c4)._m0[1].x, _385);
    out.m_41.w = _195;
    float _393 = _273 * _303;
    float _395 = fma(_379, (*spvDescriptorSet0.vp_c4)._m0[0].z, _389);
    float _397 = fma(_379, (*spvDescriptorSet0.vp_c4)._m0[1].z, _391);
    float _399 = _267 * _297;
    float _401 = _269 * _297;
    out.m_43.x = _231;
    out.m_43.y = _285;
    out.m_43.z = _229;
    float _403 = _397 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _405 = _285 * (*spvDescriptorSet0.vp_c4)._m0[42].y;
    float _407 = _285 * (*spvDescriptorSet0.vp_c4)._m0[43].y;
    float _409 = _285 * (*spvDescriptorSet0.vp_c4)._m0[44].y;
    float _411 = _285 * (*spvDescriptorSet0.vp_c4)._m0[45].y;
    float _413 = _285 * (*spvDescriptorSet0.vp_c4)._m0[46].y;
    float _415 = _285 * (*spvDescriptorSet0.vp_c4)._m0[47].y;
    float _417 = _285 * (*spvDescriptorSet0.vp_c4)._m0[48].y;
    float _419 = _285 * (*spvDescriptorSet0.vp_c4)._m0[49].y;
    float _421 = _285 * (*spvDescriptorSet0.vp_c4)._m0[50].y;
    float _423 = _285 * (*spvDescriptorSet0.vp_c4)._m0[51].y;
    float _425 = _285 * (*spvDescriptorSet0.vp_c4)._m0[52].y;
    float _427 = _285 * (*spvDescriptorSet0.vp_c4)._m0[53].y;
    float _429 = _395 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _431 = _403 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _433 = _259 * _303;
    float _435 = fma(_231, (*spvDescriptorSet0.vp_c4)._m0[42].x, _405);
    float _437 = fma(_231, (*spvDescriptorSet0.vp_c4)._m0[43].x, _407);
    float _439 = fma(_429, (*spvDescriptorSet0.vp_c4)._m0[9].x, _431);
    float _441 = _403 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _443 = fma(_231, (*spvDescriptorSet0.vp_c4)._m0[44].x, _409);
    float _445 = fma(_231, (*spvDescriptorSet0.vp_c4)._m0[45].x, _411);
    float _447 = fma(_381, (*spvDescriptorSet0.vp_c4)._m0[9].z, _439);
    float _449 = fma(_429, (*spvDescriptorSet0.vp_c4)._m0[10].x, _441);
    float _451 = fma(_231, (*spvDescriptorSet0.vp_c4)._m0[46].x, _413);
    float _453 = fma(_231, (*spvDescriptorSet0.vp_c4)._m0[47].x, _415);
    float _455 = _447 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _457 = fma(_231, (*spvDescriptorSet0.vp_c4)._m0[48].x, _417);
    float _459 = fma(_231, (*spvDescriptorSet0.vp_c4)._m0[49].x, _419);
    float _461 = fma(_231, (*spvDescriptorSet0.vp_c4)._m0[50].x, _421);
    float _463 = fma(_231, (*spvDescriptorSet0.vp_c4)._m0[51].x, _423);
    float _465 = fma(_231, (*spvDescriptorSet0.vp_c4)._m0[52].x, _425);
    float _467 = fma(_231, (*spvDescriptorSet0.vp_c4)._m0[53].x, _427);
    float _469 = fma(_381, (*spvDescriptorSet0.vp_c4)._m0[10].z, _449);
    float _471 = _455 * 10000.0;
    float _473 = precise::clamp(_471, 0.0, 1.0);
    float _475 = _281 * _303;
    float _477 = _469 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    float _479 = _473 * (*spvDescriptorSet0.vp_c11)._m0[42].x;
    float _481 = _403 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _483 = _403 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    out.m_41.x = _393;
    out.m_41.y = _433;
    out.m_41.z = _475;
    float _485 = fma(_479, (*spvDescriptorSet0.vp_c4)._m0[10].z, _477);
    float _487 = fma(_229, (*spvDescriptorSet0.vp_c4)._m0[42].z, _435);
    float _489 = fma(_229, (*spvDescriptorSet0.vp_c4)._m0[43].z, _437);
    float _491 = fma(_229, (*spvDescriptorSet0.vp_c4)._m0[44].z, _443);
    float _493 = fma(_229, (*spvDescriptorSet0.vp_c4)._m0[45].z, _445);
    float _495 = fma(_229, (*spvDescriptorSet0.vp_c4)._m0[46].z, _451);
    float _497 = fma(_229, (*spvDescriptorSet0.vp_c4)._m0[47].z, _453);
    float _499 = fma(_229, (*spvDescriptorSet0.vp_c4)._m0[48].z, _457);
    float _501 = fma(_229, (*spvDescriptorSet0.vp_c4)._m0[49].z, _459);
    float _503 = fma(_229, (*spvDescriptorSet0.vp_c4)._m0[50].z, _461);
    float _505 = fma(_229, (*spvDescriptorSet0.vp_c4)._m0[51].z, _463);
    float _507 = 1.0 / _485;
    float _509 = fma(_429, (*spvDescriptorSet0.vp_c4)._m0[7].x, _481);
    float _511 = fma(_429, (*spvDescriptorSet0.vp_c4)._m0[8].x, _483);
    float _513 = fma(_229, (*spvDescriptorSet0.vp_c4)._m0[52].z, _465);
    float _515 = fma(_229, (*spvDescriptorSet0.vp_c4)._m0[53].z, _467);
    float _517 = fma(_479, (*spvDescriptorSet0.vp_c4)._m0[9].z, _455);
    float _519 = fma(_381, (*spvDescriptorSet0.vp_c4)._m0[7].z, _509);
    float _521 = fma(_381, (*spvDescriptorSet0.vp_c4)._m0[8].z, _511);
    out.m_45.x = _399;
    out.m_45.y = _387;
    out.m_45.z = _401;
    float _523 = _493 + (*spvDescriptorSet0.vp_c4)._m0[45].w;
    float _525 = _495 + (*spvDescriptorSet0.vp_c4)._m0[46].w;
    float _527 = _499 + (*spvDescriptorSet0.vp_c4)._m0[48].w;
    float _529 = _503 + (*spvDescriptorSet0.vp_c4)._m0[50].w;
    float _531 = _513 + (*spvDescriptorSet0.vp_c4)._m0[52].w;
    float _533 = _519 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _535 = _477 * _507;
    float _537 = -_301;
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[72].y;
    float _541 = _537 + _539;
    float _543 = _521 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _545 = _487 + (*spvDescriptorSet0.vp_c4)._m0[42].w;
    float _547 = _489 + (*spvDescriptorSet0.vp_c4)._m0[43].w;
    float _549 = _491 + (*spvDescriptorSet0.vp_c4)._m0[44].w;
    float _551 = _517 * _535;
    float _553 = _497 + (*spvDescriptorSet0.vp_c4)._m0[47].w;
    float _555 = _501 + (*spvDescriptorSet0.vp_c4)._m0[49].w;
    float _557 = _505 + (*spvDescriptorSet0.vp_c4)._m0[51].w;
    float _559 = _515 + (*spvDescriptorSet0.vp_c4)._m0[53].w;
    float _561 = _541 * (*spvDescriptorSet0.vp_c9)._m0[72].z;
    out.m_47.x = _545;
    out.m_47.y = _547;
    out.m_47.z = _549;
    out.m_47.w = _523;
    out.m_49.x = _525;
    out.m_49.y = _553;
    out.m_49.z = _527;
    out.m_49.w = _555;
    out.m_51.x = _529;
    out.m_51.y = _557;
    out.m_51.z = _531;
    out.m_51.w = _559;
    out.m_53.w = _301;
    out.m_45.w = _561;
    out.gl_Position.x = _533;
    out.gl_Position.y = _543;
    out.gl_Position.z = _551;
    out.gl_Position.w = _477;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint dm_vid [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_39 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    bool _135 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _67 = -(*spvDescriptorSet0.vp_c9)._m0[26].y;
    float _69 = (*spvDescriptorSet0.vp_c7)._m0[1].w + _67;
    float _71 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _73 = (*spvDescriptorSet0.vp_c7)._m0[0].w + _71;
    float _75 = _69 * _69;
    float _77 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _79 = (*spvDescriptorSet0.vp_c7)._m0[2].w + _77;
    float _81 = fma(_73, _73, _75);
    float _83 = fma(_79, _79, _81);
    float _85 = sqrt(_83);
    bool _89 = _85 >= (*spvDescriptorSet0.vp_c6)._m0[6].x;
    bool _91 = isnan(_85);
    bool _93 = _89 || _91;
    bool _95 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].x);
    bool _97 = _93 || _95;
    float _99 = _79;
    if (!_97)
    {
        _99 = 1.0;
    }
    float _101 = _99;
    bool _103 = !_97;
    float _105 = _101;
    if (!_103)
    {
        bool _107 = _85 >= (*spvDescriptorSet0.vp_c6)._m0[6].y;
        bool _109 = isnan(_85);
        bool _111 = _107 || _109;
        bool _113 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].y);
        bool _115 = _111 || _113;
        if (!_115)
        {
            float _117 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _119 = _85 + _117;
            float _121 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _123 = (*spvDescriptorSet0.vp_c6)._m0[6].y + _121;
            float _125 = -(*spvDescriptorSet0.vp_c6)._m0[7].x;
            float _127 = _125 + (*spvDescriptorSet0.vp_c6)._m0[7].y;
            float _129 = 1.0 / _123;
            float _131 = _119 * _129;
            float _133 = fma(_131, _127, (*spvDescriptorSet0.vp_c6)._m0[7].x);
            _105 = _133;
            _135 = true;
        }
        else
        {
            bool _137 = _85 >= (*spvDescriptorSet0.vp_c6)._m0[6].z;
            bool _139 = isnan(_85);
            bool _141 = _137 || _139;
            bool _143 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].z);
            bool _145 = _141 || _143;
            if (!_145)
            {
                float _147 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _149 = _85 + _147;
                float _151 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _153 = _151 + (*spvDescriptorSet0.vp_c6)._m0[6].z;
                float _155 = -(*spvDescriptorSet0.vp_c6)._m0[7].y;
                float _157 = _155 + (*spvDescriptorSet0.vp_c6)._m0[7].z;
                float _159 = 1.0 / _153;
                float _161 = _149 * _159;
                float _163 = fma(_161, _157, (*spvDescriptorSet0.vp_c6)._m0[7].y);
                _105 = _163;
                _135 = true;
            }
            else
            {
                _105 = (*spvDescriptorSet0.vp_c6)._m0[7].z;
            }
        }
    }
    _135 = false;
    float _165 = _105;
    float _167 = in.m_30.x;
    float _169 = in.m_30.y;
    float _171 = in.m_30.z;
    float _173 = _165 + (-1.0);
    float _175 = in.m_32.x;
    float _177 = in.m_32.y;
    float _179 = in.m_32.z;
    float _181 = _173 * (*spvDescriptorSet0.vp_c6)._m0[8].y;
    float _183 = _173 * (*spvDescriptorSet0.vp_c6)._m0[8].z;
    float _185 = in.m_34.x;
    float _187 = in.m_34.y;
    float _189 = in.m_34.z;
    float _191 = in.m_36.x;
    float _193 = in.m_36.y;
    float _195 = in.m_34.w;
    float _197 = fma(_165, _169, _181);
    float _199 = _173 * (*spvDescriptorSet0.vp_c6)._m0[8].x;
    float _201 = fma(_165, _171, _183);
    float _203 = _197 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _205 = fma(_165, _167, _199);
    float _207 = _197 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _209 = _177 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _211 = _177 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _213 = fma(_205, (*spvDescriptorSet0.vp_c7)._m0[2].x, _203);
    float _215 = fma(_205, (*spvDescriptorSet0.vp_c7)._m0[0].x, _207);
    float _217 = _177 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _219 = fma(_175, (*spvDescriptorSet0.vp_c7)._m0[0].x, _209);
    float _221 = fma(_201, (*spvDescriptorSet0.vp_c7)._m0[2].z, _213);
    float _223 = fma(_201, (*spvDescriptorSet0.vp_c7)._m0[0].z, _215);
    float _225 = fma(_175, (*spvDescriptorSet0.vp_c7)._m0[1].x, _217);
    float _227 = fma(_175, (*spvDescriptorSet0.vp_c7)._m0[2].x, _211);
    float _229 = _221 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _231 = _223 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _233 = _187 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _235 = _187 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _237 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _239 = _229 + _237;
    float _241 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _243 = _231 + _241;
    float _245 = fma(_185, (*spvDescriptorSet0.vp_c7)._m0[1].x, _233);
    float _247 = _197 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _249 = _239 * _239;
    float _251 = _187 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _253 = fma(_185, (*spvDescriptorSet0.vp_c7)._m0[0].x, _235);
    float _255 = fma(_179, (*spvDescriptorSet0.vp_c7)._m0[1].z, _225);
    float _257 = fma(_243, _243, _249);
    float _259 = fma(_189, (*spvDescriptorSet0.vp_c7)._m0[1].z, _245);
    float _261 = fma(_205, (*spvDescriptorSet0.vp_c7)._m0[1].x, _247);
    float _263 = fma(_185, (*spvDescriptorSet0.vp_c7)._m0[2].x, _251);
    float _265 = sqrt(_257);
    float _267 = fma(_179, (*spvDescriptorSet0.vp_c7)._m0[0].z, _219);
    float _269 = fma(_179, (*spvDescriptorSet0.vp_c7)._m0[2].z, _227);
    float _271 = _255 * _255;
    float _273 = fma(_189, (*spvDescriptorSet0.vp_c7)._m0[0].z, _253);
    float _275 = _259 * _259;
    float _277 = fma(_201, (*spvDescriptorSet0.vp_c7)._m0[1].z, _261);
    float _279 = fma(_267, _267, _271);
    float _281 = fma(_189, (*spvDescriptorSet0.vp_c7)._m0[2].z, _263);
    float _283 = fma(_273, _273, _275);
    float _285 = _277 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    out.m_39.x = _191;
    float _287 = fma(_269, _269, _279);
    float _289 = _285 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    bool _291 = _265 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _293 = fma(_231, (*spvDescriptorSet0.vp_c4)._m0[2].x, _289);
    float _295 = fma(_281, _281, _283);
    float _297 = rsqrt(_287);
    float _299 = fma(_229, (*spvDescriptorSet0.vp_c4)._m0[2].z, _293);
    float _301 = _299 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _303 = rsqrt(_295);
    float _305 = _283;
    float _307 = _261;
    float _309 = _279;
    float _311 = _275;
    if (!_291)
    {
        _305 = _231;
    }
    float _313 = _305;
    float _315 = _313;
    if (!_291)
    {
        _307 = _301;
    }
    float _317 = _307;
    float _319 = _317;
    if (!_291)
    {
        _309 = _285;
    }
    float _321 = _309;
    float _323 = _321;
    if (!_291)
    {
        _311 = _229;
    }
    float _325 = _311;
    bool _327 = !_291;
    float _329 = _325;
    if (!_327)
    {
        float _331 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _333 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _335 = _265 + _333;
        float _337 = rsqrt(_257);
        float _339 = _335 * _331;
        float _341 = _285 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _343 = _339 * 0.15915493667125701904296875;
        float _345 = _343 * 6.283185482025146484375;
        float _347 = cos(_345);
        float _349 = _343 * 6.283185482025146484375;
        float _351 = sin(_349);
        float _353 = _347 + (-1.0);
        float _355 = _353 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _357 = fma(_351, _341, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _359 = fma(_285, _347, _355);
        float _361 = _337 * _357;
        float _363 = _359 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _365 = fma(_243, _361, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _367 = fma(_239, _361, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _369 = fma(_365, (*spvDescriptorSet0.vp_c4)._m0[2].x, _363);
        float _371 = fma(_367, (*spvDescriptorSet0.vp_c4)._m0[2].z, _369);
        float _373 = _371 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _323 = _359;
        _315 = _365;
        _329 = _367;
        _319 = _373;
    }
    float _375 = _323;
    float _377 = _315;
    float _379 = _329;
    float _381 = _319;
    float _383 = _375 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _385 = _375 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    out.m_39.y = _193;
    float _387 = _255 * _297;
    float _389 = fma(_377, (*spvDescriptorSet0.vp_c4)._m0[0].x, _383);
    float _391 = fma(_377, (*spvDescriptorSet0.vp_c4)._m0[1].x, _385);
    out.m_41.w = _195;
    float _393 = _273 * _303;
    float _395 = fma(_379, (*spvDescriptorSet0.vp_c4)._m0[0].z, _389);
    float _397 = fma(_379, (*spvDescriptorSet0.vp_c4)._m0[1].z, _391);
    float _399 = _267 * _297;
    float _401 = _269 * _297;
    out.m_43.x = _231;
    out.m_43.y = _285;
    out.m_43.z = _229;
    float _403 = _397 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _405 = _285 * (*spvDescriptorSet0.vp_c4)._m0[42].y;
    float _407 = _285 * (*spvDescriptorSet0.vp_c4)._m0[43].y;
    float _409 = _285 * (*spvDescriptorSet0.vp_c4)._m0[44].y;
    float _411 = _285 * (*spvDescriptorSet0.vp_c4)._m0[45].y;
    float _413 = _285 * (*spvDescriptorSet0.vp_c4)._m0[46].y;
    float _415 = _285 * (*spvDescriptorSet0.vp_c4)._m0[47].y;
    float _417 = _285 * (*spvDescriptorSet0.vp_c4)._m0[48].y;
    float _419 = _285 * (*spvDescriptorSet0.vp_c4)._m0[49].y;
    float _421 = _285 * (*spvDescriptorSet0.vp_c4)._m0[50].y;
    float _423 = _285 * (*spvDescriptorSet0.vp_c4)._m0[51].y;
    float _425 = _285 * (*spvDescriptorSet0.vp_c4)._m0[52].y;
    float _427 = _285 * (*spvDescriptorSet0.vp_c4)._m0[53].y;
    float _429 = _395 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _431 = _403 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _433 = _259 * _303;
    float _435 = fma(_231, (*spvDescriptorSet0.vp_c4)._m0[42].x, _405);
    float _437 = fma(_231, (*spvDescriptorSet0.vp_c4)._m0[43].x, _407);
    float _439 = fma(_429, (*spvDescriptorSet0.vp_c4)._m0[9].x, _431);
    float _441 = _403 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _443 = fma(_231, (*spvDescriptorSet0.vp_c4)._m0[44].x, _409);
    float _445 = fma(_231, (*spvDescriptorSet0.vp_c4)._m0[45].x, _411);
    float _447 = fma(_381, (*spvDescriptorSet0.vp_c4)._m0[9].z, _439);
    float _449 = fma(_429, (*spvDescriptorSet0.vp_c4)._m0[10].x, _441);
    float _451 = fma(_231, (*spvDescriptorSet0.vp_c4)._m0[46].x, _413);
    float _453 = fma(_231, (*spvDescriptorSet0.vp_c4)._m0[47].x, _415);
    float _455 = _447 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _457 = fma(_231, (*spvDescriptorSet0.vp_c4)._m0[48].x, _417);
    float _459 = fma(_231, (*spvDescriptorSet0.vp_c4)._m0[49].x, _419);
    float _461 = fma(_231, (*spvDescriptorSet0.vp_c4)._m0[50].x, _421);
    float _463 = fma(_231, (*spvDescriptorSet0.vp_c4)._m0[51].x, _423);
    float _465 = fma(_231, (*spvDescriptorSet0.vp_c4)._m0[52].x, _425);
    float _467 = fma(_231, (*spvDescriptorSet0.vp_c4)._m0[53].x, _427);
    float _469 = fma(_381, (*spvDescriptorSet0.vp_c4)._m0[10].z, _449);
    float _471 = _455 * 10000.0;
    float _473 = precise::clamp(_471, 0.0, 1.0);
    float _475 = _281 * _303;
    float _477 = _469 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    float _479 = _473 * (*spvDescriptorSet0.vp_c11)._m0[42].x;
    float _481 = _403 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _483 = _403 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    out.m_41.x = _393;
    out.m_41.y = _433;
    out.m_41.z = _475;
    float _485 = fma(_479, (*spvDescriptorSet0.vp_c4)._m0[10].z, _477);
    float _487 = fma(_229, (*spvDescriptorSet0.vp_c4)._m0[42].z, _435);
    float _489 = fma(_229, (*spvDescriptorSet0.vp_c4)._m0[43].z, _437);
    float _491 = fma(_229, (*spvDescriptorSet0.vp_c4)._m0[44].z, _443);
    float _493 = fma(_229, (*spvDescriptorSet0.vp_c4)._m0[45].z, _445);
    float _495 = fma(_229, (*spvDescriptorSet0.vp_c4)._m0[46].z, _451);
    float _497 = fma(_229, (*spvDescriptorSet0.vp_c4)._m0[47].z, _453);
    float _499 = fma(_229, (*spvDescriptorSet0.vp_c4)._m0[48].z, _457);
    float _501 = fma(_229, (*spvDescriptorSet0.vp_c4)._m0[49].z, _459);
    float _503 = fma(_229, (*spvDescriptorSet0.vp_c4)._m0[50].z, _461);
    float _505 = fma(_229, (*spvDescriptorSet0.vp_c4)._m0[51].z, _463);
    float _507 = 1.0 / _485;
    float _509 = fma(_429, (*spvDescriptorSet0.vp_c4)._m0[7].x, _481);
    float _511 = fma(_429, (*spvDescriptorSet0.vp_c4)._m0[8].x, _483);
    float _513 = fma(_229, (*spvDescriptorSet0.vp_c4)._m0[52].z, _465);
    float _515 = fma(_229, (*spvDescriptorSet0.vp_c4)._m0[53].z, _467);
    float _517 = fma(_479, (*spvDescriptorSet0.vp_c4)._m0[9].z, _455);
    float _519 = fma(_381, (*spvDescriptorSet0.vp_c4)._m0[7].z, _509);
    float _521 = fma(_381, (*spvDescriptorSet0.vp_c4)._m0[8].z, _511);
    out.m_45.x = _399;
    out.m_45.y = _387;
    out.m_45.z = _401;
    float _523 = _493 + (*spvDescriptorSet0.vp_c4)._m0[45].w;
    float _525 = _495 + (*spvDescriptorSet0.vp_c4)._m0[46].w;
    float _527 = _499 + (*spvDescriptorSet0.vp_c4)._m0[48].w;
    float _529 = _503 + (*spvDescriptorSet0.vp_c4)._m0[50].w;
    float _531 = _513 + (*spvDescriptorSet0.vp_c4)._m0[52].w;
    float _533 = _519 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _535 = _477 * _507;
    float _537 = -_301;
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[72].y;
    float _541 = _537 + _539;
    float _543 = _521 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _545 = _487 + (*spvDescriptorSet0.vp_c4)._m0[42].w;
    float _547 = _489 + (*spvDescriptorSet0.vp_c4)._m0[43].w;
    float _549 = _491 + (*spvDescriptorSet0.vp_c4)._m0[44].w;
    float _551 = _517 * _535;
    float _553 = _497 + (*spvDescriptorSet0.vp_c4)._m0[47].w;
    float _555 = _501 + (*spvDescriptorSet0.vp_c4)._m0[49].w;
    float _557 = _505 + (*spvDescriptorSet0.vp_c4)._m0[51].w;
    float _559 = _515 + (*spvDescriptorSet0.vp_c4)._m0[53].w;
    float _561 = _541 * (*spvDescriptorSet0.vp_c9)._m0[72].z;
    out.m_47.x = _545;
    out.m_47.y = _547;
    out.m_47.z = _549;
    out.m_47.w = _523;
    out.m_49.x = _525;
    out.m_49.y = _553;
    out.m_49.z = _527;
    out.m_49.w = _555;
    out.m_51.x = _529;
    out.m_51.y = _557;
    out.m_51.z = _531;
    out.m_51.w = _559;
    out.m_53.w = _301;
    out.m_45.w = _561;
    out.gl_Position.x = _533;
    out.gl_Position.y = _543;
    out.gl_Position.z = _551;
    out.gl_Position.w = _477;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_39.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_39.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_39.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_39.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

