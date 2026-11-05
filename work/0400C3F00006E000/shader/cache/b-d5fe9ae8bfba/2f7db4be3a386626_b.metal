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
    constant _16* vp_c3 [[id(0)]];
    constant _16* vp_c4 [[id(1)]];
};

struct main0_out
{
    float4 m_29 [[user(locn0)]];
    float4 m_31 [[user(locn1)]];
    float4 m_27 [[user(locn2)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

vertex main0_out main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_27 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _45 = as_type<float>(int(gl_VertexIndex));
    uint _48 = uint(int(uint(as_type<int>(_45)) >> uint(16)));
    int _51 = 61 ^ as_type<int>(_45);
    int _53 = int(_48) ^ _51;
    int _55 = _53 << 3;
    int _57 = _55 + _53;
    uint _59 = uint(int(uint(_57) >> uint(4)));
    int _61 = _57 ^ int(_59);
    int _63 = _61 * 668265261;
    uint _65 = uint(int(uint(_63) >> uint(15)));
    int _67 = _63 ^ int(_65);
    int _69 = _67 << 13;
    int _71 = _67 ^ _69;
    uint _73 = uint(int(uint(_71) >> uint(17)));
    int _75 = _71 ^ int(_73);
    int _77 = _75 << 5;
    int _79 = _75 ^ _77;
    int _81 = _79 << 13;
    int _83 = _79 ^ _81;
    float _85 = float(uint(_79));
    uint _87 = uint(int(uint(_83) >> uint(17)));
    float _89 = _85 * 2.3283064365386962890625e-10;
    float _91 = precise::clamp(_89, 0.0, 1.0);
    int _93 = _83 ^ int(_87);
    int _95 = _93 << 5;
    float _97 = precise::max(_91, 9.9999997473787516355514526367188e-05);
    int _99 = _93 ^ _95;
    int _101 = _99 << 13;
    float _103 = log2(_97);
    int _105 = _99 ^ _101;
    float _107 = float(uint(_99));
    uint _109 = uint(int(uint(_105) >> uint(17)));
    float _111 = _107 * 2.3283064365386962890625e-10;
    float _113 = precise::clamp(_111, 0.0, 1.0);
    int _115 = _105 ^ int(_109);
    int _117 = _115 << 5;
    float _119 = _103 * (-1.38629436492919921875);
    int _121 = _115 ^ _117;
    int _123 = _121 << 13;
    int _125 = _121 ^ _123;
    float _127 = precise::max(_113, 9.9999997473787516355514526367188e-05);
    uint _129 = uint(int(uint(_125) >> uint(17)));
    float _131 = sqrt(_119);
    float _133 = float(uint(_121));
    float _135 = _127 * 6.283185482025146484375;
    int _137 = _125 ^ int(_129);
    float _139 = _135 * 0.15915493667125701904296875;
    int _141 = _137 << 5;
    float _143 = log2(_127);
    float _145 = _133 * 2.3283064365386962890625e-10;
    float _147 = precise::clamp(_145, 0.0, 1.0);
    int _149 = _137 ^ _141;
    float _151 = precise::max(_147, 9.9999997473787516355514526367188e-05);
    int _153 = _149 << 13;
    float _155 = _139 * 6.283185482025146484375;
    float _157 = cos(_155);
    float _159 = _151 * 6.283185482025146484375;
    int _161 = _149 ^ _153;
    float _163 = float(uint(_149));
    uint _165 = uint(int(uint(_161) >> uint(17)));
    float _167 = _143 * (-1.38629436492919921875);
    float _169 = _163 * 2.3283064365386962890625e-10;
    float _171 = precise::clamp(_169, 0.0, 1.0);
    int _173 = _161 ^ int(_165);
    int _175 = _173 << 5;
    float _177 = _131 * _157;
    int _179 = _173 ^ _175;
    float _181 = fma(_177, (*spvDescriptorSet0.vp_c3)._m0[8].y, 0.5);
    float _183 = precise::clamp(_181, 0.0, 1.0);
    float _185 = float(uint(_179));
    float _187 = abs(_183);
    float _189 = log2(_187);
    float _191 = fma(_171, 2.0, -1.0);
    float _193 = _185 * 2.3283064365386962890625e-10;
    float _195 = precise::clamp(_193, 0.0, 1.0);
    float _197 = -_191;
    float _199 = fma(_197, _191, 1.0);
    float _201 = _195 * 6.283185482025146484375;
    float _203 = _191 * (*spvDescriptorSet0.vp_c3)._m0[11].x;
    float _205 = _201 * 0.15915493667125701904296875;
    float _207 = sqrt(_199);
    float _209 = _189 * (*spvDescriptorSet0.vp_c3)._m0[8].x;
    float _211 = _205 * 6.283185482025146484375;
    float _213 = sin(_211);
    float _215 = _205 * 6.283185482025146484375;
    float _217 = cos(_215);
    float _219 = exp2(_209);
    float _221 = _207 * _213;
    float _223 = _221 * (*spvDescriptorSet0.vp_c3)._m0[11].z;
    float _225 = _221 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _227 = _207 * _217;
    float _229 = -_223;
    float _231 = fma(_191, (*spvDescriptorSet0.vp_c3)._m0[11].y, _229);
    float _233 = -_203;
    float _235 = fma(_227, (*spvDescriptorSet0.vp_c3)._m0[11].z, _233);
    float _237 = fma(_227, (*spvDescriptorSet0.vp_c3)._m0[11].w, _231);
    float _239 = fma(_219, 14200.0, 1800.0);
    float _241 = _227 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _243 = fma(_221, (*spvDescriptorSet0.vp_c3)._m0[11].w, _235);
    float _245 = -(*spvDescriptorSet0.vp_c3)._m0[11].z;
    float _247 = _237 * _245;
    float _249 = -_227;
    float _251 = -_225;
    float _253 = fma(_249, (*spvDescriptorSet0.vp_c3)._m0[11].x, _251);
    float _255 = -_241;
    float _257 = fma(_221, (*spvDescriptorSet0.vp_c3)._m0[11].x, _255);
    float _259 = -(*spvDescriptorSet0.vp_c3)._m0[11].z;
    float _261 = _243 * _259;
    float _263 = -_247;
    float _265 = fma(_243, (*spvDescriptorSet0.vp_c3)._m0[11].w, _263);
    float _267 = -_191;
    float _269 = fma(_267, (*spvDescriptorSet0.vp_c3)._m0[11].z, _253);
    float _271 = fma(_191, (*spvDescriptorSet0.vp_c3)._m0[11].w, _257);
    float _273 = -(*spvDescriptorSet0.vp_c3)._m0[11].x;
    float _275 = _243 * _273;
    float _277 = fma(_237, (*spvDescriptorSet0.vp_c3)._m0[11].w, _261);
    float _279 = 1.0 / _239;
    float _281 = -(*spvDescriptorSet0.vp_c3)._m0[11].x;
    float _283 = fma(_271, _281, _265);
    float _285 = -(*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _287 = -_275;
    float _289 = fma(_237, _285, _287);
    float _291 = fma(_271, (*spvDescriptorSet0.vp_c3)._m0[11].y, _277);
    float _293 = -(*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _295 = fma(_269, _293, _283);
    float _297 = fma(_271, (*spvDescriptorSet0.vp_c3)._m0[11].w, _289);
    float _299 = -(*spvDescriptorSet0.vp_c3)._m0[11].x;
    float _301 = fma(_269, _299, _291);
    float _303 = _295 * _295;
    float _305 = -(*spvDescriptorSet0.vp_c3)._m0[11].z;
    float _307 = fma(_269, _305, _297);
    float _309 = fma(_301, _301, _303);
    float _311 = _279 * 38016.78515625;
    float _313 = fma(_307, _307, _309);
    float _315 = _279 * 47608.17578125;
    float _317 = _279 * 29653.09375;
    float _319 = exp2(_311);
    float _321 = rsqrt(_313);
    float _323 = fma(_319, 4.8524700675531733900826436440669e-32, -4.8524700675531733900826436440669e-32);
    float _325 = exp2(_315);
    float _327 = _321 * (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _329 = exp2(_317);
    float _331 = _301 * _327;
    float _333 = _307 * _327;
    float _335 = _331 * _331;
    float _337 = _333 * _333;
    float _339 = 1.0 / _323;
    float _341 = fma(_325, 1.575550049364048909983859650751e-32, -1.575550049364048909983859650751e-32);
    float _343 = _335 + _337;
    float _345 = fma(_329, 1.680695139083943012967268610601e-31, -1.680695139083943012967268610601e-31);
    float _347 = sqrt(_343);
    float _349 = (*spvDescriptorSet0.vp_c4)._m0[0].y + (-220.0);
    float _351 = _159 * 0.15915493667125701904296875;
    float _353 = precise::max(0.0, _349);
    float _355 = 1.0 / _341;
    float _357 = _339 * 4.9924825491034901066866337467265e-24;
    float _359 = -_353;
    float _361 = fma(_295, _327, _359);
    bool _365 = _347 > (*spvDescriptorSet0.vp_c4)._m0[1].x;
    float _367 = 1.0 / _345;
    float _369 = _355 * 4.9924825491034901066866337467265e-24;
    float _371 = sqrt(_167);
    float _373 = 1.575550049364048909983859650751e-32;
    float _375 = _167;
    float _377 = _361;
    float _379 = _335;
    float _381 = _337;
    if (!_365)
    {
        _373 = _331;
    }
    float _383 = _373;
    float _385 = _383;
    if (!_365)
    {
        _375 = _333;
    }
    float _387 = _375;
    bool _389 = !_365;
    float _391 = _387;
    if (!_389)
    {
        float _393 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[1].y;
        float _395 = -(*spvDescriptorSet0.vp_c4)._m0[1].x;
        float _397 = _347 + _395;
        float _399 = rsqrt(_343);
        float _401 = _397 * _393;
        float _403 = _361 + (*spvDescriptorSet0.vp_c4)._m0[1].y;
        float _405 = _401 * 0.15915493667125701904296875;
        float _407 = _405 * 6.283185482025146484375;
        float _409 = sin(_407);
        float _411 = _405 * 6.283185482025146484375;
        float _413 = cos(_411);
        float _415 = fma(_409, _403, (*spvDescriptorSet0.vp_c4)._m0[1].x);
        float _417 = _399 * _415;
        float _419 = _413 + (-1.0);
        float _421 = _331 * _417;
        float _423 = _419 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
        float _425 = _333 * _417;
        float _427 = fma(_361, _413, _423);
        float _429 = _421 * _421;
        float _431 = _425 * _425;
        _377 = _427;
        _379 = _429;
        _381 = _431;
        _385 = _421;
        _391 = _425;
    }
    float _433 = _377;
    float _435 = _379;
    float _437 = _381;
    float _439 = _385;
    float _441 = _391;
    float _443 = fma(_433, _433, _435);
    float _445 = _351 * 6.283185482025146484375;
    float _447 = cos(_445);
    float _449 = _367 * 4.9924825491034901066866337467265e-24;
    float _451 = precise::max(_357, _369);
    float _453 = _443 + _437;
    float _455 = precise::max(_449, _451);
    float _457 = rsqrt(_453);
    bool _459 = _455 != 0.0;
    bool _461 = isnan(_455);
    bool _463 = _459 || _461;
    bool _465 = isnan(0.0);
    bool _467 = _463 || _465;
    float _469 = _371 * _447;
    float _471 = _131 * _447;
    float _473 = -(*spvDescriptorSet0.vp_c3)._m0[7].x;
    float _475 = _473 + (*spvDescriptorSet0.vp_c3)._m0[7].y;
    float _477 = fma(_469, (*spvDescriptorSet0.vp_c3)._m0[8].z, 0.5);
    float _479 = precise::clamp(_477, 0.0, 1.0);
    float _481 = _351;
    float _483 = _441;
    if (_467)
    {
        float _485 = 1.0 / _455;
        _481 = _485;
    }
    float _487 = _481;
    float _489 = _479 * (*spvDescriptorSet0.vp_c3)._m0[7].z;
    float _491 = _457 * _433;
    float _493 = _457 * _439;
    float _495 = fma(_471, (*spvDescriptorSet0.vp_c3)._m0[8].w, 0.5);
    float _497 = precise::clamp(_495, 0.0, 1.0);
    float _499 = _457 * _441;
    float _501 = _491 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _503 = _501;
    if (!_467)
    {
        _483 = 1.0;
    }
    float _505 = _483;
    float _507 = fma(_475, _497, (*spvDescriptorSet0.vp_c3)._m0[7].x);
    float _509 = ceil(_489);
    float _511 = fma(_493, (*spvDescriptorSet0.vp_c3)._m0[3].x, _501);
    float _513 = _491 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _515 = _491 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _517 = _505;
    float _519 = _511;
    if (!_467)
    {
        _503 = 1.0;
    }
    float _521 = _503;
    float _523 = fma(_499, (*spvDescriptorSet0.vp_c3)._m0[3].z, _511);
    float _525 = fma(_493, (*spvDescriptorSet0.vp_c3)._m0[0].x, _513);
    float _527 = _521;
    if (_467)
    {
        float _529 = _357 * _487;
        _517 = _529;
    }
    float _531 = _517;
    float _533 = fma(_493, (*spvDescriptorSet0.vp_c3)._m0[1].x, _515);
    float _535 = 1.0 / _523;
    if (!_467)
    {
        _519 = 1.0;
    }
    float _537 = _519;
    float _539 = _537;
    if (_467)
    {
        float _541 = _449 * _487;
        _527 = _541;
    }
    float _543 = _527;
    if (_467)
    {
        float _545 = _369 * _487;
        _539 = _545;
    }
    float _547 = _539;
    float _549 = _507 * _531;
    float _551 = fma(_499, (*spvDescriptorSet0.vp_c3)._m0[0].z, _525);
    float _553 = fma(_499, (*spvDescriptorSet0.vp_c3)._m0[1].z, _533);
    bool _555 = _523 > 0.0;
    float _557 = _507 * _543;
    float _559 = _507 * _547;
    float _561 = fma(_509, 0.5, 0.5);
    float _563 = _489 * 0.5;
    float _565 = _509 + 1.0;
    int _567 = _555 ? 1065353216 : (-1073741824);
    out.m_27.x = _557;
    out.m_27.y = _549;
    out.m_27.z = _559;
    float _569 = _551 * _535;
    float _571 = _553 * _535;
    out.m_29.x = _563;
    out.gl_PointSize = _565;
    out.m_31.x = _561;
    out.gl_Position.x = _569;
    out.gl_Position.y = _571;
    float _1385 = as_type<float>(_567);
    out.gl_Position.z = _1385;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_27 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _45 = as_type<float>(int(gl_VertexIndex));
    uint _48 = uint(int(uint(as_type<int>(_45)) >> uint(16)));
    int _51 = 61 ^ as_type<int>(_45);
    int _53 = int(_48) ^ _51;
    int _55 = _53 << 3;
    int _57 = _55 + _53;
    uint _59 = uint(int(uint(_57) >> uint(4)));
    int _61 = _57 ^ int(_59);
    int _63 = _61 * 668265261;
    uint _65 = uint(int(uint(_63) >> uint(15)));
    int _67 = _63 ^ int(_65);
    int _69 = _67 << 13;
    int _71 = _67 ^ _69;
    uint _73 = uint(int(uint(_71) >> uint(17)));
    int _75 = _71 ^ int(_73);
    int _77 = _75 << 5;
    int _79 = _75 ^ _77;
    int _81 = _79 << 13;
    int _83 = _79 ^ _81;
    float _85 = float(uint(_79));
    uint _87 = uint(int(uint(_83) >> uint(17)));
    float _89 = _85 * 2.3283064365386962890625e-10;
    float _91 = precise::clamp(_89, 0.0, 1.0);
    int _93 = _83 ^ int(_87);
    int _95 = _93 << 5;
    float _97 = precise::max(_91, 9.9999997473787516355514526367188e-05);
    int _99 = _93 ^ _95;
    int _101 = _99 << 13;
    float _103 = log2(_97);
    int _105 = _99 ^ _101;
    float _107 = float(uint(_99));
    uint _109 = uint(int(uint(_105) >> uint(17)));
    float _111 = _107 * 2.3283064365386962890625e-10;
    float _113 = precise::clamp(_111, 0.0, 1.0);
    int _115 = _105 ^ int(_109);
    int _117 = _115 << 5;
    float _119 = _103 * (-1.38629436492919921875);
    int _121 = _115 ^ _117;
    int _123 = _121 << 13;
    int _125 = _121 ^ _123;
    float _127 = precise::max(_113, 9.9999997473787516355514526367188e-05);
    uint _129 = uint(int(uint(_125) >> uint(17)));
    float _131 = sqrt(_119);
    float _133 = float(uint(_121));
    float _135 = _127 * 6.283185482025146484375;
    int _137 = _125 ^ int(_129);
    float _139 = _135 * 0.15915493667125701904296875;
    int _141 = _137 << 5;
    float _143 = log2(_127);
    float _145 = _133 * 2.3283064365386962890625e-10;
    float _147 = precise::clamp(_145, 0.0, 1.0);
    int _149 = _137 ^ _141;
    float _151 = precise::max(_147, 9.9999997473787516355514526367188e-05);
    int _153 = _149 << 13;
    float _155 = _139 * 6.283185482025146484375;
    float _157 = cos(_155);
    float _159 = _151 * 6.283185482025146484375;
    int _161 = _149 ^ _153;
    float _163 = float(uint(_149));
    uint _165 = uint(int(uint(_161) >> uint(17)));
    float _167 = _143 * (-1.38629436492919921875);
    float _169 = _163 * 2.3283064365386962890625e-10;
    float _171 = precise::clamp(_169, 0.0, 1.0);
    int _173 = _161 ^ int(_165);
    int _175 = _173 << 5;
    float _177 = _131 * _157;
    int _179 = _173 ^ _175;
    float _181 = fma(_177, (*spvDescriptorSet0.vp_c3)._m0[8].y, 0.5);
    float _183 = precise::clamp(_181, 0.0, 1.0);
    float _185 = float(uint(_179));
    float _187 = abs(_183);
    float _189 = log2(_187);
    float _191 = fma(_171, 2.0, -1.0);
    float _193 = _185 * 2.3283064365386962890625e-10;
    float _195 = precise::clamp(_193, 0.0, 1.0);
    float _197 = -_191;
    float _199 = fma(_197, _191, 1.0);
    float _201 = _195 * 6.283185482025146484375;
    float _203 = _191 * (*spvDescriptorSet0.vp_c3)._m0[11].x;
    float _205 = _201 * 0.15915493667125701904296875;
    float _207 = sqrt(_199);
    float _209 = _189 * (*spvDescriptorSet0.vp_c3)._m0[8].x;
    float _211 = _205 * 6.283185482025146484375;
    float _213 = sin(_211);
    float _215 = _205 * 6.283185482025146484375;
    float _217 = cos(_215);
    float _219 = exp2(_209);
    float _221 = _207 * _213;
    float _223 = _221 * (*spvDescriptorSet0.vp_c3)._m0[11].z;
    float _225 = _221 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _227 = _207 * _217;
    float _229 = -_223;
    float _231 = fma(_191, (*spvDescriptorSet0.vp_c3)._m0[11].y, _229);
    float _233 = -_203;
    float _235 = fma(_227, (*spvDescriptorSet0.vp_c3)._m0[11].z, _233);
    float _237 = fma(_227, (*spvDescriptorSet0.vp_c3)._m0[11].w, _231);
    float _239 = fma(_219, 14200.0, 1800.0);
    float _241 = _227 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _243 = fma(_221, (*spvDescriptorSet0.vp_c3)._m0[11].w, _235);
    float _245 = -(*spvDescriptorSet0.vp_c3)._m0[11].z;
    float _247 = _237 * _245;
    float _249 = -_227;
    float _251 = -_225;
    float _253 = fma(_249, (*spvDescriptorSet0.vp_c3)._m0[11].x, _251);
    float _255 = -_241;
    float _257 = fma(_221, (*spvDescriptorSet0.vp_c3)._m0[11].x, _255);
    float _259 = -(*spvDescriptorSet0.vp_c3)._m0[11].z;
    float _261 = _243 * _259;
    float _263 = -_247;
    float _265 = fma(_243, (*spvDescriptorSet0.vp_c3)._m0[11].w, _263);
    float _267 = -_191;
    float _269 = fma(_267, (*spvDescriptorSet0.vp_c3)._m0[11].z, _253);
    float _271 = fma(_191, (*spvDescriptorSet0.vp_c3)._m0[11].w, _257);
    float _273 = -(*spvDescriptorSet0.vp_c3)._m0[11].x;
    float _275 = _243 * _273;
    float _277 = fma(_237, (*spvDescriptorSet0.vp_c3)._m0[11].w, _261);
    float _279 = 1.0 / _239;
    float _281 = -(*spvDescriptorSet0.vp_c3)._m0[11].x;
    float _283 = fma(_271, _281, _265);
    float _285 = -(*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _287 = -_275;
    float _289 = fma(_237, _285, _287);
    float _291 = fma(_271, (*spvDescriptorSet0.vp_c3)._m0[11].y, _277);
    float _293 = -(*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _295 = fma(_269, _293, _283);
    float _297 = fma(_271, (*spvDescriptorSet0.vp_c3)._m0[11].w, _289);
    float _299 = -(*spvDescriptorSet0.vp_c3)._m0[11].x;
    float _301 = fma(_269, _299, _291);
    float _303 = _295 * _295;
    float _305 = -(*spvDescriptorSet0.vp_c3)._m0[11].z;
    float _307 = fma(_269, _305, _297);
    float _309 = fma(_301, _301, _303);
    float _311 = _279 * 38016.78515625;
    float _313 = fma(_307, _307, _309);
    float _315 = _279 * 47608.17578125;
    float _317 = _279 * 29653.09375;
    float _319 = exp2(_311);
    float _321 = rsqrt(_313);
    float _323 = fma(_319, 4.8524700675531733900826436440669e-32, -4.8524700675531733900826436440669e-32);
    float _325 = exp2(_315);
    float _327 = _321 * (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _329 = exp2(_317);
    float _331 = _301 * _327;
    float _333 = _307 * _327;
    float _335 = _331 * _331;
    float _337 = _333 * _333;
    float _339 = 1.0 / _323;
    float _341 = fma(_325, 1.575550049364048909983859650751e-32, -1.575550049364048909983859650751e-32);
    float _343 = _335 + _337;
    float _345 = fma(_329, 1.680695139083943012967268610601e-31, -1.680695139083943012967268610601e-31);
    float _347 = sqrt(_343);
    float _349 = (*spvDescriptorSet0.vp_c4)._m0[0].y + (-220.0);
    float _351 = _159 * 0.15915493667125701904296875;
    float _353 = precise::max(0.0, _349);
    float _355 = 1.0 / _341;
    float _357 = _339 * 4.9924825491034901066866337467265e-24;
    float _359 = -_353;
    float _361 = fma(_295, _327, _359);
    bool _365 = _347 > (*spvDescriptorSet0.vp_c4)._m0[1].x;
    float _367 = 1.0 / _345;
    float _369 = _355 * 4.9924825491034901066866337467265e-24;
    float _371 = sqrt(_167);
    float _373 = 1.575550049364048909983859650751e-32;
    float _375 = _167;
    float _377 = _361;
    float _379 = _335;
    float _381 = _337;
    if (!_365)
    {
        _373 = _331;
    }
    float _383 = _373;
    float _385 = _383;
    if (!_365)
    {
        _375 = _333;
    }
    float _387 = _375;
    bool _389 = !_365;
    float _391 = _387;
    if (!_389)
    {
        float _393 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[1].y;
        float _395 = -(*spvDescriptorSet0.vp_c4)._m0[1].x;
        float _397 = _347 + _395;
        float _399 = rsqrt(_343);
        float _401 = _397 * _393;
        float _403 = _361 + (*spvDescriptorSet0.vp_c4)._m0[1].y;
        float _405 = _401 * 0.15915493667125701904296875;
        float _407 = _405 * 6.283185482025146484375;
        float _409 = sin(_407);
        float _411 = _405 * 6.283185482025146484375;
        float _413 = cos(_411);
        float _415 = fma(_409, _403, (*spvDescriptorSet0.vp_c4)._m0[1].x);
        float _417 = _399 * _415;
        float _419 = _413 + (-1.0);
        float _421 = _331 * _417;
        float _423 = _419 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
        float _425 = _333 * _417;
        float _427 = fma(_361, _413, _423);
        float _429 = _421 * _421;
        float _431 = _425 * _425;
        _377 = _427;
        _379 = _429;
        _381 = _431;
        _385 = _421;
        _391 = _425;
    }
    float _433 = _377;
    float _435 = _379;
    float _437 = _381;
    float _439 = _385;
    float _441 = _391;
    float _443 = fma(_433, _433, _435);
    float _445 = _351 * 6.283185482025146484375;
    float _447 = cos(_445);
    float _449 = _367 * 4.9924825491034901066866337467265e-24;
    float _451 = precise::max(_357, _369);
    float _453 = _443 + _437;
    float _455 = precise::max(_449, _451);
    float _457 = rsqrt(_453);
    bool _459 = _455 != 0.0;
    bool _461 = isnan(_455);
    bool _463 = _459 || _461;
    bool _465 = isnan(0.0);
    bool _467 = _463 || _465;
    float _469 = _371 * _447;
    float _471 = _131 * _447;
    float _473 = -(*spvDescriptorSet0.vp_c3)._m0[7].x;
    float _475 = _473 + (*spvDescriptorSet0.vp_c3)._m0[7].y;
    float _477 = fma(_469, (*spvDescriptorSet0.vp_c3)._m0[8].z, 0.5);
    float _479 = precise::clamp(_477, 0.0, 1.0);
    float _481 = _351;
    float _483 = _441;
    if (_467)
    {
        float _485 = 1.0 / _455;
        _481 = _485;
    }
    float _487 = _481;
    float _489 = _479 * (*spvDescriptorSet0.vp_c3)._m0[7].z;
    float _491 = _457 * _433;
    float _493 = _457 * _439;
    float _495 = fma(_471, (*spvDescriptorSet0.vp_c3)._m0[8].w, 0.5);
    float _497 = precise::clamp(_495, 0.0, 1.0);
    float _499 = _457 * _441;
    float _501 = _491 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _503 = _501;
    if (!_467)
    {
        _483 = 1.0;
    }
    float _505 = _483;
    float _507 = fma(_475, _497, (*spvDescriptorSet0.vp_c3)._m0[7].x);
    float _509 = ceil(_489);
    float _511 = fma(_493, (*spvDescriptorSet0.vp_c3)._m0[3].x, _501);
    float _513 = _491 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _515 = _491 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _517 = _505;
    float _519 = _511;
    if (!_467)
    {
        _503 = 1.0;
    }
    float _521 = _503;
    float _523 = fma(_499, (*spvDescriptorSet0.vp_c3)._m0[3].z, _511);
    float _525 = fma(_493, (*spvDescriptorSet0.vp_c3)._m0[0].x, _513);
    float _527 = _521;
    if (_467)
    {
        float _529 = _357 * _487;
        _517 = _529;
    }
    float _531 = _517;
    float _533 = fma(_493, (*spvDescriptorSet0.vp_c3)._m0[1].x, _515);
    float _535 = 1.0 / _523;
    if (!_467)
    {
        _519 = 1.0;
    }
    float _537 = _519;
    float _539 = _537;
    if (_467)
    {
        float _541 = _449 * _487;
        _527 = _541;
    }
    float _543 = _527;
    if (_467)
    {
        float _545 = _369 * _487;
        _539 = _545;
    }
    float _547 = _539;
    float _549 = _507 * _531;
    float _551 = fma(_499, (*spvDescriptorSet0.vp_c3)._m0[0].z, _525);
    float _553 = fma(_499, (*spvDescriptorSet0.vp_c3)._m0[1].z, _533);
    bool _555 = _523 > 0.0;
    float _557 = _507 * _543;
    float _559 = _507 * _547;
    float _561 = fma(_509, 0.5, 0.5);
    float _563 = _489 * 0.5;
    float _565 = _509 + 1.0;
    int _567 = _555 ? 1065353216 : (-1073741824);
    out.m_27.x = _557;
    out.m_27.y = _549;
    out.m_27.z = _559;
    float _569 = _551 * _535;
    float _571 = _553 * _535;
    out.m_29.x = _563;
    out.gl_PointSize = _565;
    out.m_31.x = _561;
    out.gl_Position.x = _569;
    out.gl_Position.y = _571;
    float _1385 = as_type<float>(_567);
    out.gl_Position.z = _1385;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint dm_vid = gl_VertexIndex;
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_27 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _45 = as_type<float>(int(gl_VertexIndex));
    uint _48 = uint(int(uint(as_type<int>(_45)) >> uint(16)));
    int _51 = 61 ^ as_type<int>(_45);
    int _53 = int(_48) ^ _51;
    int _55 = _53 << 3;
    int _57 = _55 + _53;
    uint _59 = uint(int(uint(_57) >> uint(4)));
    int _61 = _57 ^ int(_59);
    int _63 = _61 * 668265261;
    uint _65 = uint(int(uint(_63) >> uint(15)));
    int _67 = _63 ^ int(_65);
    int _69 = _67 << 13;
    int _71 = _67 ^ _69;
    uint _73 = uint(int(uint(_71) >> uint(17)));
    int _75 = _71 ^ int(_73);
    int _77 = _75 << 5;
    int _79 = _75 ^ _77;
    int _81 = _79 << 13;
    int _83 = _79 ^ _81;
    float _85 = float(uint(_79));
    uint _87 = uint(int(uint(_83) >> uint(17)));
    float _89 = _85 * 2.3283064365386962890625e-10;
    float _91 = precise::clamp(_89, 0.0, 1.0);
    int _93 = _83 ^ int(_87);
    int _95 = _93 << 5;
    float _97 = precise::max(_91, 9.9999997473787516355514526367188e-05);
    int _99 = _93 ^ _95;
    int _101 = _99 << 13;
    float _103 = log2(_97);
    int _105 = _99 ^ _101;
    float _107 = float(uint(_99));
    uint _109 = uint(int(uint(_105) >> uint(17)));
    float _111 = _107 * 2.3283064365386962890625e-10;
    float _113 = precise::clamp(_111, 0.0, 1.0);
    int _115 = _105 ^ int(_109);
    int _117 = _115 << 5;
    float _119 = _103 * (-1.38629436492919921875);
    int _121 = _115 ^ _117;
    int _123 = _121 << 13;
    int _125 = _121 ^ _123;
    float _127 = precise::max(_113, 9.9999997473787516355514526367188e-05);
    uint _129 = uint(int(uint(_125) >> uint(17)));
    float _131 = sqrt(_119);
    float _133 = float(uint(_121));
    float _135 = _127 * 6.283185482025146484375;
    int _137 = _125 ^ int(_129);
    float _139 = _135 * 0.15915493667125701904296875;
    int _141 = _137 << 5;
    float _143 = log2(_127);
    float _145 = _133 * 2.3283064365386962890625e-10;
    float _147 = precise::clamp(_145, 0.0, 1.0);
    int _149 = _137 ^ _141;
    float _151 = precise::max(_147, 9.9999997473787516355514526367188e-05);
    int _153 = _149 << 13;
    float _155 = _139 * 6.283185482025146484375;
    float _157 = cos(_155);
    float _159 = _151 * 6.283185482025146484375;
    int _161 = _149 ^ _153;
    float _163 = float(uint(_149));
    uint _165 = uint(int(uint(_161) >> uint(17)));
    float _167 = _143 * (-1.38629436492919921875);
    float _169 = _163 * 2.3283064365386962890625e-10;
    float _171 = precise::clamp(_169, 0.0, 1.0);
    int _173 = _161 ^ int(_165);
    int _175 = _173 << 5;
    float _177 = _131 * _157;
    int _179 = _173 ^ _175;
    float _181 = fma(_177, (*spvDescriptorSet0.vp_c3)._m0[8].y, 0.5);
    float _183 = precise::clamp(_181, 0.0, 1.0);
    float _185 = float(uint(_179));
    float _187 = abs(_183);
    float _189 = log2(_187);
    float _191 = fma(_171, 2.0, -1.0);
    float _193 = _185 * 2.3283064365386962890625e-10;
    float _195 = precise::clamp(_193, 0.0, 1.0);
    float _197 = -_191;
    float _199 = fma(_197, _191, 1.0);
    float _201 = _195 * 6.283185482025146484375;
    float _203 = _191 * (*spvDescriptorSet0.vp_c3)._m0[11].x;
    float _205 = _201 * 0.15915493667125701904296875;
    float _207 = sqrt(_199);
    float _209 = _189 * (*spvDescriptorSet0.vp_c3)._m0[8].x;
    float _211 = _205 * 6.283185482025146484375;
    float _213 = sin(_211);
    float _215 = _205 * 6.283185482025146484375;
    float _217 = cos(_215);
    float _219 = exp2(_209);
    float _221 = _207 * _213;
    float _223 = _221 * (*spvDescriptorSet0.vp_c3)._m0[11].z;
    float _225 = _221 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _227 = _207 * _217;
    float _229 = -_223;
    float _231 = fma(_191, (*spvDescriptorSet0.vp_c3)._m0[11].y, _229);
    float _233 = -_203;
    float _235 = fma(_227, (*spvDescriptorSet0.vp_c3)._m0[11].z, _233);
    float _237 = fma(_227, (*spvDescriptorSet0.vp_c3)._m0[11].w, _231);
    float _239 = fma(_219, 14200.0, 1800.0);
    float _241 = _227 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _243 = fma(_221, (*spvDescriptorSet0.vp_c3)._m0[11].w, _235);
    float _245 = -(*spvDescriptorSet0.vp_c3)._m0[11].z;
    float _247 = _237 * _245;
    float _249 = -_227;
    float _251 = -_225;
    float _253 = fma(_249, (*spvDescriptorSet0.vp_c3)._m0[11].x, _251);
    float _255 = -_241;
    float _257 = fma(_221, (*spvDescriptorSet0.vp_c3)._m0[11].x, _255);
    float _259 = -(*spvDescriptorSet0.vp_c3)._m0[11].z;
    float _261 = _243 * _259;
    float _263 = -_247;
    float _265 = fma(_243, (*spvDescriptorSet0.vp_c3)._m0[11].w, _263);
    float _267 = -_191;
    float _269 = fma(_267, (*spvDescriptorSet0.vp_c3)._m0[11].z, _253);
    float _271 = fma(_191, (*spvDescriptorSet0.vp_c3)._m0[11].w, _257);
    float _273 = -(*spvDescriptorSet0.vp_c3)._m0[11].x;
    float _275 = _243 * _273;
    float _277 = fma(_237, (*spvDescriptorSet0.vp_c3)._m0[11].w, _261);
    float _279 = 1.0 / _239;
    float _281 = -(*spvDescriptorSet0.vp_c3)._m0[11].x;
    float _283 = fma(_271, _281, _265);
    float _285 = -(*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _287 = -_275;
    float _289 = fma(_237, _285, _287);
    float _291 = fma(_271, (*spvDescriptorSet0.vp_c3)._m0[11].y, _277);
    float _293 = -(*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _295 = fma(_269, _293, _283);
    float _297 = fma(_271, (*spvDescriptorSet0.vp_c3)._m0[11].w, _289);
    float _299 = -(*spvDescriptorSet0.vp_c3)._m0[11].x;
    float _301 = fma(_269, _299, _291);
    float _303 = _295 * _295;
    float _305 = -(*spvDescriptorSet0.vp_c3)._m0[11].z;
    float _307 = fma(_269, _305, _297);
    float _309 = fma(_301, _301, _303);
    float _311 = _279 * 38016.78515625;
    float _313 = fma(_307, _307, _309);
    float _315 = _279 * 47608.17578125;
    float _317 = _279 * 29653.09375;
    float _319 = exp2(_311);
    float _321 = rsqrt(_313);
    float _323 = fma(_319, 4.8524700675531733900826436440669e-32, -4.8524700675531733900826436440669e-32);
    float _325 = exp2(_315);
    float _327 = _321 * (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _329 = exp2(_317);
    float _331 = _301 * _327;
    float _333 = _307 * _327;
    float _335 = _331 * _331;
    float _337 = _333 * _333;
    float _339 = 1.0 / _323;
    float _341 = fma(_325, 1.575550049364048909983859650751e-32, -1.575550049364048909983859650751e-32);
    float _343 = _335 + _337;
    float _345 = fma(_329, 1.680695139083943012967268610601e-31, -1.680695139083943012967268610601e-31);
    float _347 = sqrt(_343);
    float _349 = (*spvDescriptorSet0.vp_c4)._m0[0].y + (-220.0);
    float _351 = _159 * 0.15915493667125701904296875;
    float _353 = precise::max(0.0, _349);
    float _355 = 1.0 / _341;
    float _357 = _339 * 4.9924825491034901066866337467265e-24;
    float _359 = -_353;
    float _361 = fma(_295, _327, _359);
    bool _365 = _347 > (*spvDescriptorSet0.vp_c4)._m0[1].x;
    float _367 = 1.0 / _345;
    float _369 = _355 * 4.9924825491034901066866337467265e-24;
    float _371 = sqrt(_167);
    float _373 = 1.575550049364048909983859650751e-32;
    float _375 = _167;
    float _377 = _361;
    float _379 = _335;
    float _381 = _337;
    if (!_365)
    {
        _373 = _331;
    }
    float _383 = _373;
    float _385 = _383;
    if (!_365)
    {
        _375 = _333;
    }
    float _387 = _375;
    bool _389 = !_365;
    float _391 = _387;
    if (!_389)
    {
        float _393 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[1].y;
        float _395 = -(*spvDescriptorSet0.vp_c4)._m0[1].x;
        float _397 = _347 + _395;
        float _399 = rsqrt(_343);
        float _401 = _397 * _393;
        float _403 = _361 + (*spvDescriptorSet0.vp_c4)._m0[1].y;
        float _405 = _401 * 0.15915493667125701904296875;
        float _407 = _405 * 6.283185482025146484375;
        float _409 = sin(_407);
        float _411 = _405 * 6.283185482025146484375;
        float _413 = cos(_411);
        float _415 = fma(_409, _403, (*spvDescriptorSet0.vp_c4)._m0[1].x);
        float _417 = _399 * _415;
        float _419 = _413 + (-1.0);
        float _421 = _331 * _417;
        float _423 = _419 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
        float _425 = _333 * _417;
        float _427 = fma(_361, _413, _423);
        float _429 = _421 * _421;
        float _431 = _425 * _425;
        _377 = _427;
        _379 = _429;
        _381 = _431;
        _385 = _421;
        _391 = _425;
    }
    float _433 = _377;
    float _435 = _379;
    float _437 = _381;
    float _439 = _385;
    float _441 = _391;
    float _443 = fma(_433, _433, _435);
    float _445 = _351 * 6.283185482025146484375;
    float _447 = cos(_445);
    float _449 = _367 * 4.9924825491034901066866337467265e-24;
    float _451 = precise::max(_357, _369);
    float _453 = _443 + _437;
    float _455 = precise::max(_449, _451);
    float _457 = rsqrt(_453);
    bool _459 = _455 != 0.0;
    bool _461 = isnan(_455);
    bool _463 = _459 || _461;
    bool _465 = isnan(0.0);
    bool _467 = _463 || _465;
    float _469 = _371 * _447;
    float _471 = _131 * _447;
    float _473 = -(*spvDescriptorSet0.vp_c3)._m0[7].x;
    float _475 = _473 + (*spvDescriptorSet0.vp_c3)._m0[7].y;
    float _477 = fma(_469, (*spvDescriptorSet0.vp_c3)._m0[8].z, 0.5);
    float _479 = precise::clamp(_477, 0.0, 1.0);
    float _481 = _351;
    float _483 = _441;
    if (_467)
    {
        float _485 = 1.0 / _455;
        _481 = _485;
    }
    float _487 = _481;
    float _489 = _479 * (*spvDescriptorSet0.vp_c3)._m0[7].z;
    float _491 = _457 * _433;
    float _493 = _457 * _439;
    float _495 = fma(_471, (*spvDescriptorSet0.vp_c3)._m0[8].w, 0.5);
    float _497 = precise::clamp(_495, 0.0, 1.0);
    float _499 = _457 * _441;
    float _501 = _491 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _503 = _501;
    if (!_467)
    {
        _483 = 1.0;
    }
    float _505 = _483;
    float _507 = fma(_475, _497, (*spvDescriptorSet0.vp_c3)._m0[7].x);
    float _509 = ceil(_489);
    float _511 = fma(_493, (*spvDescriptorSet0.vp_c3)._m0[3].x, _501);
    float _513 = _491 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _515 = _491 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _517 = _505;
    float _519 = _511;
    if (!_467)
    {
        _503 = 1.0;
    }
    float _521 = _503;
    float _523 = fma(_499, (*spvDescriptorSet0.vp_c3)._m0[3].z, _511);
    float _525 = fma(_493, (*spvDescriptorSet0.vp_c3)._m0[0].x, _513);
    float _527 = _521;
    if (_467)
    {
        float _529 = _357 * _487;
        _517 = _529;
    }
    float _531 = _517;
    float _533 = fma(_493, (*spvDescriptorSet0.vp_c3)._m0[1].x, _515);
    float _535 = 1.0 / _523;
    if (!_467)
    {
        _519 = 1.0;
    }
    float _537 = _519;
    float _539 = _537;
    if (_467)
    {
        float _541 = _449 * _487;
        _527 = _541;
    }
    float _543 = _527;
    if (_467)
    {
        float _545 = _369 * _487;
        _539 = _545;
    }
    float _547 = _539;
    float _549 = _507 * _531;
    float _551 = fma(_499, (*spvDescriptorSet0.vp_c3)._m0[0].z, _525);
    float _553 = fma(_499, (*spvDescriptorSet0.vp_c3)._m0[1].z, _533);
    bool _555 = _523 > 0.0;
    float _557 = _507 * _543;
    float _559 = _507 * _547;
    float _561 = fma(_509, 0.5, 0.5);
    float _563 = _489 * 0.5;
    float _565 = _509 + 1.0;
    int _567 = _555 ? 1065353216 : (-1073741824);
    out.m_27.x = _557;
    out.m_27.y = _549;
    out.m_27.z = _559;
    float _569 = _551 * _535;
    float _571 = _553 * _535;
    out.m_29.x = _563;
    out.gl_PointSize = _565;
    out.m_31.x = _561;
    out.gl_Position.x = _569;
    out.gl_Position.y = _571;
    float _1385 = as_type<float>(_567);
    out.gl_Position.z = _1385;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_31.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_31.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_31.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_31.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_27.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_27.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_27.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_27.w)); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

