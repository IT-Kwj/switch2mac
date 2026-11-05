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
    constant _16* vp_c9 [[id(0)]];
    constant _16* vp_c7 [[id(1)]];
    constant _16* vp_c6 [[id(2)]];
    constant _16* vp_c4 [[id(3)]];
};

struct main0_out
{
    float4 m_39 [[user(locn0)]];
    float4 m_49 [[user(locn1)]];
    float4 m_53 [[user(locn2)]];
    float4 m_55 [[user(locn3)]];
    float4 m_41 [[user(locn4)]];
    float4 m_43 [[user(locn5)]];
    float4 m_47 [[user(locn6)]];
    float4 m_45 [[user(locn7)]];
    float4 m_51 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_28 [[attribute(0)]];
    float4 m_32 [[attribute(1)]];
    float4 m_36 [[attribute(2)]];
    float4 m_30 [[attribute(8)]];
    float4 m_34 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_39 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    bool _137 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _69 = -(*spvDescriptorSet0.vp_c9)._m0[26].y;
    float _71 = (*spvDescriptorSet0.vp_c7)._m0[1].w + _69;
    float _73 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _75 = (*spvDescriptorSet0.vp_c7)._m0[0].w + _73;
    float _77 = _71 * _71;
    float _79 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _81 = (*spvDescriptorSet0.vp_c7)._m0[2].w + _79;
    float _83 = fma(_75, _75, _77);
    float _85 = fma(_81, _81, _83);
    float _87 = sqrt(_85);
    bool _91 = _87 >= (*spvDescriptorSet0.vp_c6)._m0[6].x;
    bool _93 = isnan(_87);
    bool _95 = _91 || _93;
    bool _97 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].x);
    bool _99 = _95 || _97;
    float _101 = _77;
    if (!_99)
    {
        _101 = 1.0;
    }
    float _103 = _101;
    bool _105 = !_99;
    float _107 = _103;
    if (!_105)
    {
        bool _109 = _87 >= (*spvDescriptorSet0.vp_c6)._m0[6].y;
        bool _111 = isnan(_87);
        bool _113 = _109 || _111;
        bool _115 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].y);
        bool _117 = _113 || _115;
        if (!_117)
        {
            float _119 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _121 = _87 + _119;
            float _123 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _125 = (*spvDescriptorSet0.vp_c6)._m0[6].y + _123;
            float _127 = -(*spvDescriptorSet0.vp_c6)._m0[7].x;
            float _129 = _127 + (*spvDescriptorSet0.vp_c6)._m0[7].y;
            float _131 = 1.0 / _125;
            float _133 = _121 * _131;
            float _135 = fma(_133, _129, (*spvDescriptorSet0.vp_c6)._m0[7].x);
            _107 = _135;
            _137 = true;
        }
        else
        {
            bool _139 = _87 >= (*spvDescriptorSet0.vp_c6)._m0[6].z;
            bool _141 = isnan(_87);
            bool _143 = _139 || _141;
            bool _145 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].z);
            bool _147 = _143 || _145;
            if (!_147)
            {
                float _149 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _151 = _87 + _149;
                float _153 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _155 = _153 + (*spvDescriptorSet0.vp_c6)._m0[6].z;
                float _157 = -(*spvDescriptorSet0.vp_c6)._m0[7].y;
                float _159 = _157 + (*spvDescriptorSet0.vp_c6)._m0[7].z;
                float _161 = 1.0 / _155;
                float _163 = _151 * _161;
                float _165 = fma(_163, _159, (*spvDescriptorSet0.vp_c6)._m0[7].y);
                _107 = _165;
                _137 = true;
            }
            else
            {
                _107 = (*spvDescriptorSet0.vp_c6)._m0[7].z;
            }
        }
    }
    _137 = false;
    float _167 = _107;
    float _169 = in.m_28.x;
    float _171 = in.m_28.y;
    float _173 = in.m_28.z;
    float _175 = _167 + (-1.0);
    float _177 = in.m_30.x;
    float _179 = _175 * (*spvDescriptorSet0.vp_c6)._m0[8].y;
    float _181 = _175 * (*spvDescriptorSet0.vp_c6)._m0[8].x;
    float _183 = _175 * (*spvDescriptorSet0.vp_c6)._m0[8].z;
    float _185 = in.m_32.x;
    float _187 = in.m_32.y;
    float _189 = in.m_32.z;
    float _191 = in.m_34.x;
    float _193 = in.m_36.w;
    float _195 = in.m_36.x;
    float _197 = in.m_36.y;
    float _199 = in.m_36.z;
    float _201 = fma(_167, _171, _179);
    float _203 = fma(_167, _169, _181);
    float _205 = in.m_34.y;
    float _207 = fma(_167, _173, _183);
    float _209 = _201 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _211 = _201 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _213 = in.m_30.y;
    float _215 = fma(_203, (*spvDescriptorSet0.vp_c7)._m0[2].x, _209);
    float _217 = fma(_203, (*spvDescriptorSet0.vp_c7)._m0[0].x, _211);
    out.m_39.x = _177;
    float _219 = _187 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _221 = fma(_207, (*spvDescriptorSet0.vp_c7)._m0[2].z, _215);
    float _223 = fma(_207, (*spvDescriptorSet0.vp_c7)._m0[0].z, _217);
    out.m_41.z = _191;
    float _225 = fma(_185, (*spvDescriptorSet0.vp_c7)._m0[0].x, _219);
    float _227 = _221 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _229 = _223 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _231 = _187 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _233 = _187 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _237 = _227 + _235;
    out.m_43.w = _193;
    float _239 = _197 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _241 = fma(_185, (*spvDescriptorSet0.vp_c7)._m0[2].x, _233);
    float _243 = _197 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _245 = fma(_185, (*spvDescriptorSet0.vp_c7)._m0[1].x, _231);
    float _247 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _249 = _229 + _247;
    float _251 = _237 * _237;
    float _253 = fma(_195, (*spvDescriptorSet0.vp_c7)._m0[2].x, _239);
    float _255 = _197 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _257 = fma(_195, (*spvDescriptorSet0.vp_c7)._m0[0].x, _243);
    float _259 = fma(_249, _249, _251);
    float _261 = _201 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _263 = fma(_195, (*spvDescriptorSet0.vp_c7)._m0[1].x, _255);
    float _265 = fma(_189, (*spvDescriptorSet0.vp_c7)._m0[1].z, _245);
    out.m_41.w = _205;
    float _267 = fma(_189, (*spvDescriptorSet0.vp_c7)._m0[0].z, _225);
    float _269 = fma(_199, (*spvDescriptorSet0.vp_c7)._m0[1].z, _263);
    float _271 = _265 * _265;
    float _273 = fma(_203, (*spvDescriptorSet0.vp_c7)._m0[1].x, _261);
    float _275 = fma(_189, (*spvDescriptorSet0.vp_c7)._m0[2].z, _241);
    float _277 = fma(_199, (*spvDescriptorSet0.vp_c7)._m0[0].z, _257);
    float _279 = fma(_267, _267, _271);
    float _281 = sqrt(_259);
    float _283 = _269 * _269;
    float _285 = fma(_207, (*spvDescriptorSet0.vp_c7)._m0[1].z, _273);
    float _287 = fma(_275, _275, _279);
    float _289 = fma(_199, (*spvDescriptorSet0.vp_c7)._m0[2].z, _253);
    float _291 = fma(_277, _277, _283);
    float _293 = _285 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    out.m_39.y = _213;
    float _295 = rsqrt(_287);
    float _297 = _293 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _299 = fma(_229, (*spvDescriptorSet0.vp_c4)._m0[2].x, _297);
    float _301 = fma(_289, _289, _291);
    bool _303 = _281 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _305 = fma(_227, (*spvDescriptorSet0.vp_c4)._m0[2].z, _299);
    float _307 = rsqrt(_301);
    float _309 = _305 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _311 = _299;
    float _313 = _245;
    float _315 = _283;
    float _317 = _203;
    if (!_303)
    {
        _311 = _309;
    }
    float _319 = _311;
    float _321 = _319;
    if (!_303)
    {
        _313 = _229;
    }
    float _323 = _313;
    float _325 = _323;
    if (!_303)
    {
        _315 = _293;
    }
    float _327 = _315;
    float _329 = _327;
    if (!_303)
    {
        _317 = _227;
    }
    float _331 = _317;
    bool _333 = !_303;
    float _335 = _331;
    if (!_333)
    {
        float _337 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _339 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _341 = _281 + _339;
        float _343 = rsqrt(_259);
        float _345 = _341 * _337;
        float _347 = _293 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _349 = _345 * 0.15915493667125701904296875;
        float _351 = _349 * 6.283185482025146484375;
        float _353 = cos(_351);
        float _355 = _349 * 6.283185482025146484375;
        float _357 = sin(_355);
        float _359 = _353 + (-1.0);
        float _361 = fma(_357, _347, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _363 = _359 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _365 = _343 * _361;
        float _367 = fma(_293, _353, _363);
        float _369 = fma(_249, _365, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _371 = _367 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _373 = fma(_237, _365, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _375 = fma(_369, (*spvDescriptorSet0.vp_c4)._m0[2].x, _371);
        float _377 = fma(_373, (*spvDescriptorSet0.vp_c4)._m0[2].z, _375);
        float _379 = _377 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _329 = _367;
        _325 = _369;
        _335 = _373;
        _321 = _379;
    }
    float _381 = _329;
    float _383 = _325;
    float _385 = _335;
    float _387 = _321;
    float _389 = _267 * _295;
    float _391 = _265 * _295;
    float _393 = _277 * _307;
    float _395 = _269 * _307;
    float _397 = _289 * _307;
    float _399 = _381 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _401 = _381 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _403 = _275 * _295;
    float _405 = _293 * (*spvDescriptorSet0.vp_c4)._m0[42].y;
    out.m_45.x = _229;
    out.m_45.y = _293;
    out.m_45.z = _227;
    float _407 = fma(_383, (*spvDescriptorSet0.vp_c4)._m0[1].x, _401);
    float _409 = _293 * (*spvDescriptorSet0.vp_c4)._m0[43].y;
    float _411 = _293 * (*spvDescriptorSet0.vp_c4)._m0[44].y;
    float _413 = _293 * (*spvDescriptorSet0.vp_c4)._m0[45].y;
    float _415 = _293 * (*spvDescriptorSet0.vp_c4)._m0[46].y;
    float _417 = _293 * (*spvDescriptorSet0.vp_c4)._m0[47].y;
    float _419 = _293 * (*spvDescriptorSet0.vp_c4)._m0[48].y;
    float _421 = _293 * (*spvDescriptorSet0.vp_c4)._m0[49].y;
    float _423 = _293 * (*spvDescriptorSet0.vp_c4)._m0[50].y;
    float _425 = _293 * (*spvDescriptorSet0.vp_c4)._m0[51].y;
    float _427 = _293 * (*spvDescriptorSet0.vp_c4)._m0[52].y;
    float _429 = _293 * (*spvDescriptorSet0.vp_c4)._m0[53].y;
    float _431 = fma(_229, (*spvDescriptorSet0.vp_c4)._m0[42].x, _405);
    float _433 = fma(_383, (*spvDescriptorSet0.vp_c4)._m0[0].x, _399);
    float _435 = fma(_385, (*spvDescriptorSet0.vp_c4)._m0[1].z, _407);
    float _437 = fma(_229, (*spvDescriptorSet0.vp_c4)._m0[43].x, _409);
    float _439 = fma(_229, (*spvDescriptorSet0.vp_c4)._m0[44].x, _411);
    float _441 = fma(_229, (*spvDescriptorSet0.vp_c4)._m0[45].x, _413);
    float _443 = fma(_229, (*spvDescriptorSet0.vp_c4)._m0[53].x, _429);
    float _445 = fma(_385, (*spvDescriptorSet0.vp_c4)._m0[0].z, _433);
    float _447 = fma(_227, (*spvDescriptorSet0.vp_c4)._m0[42].z, _431);
    float _449 = _435 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _451 = fma(_229, (*spvDescriptorSet0.vp_c4)._m0[46].x, _415);
    float _453 = fma(_229, (*spvDescriptorSet0.vp_c4)._m0[47].x, _417);
    float _455 = fma(_229, (*spvDescriptorSet0.vp_c4)._m0[48].x, _419);
    float _457 = fma(_229, (*spvDescriptorSet0.vp_c4)._m0[49].x, _421);
    float _459 = fma(_229, (*spvDescriptorSet0.vp_c4)._m0[50].x, _423);
    float _461 = fma(_229, (*spvDescriptorSet0.vp_c4)._m0[51].x, _425);
    float _463 = fma(_229, (*spvDescriptorSet0.vp_c4)._m0[52].x, _427);
    out.m_47.x = _389;
    out.m_47.y = _391;
    out.m_47.z = _403;
    float _465 = fma(_227, (*spvDescriptorSet0.vp_c4)._m0[43].z, _437);
    float _467 = fma(_227, (*spvDescriptorSet0.vp_c4)._m0[44].z, _439);
    float _469 = fma(_227, (*spvDescriptorSet0.vp_c4)._m0[45].z, _441);
    out.m_43.x = _393;
    out.m_43.y = _395;
    out.m_43.z = _397;
    float _471 = fma(_227, (*spvDescriptorSet0.vp_c4)._m0[53].z, _443);
    float _473 = _445 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _475 = _449 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _477 = _449 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _479 = fma(_227, (*spvDescriptorSet0.vp_c4)._m0[46].z, _451);
    float _481 = fma(_227, (*spvDescriptorSet0.vp_c4)._m0[47].z, _453);
    float _483 = fma(_227, (*spvDescriptorSet0.vp_c4)._m0[48].z, _455);
    float _485 = _449 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _487 = fma(_227, (*spvDescriptorSet0.vp_c4)._m0[49].z, _457);
    float _489 = fma(_227, (*spvDescriptorSet0.vp_c4)._m0[50].z, _459);
    float _491 = _469 + (*spvDescriptorSet0.vp_c4)._m0[45].w;
    float _493 = _447 + (*spvDescriptorSet0.vp_c4)._m0[42].w;
    float _495 = _449 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _497 = _465 + (*spvDescriptorSet0.vp_c4)._m0[43].w;
    float _499 = _467 + (*spvDescriptorSet0.vp_c4)._m0[44].w;
    float _501 = fma(_227, (*spvDescriptorSet0.vp_c4)._m0[51].z, _461);
    float _503 = fma(_227, (*spvDescriptorSet0.vp_c4)._m0[52].z, _463);
    float _505 = fma(_473, (*spvDescriptorSet0.vp_c4)._m0[7].x, _475);
    float _507 = fma(_473, (*spvDescriptorSet0.vp_c4)._m0[8].x, _485);
    float _509 = fma(_473, (*spvDescriptorSet0.vp_c4)._m0[9].x, _477);
    float _511 = fma(_473, (*spvDescriptorSet0.vp_c4)._m0[10].x, _495);
    out.m_49.x = _493;
    out.m_49.y = _497;
    out.m_49.z = _499;
    out.m_49.w = _491;
    float _513 = fma(_387, (*spvDescriptorSet0.vp_c4)._m0[7].z, _505);
    float _515 = fma(_387, (*spvDescriptorSet0.vp_c4)._m0[8].z, _507);
    float _517 = -_309;
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[72].y;
    float _521 = _517 + _519;
    float _523 = _481 + (*spvDescriptorSet0.vp_c4)._m0[47].w;
    float _525 = _483 + (*spvDescriptorSet0.vp_c4)._m0[48].w;
    float _527 = _489 + (*spvDescriptorSet0.vp_c4)._m0[50].w;
    float _529 = _501 + (*spvDescriptorSet0.vp_c4)._m0[51].w;
    float _531 = _471 + (*spvDescriptorSet0.vp_c4)._m0[53].w;
    float _533 = _521 * (*spvDescriptorSet0.vp_c9)._m0[72].z;
    out.m_51.w = _309;
    float _535 = fma(_387, (*spvDescriptorSet0.vp_c4)._m0[9].z, _509);
    float _537 = fma(_387, (*spvDescriptorSet0.vp_c4)._m0[10].z, _511);
    float _539 = _479 + (*spvDescriptorSet0.vp_c4)._m0[46].w;
    float _541 = _487 + (*spvDescriptorSet0.vp_c4)._m0[49].w;
    float _543 = _503 + (*spvDescriptorSet0.vp_c4)._m0[52].w;
    float _545 = _513 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _547 = _515 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _549 = _535 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _551 = _537 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.m_53.x = _539;
    out.m_53.y = _523;
    out.m_53.z = _525;
    out.m_53.w = _541;
    out.m_55.x = _527;
    out.m_55.y = _529;
    out.m_55.z = _543;
    out.m_55.w = _531;
    out.m_47.w = _533;
    out.gl_Position.x = _545;
    out.gl_Position.y = _547;
    out.gl_Position.z = _549;
    out.gl_Position.w = _551;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_39 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    bool _137 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _69 = -(*spvDescriptorSet0.vp_c9)._m0[26].y;
    float _71 = (*spvDescriptorSet0.vp_c7)._m0[1].w + _69;
    float _73 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _75 = (*spvDescriptorSet0.vp_c7)._m0[0].w + _73;
    float _77 = _71 * _71;
    float _79 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _81 = (*spvDescriptorSet0.vp_c7)._m0[2].w + _79;
    float _83 = fma(_75, _75, _77);
    float _85 = fma(_81, _81, _83);
    float _87 = sqrt(_85);
    bool _91 = _87 >= (*spvDescriptorSet0.vp_c6)._m0[6].x;
    bool _93 = isnan(_87);
    bool _95 = _91 || _93;
    bool _97 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].x);
    bool _99 = _95 || _97;
    float _101 = _77;
    if (!_99)
    {
        _101 = 1.0;
    }
    float _103 = _101;
    bool _105 = !_99;
    float _107 = _103;
    if (!_105)
    {
        bool _109 = _87 >= (*spvDescriptorSet0.vp_c6)._m0[6].y;
        bool _111 = isnan(_87);
        bool _113 = _109 || _111;
        bool _115 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].y);
        bool _117 = _113 || _115;
        if (!_117)
        {
            float _119 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _121 = _87 + _119;
            float _123 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _125 = (*spvDescriptorSet0.vp_c6)._m0[6].y + _123;
            float _127 = -(*spvDescriptorSet0.vp_c6)._m0[7].x;
            float _129 = _127 + (*spvDescriptorSet0.vp_c6)._m0[7].y;
            float _131 = 1.0 / _125;
            float _133 = _121 * _131;
            float _135 = fma(_133, _129, (*spvDescriptorSet0.vp_c6)._m0[7].x);
            _107 = _135;
            _137 = true;
        }
        else
        {
            bool _139 = _87 >= (*spvDescriptorSet0.vp_c6)._m0[6].z;
            bool _141 = isnan(_87);
            bool _143 = _139 || _141;
            bool _145 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].z);
            bool _147 = _143 || _145;
            if (!_147)
            {
                float _149 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _151 = _87 + _149;
                float _153 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _155 = _153 + (*spvDescriptorSet0.vp_c6)._m0[6].z;
                float _157 = -(*spvDescriptorSet0.vp_c6)._m0[7].y;
                float _159 = _157 + (*spvDescriptorSet0.vp_c6)._m0[7].z;
                float _161 = 1.0 / _155;
                float _163 = _151 * _161;
                float _165 = fma(_163, _159, (*spvDescriptorSet0.vp_c6)._m0[7].y);
                _107 = _165;
                _137 = true;
            }
            else
            {
                _107 = (*spvDescriptorSet0.vp_c6)._m0[7].z;
            }
        }
    }
    _137 = false;
    float _167 = _107;
    float _169 = in.m_28.x;
    float _171 = in.m_28.y;
    float _173 = in.m_28.z;
    float _175 = _167 + (-1.0);
    float _177 = in.m_30.x;
    float _179 = _175 * (*spvDescriptorSet0.vp_c6)._m0[8].y;
    float _181 = _175 * (*spvDescriptorSet0.vp_c6)._m0[8].x;
    float _183 = _175 * (*spvDescriptorSet0.vp_c6)._m0[8].z;
    float _185 = in.m_32.x;
    float _187 = in.m_32.y;
    float _189 = in.m_32.z;
    float _191 = in.m_34.x;
    float _193 = in.m_36.w;
    float _195 = in.m_36.x;
    float _197 = in.m_36.y;
    float _199 = in.m_36.z;
    float _201 = fma(_167, _171, _179);
    float _203 = fma(_167, _169, _181);
    float _205 = in.m_34.y;
    float _207 = fma(_167, _173, _183);
    float _209 = _201 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _211 = _201 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _213 = in.m_30.y;
    float _215 = fma(_203, (*spvDescriptorSet0.vp_c7)._m0[2].x, _209);
    float _217 = fma(_203, (*spvDescriptorSet0.vp_c7)._m0[0].x, _211);
    out.m_39.x = _177;
    float _219 = _187 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _221 = fma(_207, (*spvDescriptorSet0.vp_c7)._m0[2].z, _215);
    float _223 = fma(_207, (*spvDescriptorSet0.vp_c7)._m0[0].z, _217);
    out.m_41.z = _191;
    float _225 = fma(_185, (*spvDescriptorSet0.vp_c7)._m0[0].x, _219);
    float _227 = _221 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _229 = _223 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _231 = _187 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _233 = _187 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _237 = _227 + _235;
    out.m_43.w = _193;
    float _239 = _197 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _241 = fma(_185, (*spvDescriptorSet0.vp_c7)._m0[2].x, _233);
    float _243 = _197 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _245 = fma(_185, (*spvDescriptorSet0.vp_c7)._m0[1].x, _231);
    float _247 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _249 = _229 + _247;
    float _251 = _237 * _237;
    float _253 = fma(_195, (*spvDescriptorSet0.vp_c7)._m0[2].x, _239);
    float _255 = _197 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _257 = fma(_195, (*spvDescriptorSet0.vp_c7)._m0[0].x, _243);
    float _259 = fma(_249, _249, _251);
    float _261 = _201 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _263 = fma(_195, (*spvDescriptorSet0.vp_c7)._m0[1].x, _255);
    float _265 = fma(_189, (*spvDescriptorSet0.vp_c7)._m0[1].z, _245);
    out.m_41.w = _205;
    float _267 = fma(_189, (*spvDescriptorSet0.vp_c7)._m0[0].z, _225);
    float _269 = fma(_199, (*spvDescriptorSet0.vp_c7)._m0[1].z, _263);
    float _271 = _265 * _265;
    float _273 = fma(_203, (*spvDescriptorSet0.vp_c7)._m0[1].x, _261);
    float _275 = fma(_189, (*spvDescriptorSet0.vp_c7)._m0[2].z, _241);
    float _277 = fma(_199, (*spvDescriptorSet0.vp_c7)._m0[0].z, _257);
    float _279 = fma(_267, _267, _271);
    float _281 = sqrt(_259);
    float _283 = _269 * _269;
    float _285 = fma(_207, (*spvDescriptorSet0.vp_c7)._m0[1].z, _273);
    float _287 = fma(_275, _275, _279);
    float _289 = fma(_199, (*spvDescriptorSet0.vp_c7)._m0[2].z, _253);
    float _291 = fma(_277, _277, _283);
    float _293 = _285 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    out.m_39.y = _213;
    float _295 = rsqrt(_287);
    float _297 = _293 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _299 = fma(_229, (*spvDescriptorSet0.vp_c4)._m0[2].x, _297);
    float _301 = fma(_289, _289, _291);
    bool _303 = _281 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _305 = fma(_227, (*spvDescriptorSet0.vp_c4)._m0[2].z, _299);
    float _307 = rsqrt(_301);
    float _309 = _305 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _311 = _299;
    float _313 = _245;
    float _315 = _283;
    float _317 = _203;
    if (!_303)
    {
        _311 = _309;
    }
    float _319 = _311;
    float _321 = _319;
    if (!_303)
    {
        _313 = _229;
    }
    float _323 = _313;
    float _325 = _323;
    if (!_303)
    {
        _315 = _293;
    }
    float _327 = _315;
    float _329 = _327;
    if (!_303)
    {
        _317 = _227;
    }
    float _331 = _317;
    bool _333 = !_303;
    float _335 = _331;
    if (!_333)
    {
        float _337 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _339 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _341 = _281 + _339;
        float _343 = rsqrt(_259);
        float _345 = _341 * _337;
        float _347 = _293 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _349 = _345 * 0.15915493667125701904296875;
        float _351 = _349 * 6.283185482025146484375;
        float _353 = cos(_351);
        float _355 = _349 * 6.283185482025146484375;
        float _357 = sin(_355);
        float _359 = _353 + (-1.0);
        float _361 = fma(_357, _347, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _363 = _359 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _365 = _343 * _361;
        float _367 = fma(_293, _353, _363);
        float _369 = fma(_249, _365, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _371 = _367 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _373 = fma(_237, _365, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _375 = fma(_369, (*spvDescriptorSet0.vp_c4)._m0[2].x, _371);
        float _377 = fma(_373, (*spvDescriptorSet0.vp_c4)._m0[2].z, _375);
        float _379 = _377 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _329 = _367;
        _325 = _369;
        _335 = _373;
        _321 = _379;
    }
    float _381 = _329;
    float _383 = _325;
    float _385 = _335;
    float _387 = _321;
    float _389 = _267 * _295;
    float _391 = _265 * _295;
    float _393 = _277 * _307;
    float _395 = _269 * _307;
    float _397 = _289 * _307;
    float _399 = _381 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _401 = _381 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _403 = _275 * _295;
    float _405 = _293 * (*spvDescriptorSet0.vp_c4)._m0[42].y;
    out.m_45.x = _229;
    out.m_45.y = _293;
    out.m_45.z = _227;
    float _407 = fma(_383, (*spvDescriptorSet0.vp_c4)._m0[1].x, _401);
    float _409 = _293 * (*spvDescriptorSet0.vp_c4)._m0[43].y;
    float _411 = _293 * (*spvDescriptorSet0.vp_c4)._m0[44].y;
    float _413 = _293 * (*spvDescriptorSet0.vp_c4)._m0[45].y;
    float _415 = _293 * (*spvDescriptorSet0.vp_c4)._m0[46].y;
    float _417 = _293 * (*spvDescriptorSet0.vp_c4)._m0[47].y;
    float _419 = _293 * (*spvDescriptorSet0.vp_c4)._m0[48].y;
    float _421 = _293 * (*spvDescriptorSet0.vp_c4)._m0[49].y;
    float _423 = _293 * (*spvDescriptorSet0.vp_c4)._m0[50].y;
    float _425 = _293 * (*spvDescriptorSet0.vp_c4)._m0[51].y;
    float _427 = _293 * (*spvDescriptorSet0.vp_c4)._m0[52].y;
    float _429 = _293 * (*spvDescriptorSet0.vp_c4)._m0[53].y;
    float _431 = fma(_229, (*spvDescriptorSet0.vp_c4)._m0[42].x, _405);
    float _433 = fma(_383, (*spvDescriptorSet0.vp_c4)._m0[0].x, _399);
    float _435 = fma(_385, (*spvDescriptorSet0.vp_c4)._m0[1].z, _407);
    float _437 = fma(_229, (*spvDescriptorSet0.vp_c4)._m0[43].x, _409);
    float _439 = fma(_229, (*spvDescriptorSet0.vp_c4)._m0[44].x, _411);
    float _441 = fma(_229, (*spvDescriptorSet0.vp_c4)._m0[45].x, _413);
    float _443 = fma(_229, (*spvDescriptorSet0.vp_c4)._m0[53].x, _429);
    float _445 = fma(_385, (*spvDescriptorSet0.vp_c4)._m0[0].z, _433);
    float _447 = fma(_227, (*spvDescriptorSet0.vp_c4)._m0[42].z, _431);
    float _449 = _435 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _451 = fma(_229, (*spvDescriptorSet0.vp_c4)._m0[46].x, _415);
    float _453 = fma(_229, (*spvDescriptorSet0.vp_c4)._m0[47].x, _417);
    float _455 = fma(_229, (*spvDescriptorSet0.vp_c4)._m0[48].x, _419);
    float _457 = fma(_229, (*spvDescriptorSet0.vp_c4)._m0[49].x, _421);
    float _459 = fma(_229, (*spvDescriptorSet0.vp_c4)._m0[50].x, _423);
    float _461 = fma(_229, (*spvDescriptorSet0.vp_c4)._m0[51].x, _425);
    float _463 = fma(_229, (*spvDescriptorSet0.vp_c4)._m0[52].x, _427);
    out.m_47.x = _389;
    out.m_47.y = _391;
    out.m_47.z = _403;
    float _465 = fma(_227, (*spvDescriptorSet0.vp_c4)._m0[43].z, _437);
    float _467 = fma(_227, (*spvDescriptorSet0.vp_c4)._m0[44].z, _439);
    float _469 = fma(_227, (*spvDescriptorSet0.vp_c4)._m0[45].z, _441);
    out.m_43.x = _393;
    out.m_43.y = _395;
    out.m_43.z = _397;
    float _471 = fma(_227, (*spvDescriptorSet0.vp_c4)._m0[53].z, _443);
    float _473 = _445 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _475 = _449 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _477 = _449 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _479 = fma(_227, (*spvDescriptorSet0.vp_c4)._m0[46].z, _451);
    float _481 = fma(_227, (*spvDescriptorSet0.vp_c4)._m0[47].z, _453);
    float _483 = fma(_227, (*spvDescriptorSet0.vp_c4)._m0[48].z, _455);
    float _485 = _449 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _487 = fma(_227, (*spvDescriptorSet0.vp_c4)._m0[49].z, _457);
    float _489 = fma(_227, (*spvDescriptorSet0.vp_c4)._m0[50].z, _459);
    float _491 = _469 + (*spvDescriptorSet0.vp_c4)._m0[45].w;
    float _493 = _447 + (*spvDescriptorSet0.vp_c4)._m0[42].w;
    float _495 = _449 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _497 = _465 + (*spvDescriptorSet0.vp_c4)._m0[43].w;
    float _499 = _467 + (*spvDescriptorSet0.vp_c4)._m0[44].w;
    float _501 = fma(_227, (*spvDescriptorSet0.vp_c4)._m0[51].z, _461);
    float _503 = fma(_227, (*spvDescriptorSet0.vp_c4)._m0[52].z, _463);
    float _505 = fma(_473, (*spvDescriptorSet0.vp_c4)._m0[7].x, _475);
    float _507 = fma(_473, (*spvDescriptorSet0.vp_c4)._m0[8].x, _485);
    float _509 = fma(_473, (*spvDescriptorSet0.vp_c4)._m0[9].x, _477);
    float _511 = fma(_473, (*spvDescriptorSet0.vp_c4)._m0[10].x, _495);
    out.m_49.x = _493;
    out.m_49.y = _497;
    out.m_49.z = _499;
    out.m_49.w = _491;
    float _513 = fma(_387, (*spvDescriptorSet0.vp_c4)._m0[7].z, _505);
    float _515 = fma(_387, (*spvDescriptorSet0.vp_c4)._m0[8].z, _507);
    float _517 = -_309;
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[72].y;
    float _521 = _517 + _519;
    float _523 = _481 + (*spvDescriptorSet0.vp_c4)._m0[47].w;
    float _525 = _483 + (*spvDescriptorSet0.vp_c4)._m0[48].w;
    float _527 = _489 + (*spvDescriptorSet0.vp_c4)._m0[50].w;
    float _529 = _501 + (*spvDescriptorSet0.vp_c4)._m0[51].w;
    float _531 = _471 + (*spvDescriptorSet0.vp_c4)._m0[53].w;
    float _533 = _521 * (*spvDescriptorSet0.vp_c9)._m0[72].z;
    out.m_51.w = _309;
    float _535 = fma(_387, (*spvDescriptorSet0.vp_c4)._m0[9].z, _509);
    float _537 = fma(_387, (*spvDescriptorSet0.vp_c4)._m0[10].z, _511);
    float _539 = _479 + (*spvDescriptorSet0.vp_c4)._m0[46].w;
    float _541 = _487 + (*spvDescriptorSet0.vp_c4)._m0[49].w;
    float _543 = _503 + (*spvDescriptorSet0.vp_c4)._m0[52].w;
    float _545 = _513 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _547 = _515 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _549 = _535 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _551 = _537 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.m_53.x = _539;
    out.m_53.y = _523;
    out.m_53.z = _525;
    out.m_53.w = _541;
    out.m_55.x = _527;
    out.m_55.y = _529;
    out.m_55.z = _543;
    out.m_55.w = _531;
    out.m_47.w = _533;
    out.gl_Position.x = _545;
    out.gl_Position.y = _547;
    out.gl_Position.z = _549;
    out.gl_Position.w = _551;
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
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    bool _137 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _69 = -(*spvDescriptorSet0.vp_c9)._m0[26].y;
    float _71 = (*spvDescriptorSet0.vp_c7)._m0[1].w + _69;
    float _73 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _75 = (*spvDescriptorSet0.vp_c7)._m0[0].w + _73;
    float _77 = _71 * _71;
    float _79 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _81 = (*spvDescriptorSet0.vp_c7)._m0[2].w + _79;
    float _83 = fma(_75, _75, _77);
    float _85 = fma(_81, _81, _83);
    float _87 = sqrt(_85);
    bool _91 = _87 >= (*spvDescriptorSet0.vp_c6)._m0[6].x;
    bool _93 = isnan(_87);
    bool _95 = _91 || _93;
    bool _97 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].x);
    bool _99 = _95 || _97;
    float _101 = _77;
    if (!_99)
    {
        _101 = 1.0;
    }
    float _103 = _101;
    bool _105 = !_99;
    float _107 = _103;
    if (!_105)
    {
        bool _109 = _87 >= (*spvDescriptorSet0.vp_c6)._m0[6].y;
        bool _111 = isnan(_87);
        bool _113 = _109 || _111;
        bool _115 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].y);
        bool _117 = _113 || _115;
        if (!_117)
        {
            float _119 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _121 = _87 + _119;
            float _123 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _125 = (*spvDescriptorSet0.vp_c6)._m0[6].y + _123;
            float _127 = -(*spvDescriptorSet0.vp_c6)._m0[7].x;
            float _129 = _127 + (*spvDescriptorSet0.vp_c6)._m0[7].y;
            float _131 = 1.0 / _125;
            float _133 = _121 * _131;
            float _135 = fma(_133, _129, (*spvDescriptorSet0.vp_c6)._m0[7].x);
            _107 = _135;
            _137 = true;
        }
        else
        {
            bool _139 = _87 >= (*spvDescriptorSet0.vp_c6)._m0[6].z;
            bool _141 = isnan(_87);
            bool _143 = _139 || _141;
            bool _145 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].z);
            bool _147 = _143 || _145;
            if (!_147)
            {
                float _149 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _151 = _87 + _149;
                float _153 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _155 = _153 + (*spvDescriptorSet0.vp_c6)._m0[6].z;
                float _157 = -(*spvDescriptorSet0.vp_c6)._m0[7].y;
                float _159 = _157 + (*spvDescriptorSet0.vp_c6)._m0[7].z;
                float _161 = 1.0 / _155;
                float _163 = _151 * _161;
                float _165 = fma(_163, _159, (*spvDescriptorSet0.vp_c6)._m0[7].y);
                _107 = _165;
                _137 = true;
            }
            else
            {
                _107 = (*spvDescriptorSet0.vp_c6)._m0[7].z;
            }
        }
    }
    _137 = false;
    float _167 = _107;
    float _169 = in.m_28.x;
    float _171 = in.m_28.y;
    float _173 = in.m_28.z;
    float _175 = _167 + (-1.0);
    float _177 = in.m_30.x;
    float _179 = _175 * (*spvDescriptorSet0.vp_c6)._m0[8].y;
    float _181 = _175 * (*spvDescriptorSet0.vp_c6)._m0[8].x;
    float _183 = _175 * (*spvDescriptorSet0.vp_c6)._m0[8].z;
    float _185 = in.m_32.x;
    float _187 = in.m_32.y;
    float _189 = in.m_32.z;
    float _191 = in.m_34.x;
    float _193 = in.m_36.w;
    float _195 = in.m_36.x;
    float _197 = in.m_36.y;
    float _199 = in.m_36.z;
    float _201 = fma(_167, _171, _179);
    float _203 = fma(_167, _169, _181);
    float _205 = in.m_34.y;
    float _207 = fma(_167, _173, _183);
    float _209 = _201 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _211 = _201 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _213 = in.m_30.y;
    float _215 = fma(_203, (*spvDescriptorSet0.vp_c7)._m0[2].x, _209);
    float _217 = fma(_203, (*spvDescriptorSet0.vp_c7)._m0[0].x, _211);
    out.m_39.x = _177;
    float _219 = _187 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _221 = fma(_207, (*spvDescriptorSet0.vp_c7)._m0[2].z, _215);
    float _223 = fma(_207, (*spvDescriptorSet0.vp_c7)._m0[0].z, _217);
    out.m_41.z = _191;
    float _225 = fma(_185, (*spvDescriptorSet0.vp_c7)._m0[0].x, _219);
    float _227 = _221 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _229 = _223 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _231 = _187 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _233 = _187 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _237 = _227 + _235;
    out.m_43.w = _193;
    float _239 = _197 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _241 = fma(_185, (*spvDescriptorSet0.vp_c7)._m0[2].x, _233);
    float _243 = _197 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _245 = fma(_185, (*spvDescriptorSet0.vp_c7)._m0[1].x, _231);
    float _247 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _249 = _229 + _247;
    float _251 = _237 * _237;
    float _253 = fma(_195, (*spvDescriptorSet0.vp_c7)._m0[2].x, _239);
    float _255 = _197 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _257 = fma(_195, (*spvDescriptorSet0.vp_c7)._m0[0].x, _243);
    float _259 = fma(_249, _249, _251);
    float _261 = _201 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _263 = fma(_195, (*spvDescriptorSet0.vp_c7)._m0[1].x, _255);
    float _265 = fma(_189, (*spvDescriptorSet0.vp_c7)._m0[1].z, _245);
    out.m_41.w = _205;
    float _267 = fma(_189, (*spvDescriptorSet0.vp_c7)._m0[0].z, _225);
    float _269 = fma(_199, (*spvDescriptorSet0.vp_c7)._m0[1].z, _263);
    float _271 = _265 * _265;
    float _273 = fma(_203, (*spvDescriptorSet0.vp_c7)._m0[1].x, _261);
    float _275 = fma(_189, (*spvDescriptorSet0.vp_c7)._m0[2].z, _241);
    float _277 = fma(_199, (*spvDescriptorSet0.vp_c7)._m0[0].z, _257);
    float _279 = fma(_267, _267, _271);
    float _281 = sqrt(_259);
    float _283 = _269 * _269;
    float _285 = fma(_207, (*spvDescriptorSet0.vp_c7)._m0[1].z, _273);
    float _287 = fma(_275, _275, _279);
    float _289 = fma(_199, (*spvDescriptorSet0.vp_c7)._m0[2].z, _253);
    float _291 = fma(_277, _277, _283);
    float _293 = _285 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    out.m_39.y = _213;
    float _295 = rsqrt(_287);
    float _297 = _293 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _299 = fma(_229, (*spvDescriptorSet0.vp_c4)._m0[2].x, _297);
    float _301 = fma(_289, _289, _291);
    bool _303 = _281 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _305 = fma(_227, (*spvDescriptorSet0.vp_c4)._m0[2].z, _299);
    float _307 = rsqrt(_301);
    float _309 = _305 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _311 = _299;
    float _313 = _245;
    float _315 = _283;
    float _317 = _203;
    if (!_303)
    {
        _311 = _309;
    }
    float _319 = _311;
    float _321 = _319;
    if (!_303)
    {
        _313 = _229;
    }
    float _323 = _313;
    float _325 = _323;
    if (!_303)
    {
        _315 = _293;
    }
    float _327 = _315;
    float _329 = _327;
    if (!_303)
    {
        _317 = _227;
    }
    float _331 = _317;
    bool _333 = !_303;
    float _335 = _331;
    if (!_333)
    {
        float _337 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _339 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _341 = _281 + _339;
        float _343 = rsqrt(_259);
        float _345 = _341 * _337;
        float _347 = _293 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _349 = _345 * 0.15915493667125701904296875;
        float _351 = _349 * 6.283185482025146484375;
        float _353 = cos(_351);
        float _355 = _349 * 6.283185482025146484375;
        float _357 = sin(_355);
        float _359 = _353 + (-1.0);
        float _361 = fma(_357, _347, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _363 = _359 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _365 = _343 * _361;
        float _367 = fma(_293, _353, _363);
        float _369 = fma(_249, _365, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _371 = _367 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _373 = fma(_237, _365, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _375 = fma(_369, (*spvDescriptorSet0.vp_c4)._m0[2].x, _371);
        float _377 = fma(_373, (*spvDescriptorSet0.vp_c4)._m0[2].z, _375);
        float _379 = _377 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _329 = _367;
        _325 = _369;
        _335 = _373;
        _321 = _379;
    }
    float _381 = _329;
    float _383 = _325;
    float _385 = _335;
    float _387 = _321;
    float _389 = _267 * _295;
    float _391 = _265 * _295;
    float _393 = _277 * _307;
    float _395 = _269 * _307;
    float _397 = _289 * _307;
    float _399 = _381 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _401 = _381 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _403 = _275 * _295;
    float _405 = _293 * (*spvDescriptorSet0.vp_c4)._m0[42].y;
    out.m_45.x = _229;
    out.m_45.y = _293;
    out.m_45.z = _227;
    float _407 = fma(_383, (*spvDescriptorSet0.vp_c4)._m0[1].x, _401);
    float _409 = _293 * (*spvDescriptorSet0.vp_c4)._m0[43].y;
    float _411 = _293 * (*spvDescriptorSet0.vp_c4)._m0[44].y;
    float _413 = _293 * (*spvDescriptorSet0.vp_c4)._m0[45].y;
    float _415 = _293 * (*spvDescriptorSet0.vp_c4)._m0[46].y;
    float _417 = _293 * (*spvDescriptorSet0.vp_c4)._m0[47].y;
    float _419 = _293 * (*spvDescriptorSet0.vp_c4)._m0[48].y;
    float _421 = _293 * (*spvDescriptorSet0.vp_c4)._m0[49].y;
    float _423 = _293 * (*spvDescriptorSet0.vp_c4)._m0[50].y;
    float _425 = _293 * (*spvDescriptorSet0.vp_c4)._m0[51].y;
    float _427 = _293 * (*spvDescriptorSet0.vp_c4)._m0[52].y;
    float _429 = _293 * (*spvDescriptorSet0.vp_c4)._m0[53].y;
    float _431 = fma(_229, (*spvDescriptorSet0.vp_c4)._m0[42].x, _405);
    float _433 = fma(_383, (*spvDescriptorSet0.vp_c4)._m0[0].x, _399);
    float _435 = fma(_385, (*spvDescriptorSet0.vp_c4)._m0[1].z, _407);
    float _437 = fma(_229, (*spvDescriptorSet0.vp_c4)._m0[43].x, _409);
    float _439 = fma(_229, (*spvDescriptorSet0.vp_c4)._m0[44].x, _411);
    float _441 = fma(_229, (*spvDescriptorSet0.vp_c4)._m0[45].x, _413);
    float _443 = fma(_229, (*spvDescriptorSet0.vp_c4)._m0[53].x, _429);
    float _445 = fma(_385, (*spvDescriptorSet0.vp_c4)._m0[0].z, _433);
    float _447 = fma(_227, (*spvDescriptorSet0.vp_c4)._m0[42].z, _431);
    float _449 = _435 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _451 = fma(_229, (*spvDescriptorSet0.vp_c4)._m0[46].x, _415);
    float _453 = fma(_229, (*spvDescriptorSet0.vp_c4)._m0[47].x, _417);
    float _455 = fma(_229, (*spvDescriptorSet0.vp_c4)._m0[48].x, _419);
    float _457 = fma(_229, (*spvDescriptorSet0.vp_c4)._m0[49].x, _421);
    float _459 = fma(_229, (*spvDescriptorSet0.vp_c4)._m0[50].x, _423);
    float _461 = fma(_229, (*spvDescriptorSet0.vp_c4)._m0[51].x, _425);
    float _463 = fma(_229, (*spvDescriptorSet0.vp_c4)._m0[52].x, _427);
    out.m_47.x = _389;
    out.m_47.y = _391;
    out.m_47.z = _403;
    float _465 = fma(_227, (*spvDescriptorSet0.vp_c4)._m0[43].z, _437);
    float _467 = fma(_227, (*spvDescriptorSet0.vp_c4)._m0[44].z, _439);
    float _469 = fma(_227, (*spvDescriptorSet0.vp_c4)._m0[45].z, _441);
    out.m_43.x = _393;
    out.m_43.y = _395;
    out.m_43.z = _397;
    float _471 = fma(_227, (*spvDescriptorSet0.vp_c4)._m0[53].z, _443);
    float _473 = _445 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _475 = _449 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _477 = _449 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _479 = fma(_227, (*spvDescriptorSet0.vp_c4)._m0[46].z, _451);
    float _481 = fma(_227, (*spvDescriptorSet0.vp_c4)._m0[47].z, _453);
    float _483 = fma(_227, (*spvDescriptorSet0.vp_c4)._m0[48].z, _455);
    float _485 = _449 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _487 = fma(_227, (*spvDescriptorSet0.vp_c4)._m0[49].z, _457);
    float _489 = fma(_227, (*spvDescriptorSet0.vp_c4)._m0[50].z, _459);
    float _491 = _469 + (*spvDescriptorSet0.vp_c4)._m0[45].w;
    float _493 = _447 + (*spvDescriptorSet0.vp_c4)._m0[42].w;
    float _495 = _449 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _497 = _465 + (*spvDescriptorSet0.vp_c4)._m0[43].w;
    float _499 = _467 + (*spvDescriptorSet0.vp_c4)._m0[44].w;
    float _501 = fma(_227, (*spvDescriptorSet0.vp_c4)._m0[51].z, _461);
    float _503 = fma(_227, (*spvDescriptorSet0.vp_c4)._m0[52].z, _463);
    float _505 = fma(_473, (*spvDescriptorSet0.vp_c4)._m0[7].x, _475);
    float _507 = fma(_473, (*spvDescriptorSet0.vp_c4)._m0[8].x, _485);
    float _509 = fma(_473, (*spvDescriptorSet0.vp_c4)._m0[9].x, _477);
    float _511 = fma(_473, (*spvDescriptorSet0.vp_c4)._m0[10].x, _495);
    out.m_49.x = _493;
    out.m_49.y = _497;
    out.m_49.z = _499;
    out.m_49.w = _491;
    float _513 = fma(_387, (*spvDescriptorSet0.vp_c4)._m0[7].z, _505);
    float _515 = fma(_387, (*spvDescriptorSet0.vp_c4)._m0[8].z, _507);
    float _517 = -_309;
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[72].y;
    float _521 = _517 + _519;
    float _523 = _481 + (*spvDescriptorSet0.vp_c4)._m0[47].w;
    float _525 = _483 + (*spvDescriptorSet0.vp_c4)._m0[48].w;
    float _527 = _489 + (*spvDescriptorSet0.vp_c4)._m0[50].w;
    float _529 = _501 + (*spvDescriptorSet0.vp_c4)._m0[51].w;
    float _531 = _471 + (*spvDescriptorSet0.vp_c4)._m0[53].w;
    float _533 = _521 * (*spvDescriptorSet0.vp_c9)._m0[72].z;
    out.m_51.w = _309;
    float _535 = fma(_387, (*spvDescriptorSet0.vp_c4)._m0[9].z, _509);
    float _537 = fma(_387, (*spvDescriptorSet0.vp_c4)._m0[10].z, _511);
    float _539 = _479 + (*spvDescriptorSet0.vp_c4)._m0[46].w;
    float _541 = _487 + (*spvDescriptorSet0.vp_c4)._m0[49].w;
    float _543 = _503 + (*spvDescriptorSet0.vp_c4)._m0[52].w;
    float _545 = _513 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _547 = _515 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _549 = _535 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _551 = _537 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.m_53.x = _539;
    out.m_53.y = _523;
    out.m_53.z = _525;
    out.m_53.w = _541;
    out.m_55.x = _527;
    out.m_55.y = _529;
    out.m_55.z = _543;
    out.m_55.w = _531;
    out.m_47.w = _533;
    out.gl_Position.x = _545;
    out.gl_Position.y = _547;
    out.gl_Position.z = _549;
    out.gl_Position.w = _551;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_39.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_39.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_39.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_39.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

