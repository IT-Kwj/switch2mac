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
};

struct main0_out
{
    float4 m_25 [[user(locn0)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

vertex main0_out main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_25 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _39 = as_type<float>(int(gl_VertexIndex));
    uint _42 = uint(int(uint(as_type<int>(_39)) >> uint(16)));
    int _45 = 61 ^ as_type<int>(_39);
    int _47 = int(_42) ^ _45;
    int _49 = _47 << 3;
    int _51 = _49 + _47;
    uint _53 = uint(int(uint(_51) >> uint(4)));
    int _55 = _51 ^ int(_53);
    int _57 = _55 * 668265261;
    uint _59 = uint(int(uint(_57) >> uint(15)));
    int _61 = _57 ^ int(_59);
    int _63 = _61 << 13;
    int _65 = _61 ^ _63;
    uint _67 = uint(int(uint(_65) >> uint(17)));
    int _69 = _65 ^ int(_67);
    int _71 = _69 << 5;
    int _73 = _69 ^ _71;
    int _75 = _73 << 13;
    float _77 = float(uint(_73));
    int _79 = _73 ^ _75;
    float _81 = _77 * 2.3283064365386962890625e-10;
    float _83 = precise::clamp(_81, 0.0, 1.0);
    uint _85 = uint(int(uint(_79) >> uint(17)));
    int _87 = _79 ^ int(_85);
    float _89 = log2(_83);
    int _91 = _87 << 5;
    int _93 = _87 ^ _91;
    float _95 = float(uint(_93));
    float _97 = _95 * 2.3283064365386962890625e-10;
    float _99 = precise::clamp(_97, 0.0, 1.0);
    float _101 = _89 * (-1.38629436492919921875);
    float _103 = _99 * 6.283185482025146484375;
    float _105 = sqrt(_101);
    float _107 = _103 * 0.15915493667125701904296875;
    float _109 = _107 * 6.283185482025146484375;
    float _111 = cos(_109);
    float _113 = log2(_99);
    float _115 = _105 * _111;
    float _117 = fma(_115, (*spvDescriptorSet0.vp_c3)._m0[8].y, 0.5);
    float _119 = precise::clamp(_117, 0.0, 1.0);
    int _121 = _93 << 13;
    float _123 = _113 * (-1.38629436492919921875);
    int _125 = _93 ^ _121;
    float _127 = abs(_119);
    float _129 = log2(_127);
    uint _131 = uint(int(uint(_125) >> uint(17)));
    int _133 = _125 ^ int(_131);
    float _135 = sqrt(_123);
    int _137 = _133 << 5;
    int _139 = _133 ^ _137;
    float _141 = _129 * (*spvDescriptorSet0.vp_c3)._m0[8].x;
    int _143 = _139 << 13;
    float _145 = exp2(_141);
    int _147 = _139 ^ _143;
    float _149 = float(uint(_139));
    uint _151 = uint(int(uint(_147) >> uint(17)));
    float _153 = _149 * 2.3283064365386962890625e-10;
    float _155 = precise::clamp(_153, 0.0, 1.0);
    int _157 = _147 ^ int(_151);
    float _159 = _155 * 6.283185482025146484375;
    int _161 = _157 << 5;
    float _163 = fma(_145, 14200.0, 1800.0);
    int _165 = _157 ^ _161;
    float _167 = 1.0 / _163;
    int _169 = _165 << 13;
    int _171 = _165 ^ _169;
    float _173 = float(uint(_165));
    uint _175 = uint(int(uint(_171) >> uint(17)));
    float _177 = _173 * 2.3283064365386962890625e-10;
    float _179 = precise::clamp(_177, 0.0, 1.0);
    int _181 = _171 ^ int(_175);
    float _183 = fma(_179, 2.0, -1.0);
    int _185 = _181 << 5;
    float _187 = _167 * 29653.09375;
    float _189 = _167 * 38016.78515625;
    int _191 = _181 ^ _185;
    float _193 = -_183;
    float _195 = fma(_193, _183, 1.0);
    float _197 = exp2(_187);
    float _199 = float(uint(_191));
    float _201 = _199 * 2.3283064365386962890625e-10;
    float _203 = precise::clamp(_201, 0.0, 1.0);
    float _205 = sqrt(_195);
    float _207 = _167 * 47608.17578125;
    float _209 = _203 * 6.283185482025146484375;
    float _211 = _209 * 0.15915493667125701904296875;
    float _213 = exp2(_207);
    float _215 = fma(_197, 1.680695139083943012967268610601e-31, -1.680695139083943012967268610601e-31);
    float _217 = _211 * 6.283185482025146484375;
    float _219 = sin(_217);
    float _221 = _211 * 6.283185482025146484375;
    float _223 = cos(_221);
    float _225 = exp2(_189);
    float _227 = _205 * _219;
    float _229 = fma(_213, 1.575550049364048909983859650751e-32, -1.575550049364048909983859650751e-32);
    float _231 = _227 * (*spvDescriptorSet0.vp_c3)._m0[11].z;
    float _233 = _227 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _235 = _205 * _223;
    float _237 = _183 * (*spvDescriptorSet0.vp_c3)._m0[11].x;
    float _239 = 1.0 / _229;
    float _241 = _235 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _243 = fma(_225, 4.8524700675531733900826436440669e-32, -4.8524700675531733900826436440669e-32);
    float _245 = -_237;
    float _247 = fma(_235, (*spvDescriptorSet0.vp_c3)._m0[11].z, _245);
    float _249 = -_231;
    float _251 = fma(_183, (*spvDescriptorSet0.vp_c3)._m0[11].y, _249);
    float _253 = -_235;
    float _255 = -_233;
    float _257 = fma(_253, (*spvDescriptorSet0.vp_c3)._m0[11].x, _255);
    float _259 = 1.0 / _243;
    float _261 = fma(_227, (*spvDescriptorSet0.vp_c3)._m0[11].w, _247);
    float _263 = fma(_235, (*spvDescriptorSet0.vp_c3)._m0[11].w, _251);
    float _265 = -_241;
    float _267 = fma(_227, (*spvDescriptorSet0.vp_c3)._m0[11].x, _265);
    float _269 = -_183;
    float _271 = fma(_269, (*spvDescriptorSet0.vp_c3)._m0[11].z, _257);
    float _273 = -(*spvDescriptorSet0.vp_c3)._m0[11].z;
    float _275 = _261 * _273;
    float _277 = -(*spvDescriptorSet0.vp_c3)._m0[11].x;
    float _279 = _261 * _277;
    float _281 = fma(_183, (*spvDescriptorSet0.vp_c3)._m0[11].w, _267);
    float _283 = 1.0 / _215;
    float _285 = -(*spvDescriptorSet0.vp_c3)._m0[11].z;
    float _287 = _263 * _285;
    float _289 = fma(_263, (*spvDescriptorSet0.vp_c3)._m0[11].w, _275);
    float _291 = -(*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _293 = -_279;
    float _295 = fma(_263, _291, _293);
    float _297 = -_287;
    float _299 = fma(_261, (*spvDescriptorSet0.vp_c3)._m0[11].w, _297);
    float _301 = fma(_281, (*spvDescriptorSet0.vp_c3)._m0[11].y, _289);
    float _303 = fma(_281, (*spvDescriptorSet0.vp_c3)._m0[11].w, _295);
    float _305 = _159 * 0.15915493667125701904296875;
    float _307 = -(*spvDescriptorSet0.vp_c3)._m0[11].x;
    float _309 = fma(_281, _307, _299);
    float _311 = -(*spvDescriptorSet0.vp_c3)._m0[11].x;
    float _313 = fma(_271, _311, _301);
    float _315 = -(*spvDescriptorSet0.vp_c3)._m0[11].z;
    float _317 = fma(_271, _315, _303);
    float _319 = _239 * 4.9924825491034901066866337467265e-24;
    float _321 = -(*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _323 = fma(_271, _321, _309);
    float _325 = _259 * 4.9924825491034901066866337467265e-24;
    float _327 = _305 * 6.283185482025146484375;
    float _329 = cos(_327);
    float _331 = _283 * 4.9924825491034901066866337467265e-24;
    float _333 = _323 * _323;
    float _335 = precise::max(_325, _319);
    float _337 = fma(_313, _313, _333);
    float _339 = precise::max(_331, _335);
    float _341 = fma(_317, _317, _337);
    bool _345 = _339 != 0.0;
    bool _347 = isnan(_339);
    bool _349 = _345 || _347;
    bool _351 = isnan(0.0);
    bool _353 = _349 || _351;
    float _355 = rsqrt(_341);
    float _357 = _135 * _329;
    float _359 = _105 * _329;
    float _361 = fma(_357, (*spvDescriptorSet0.vp_c3)._m0[8].z, 0.5);
    float _363 = precise::clamp(_361, 0.0, 1.0);
    float _365 = fma(_359, (*spvDescriptorSet0.vp_c3)._m0[8].w, 0.5);
    float _367 = precise::clamp(_365, 0.0, 1.0);
    float _369 = _363 * (*spvDescriptorSet0.vp_c3)._m0[7].z;
    float _371 = 0.0;
    float _373 = _357;
    float _375 = _367;
    if (_353)
    {
        float _377 = 1.0 / _339;
        _371 = _377;
    }
    float _379 = _371;
    if (!_353)
    {
        _373 = 1.0;
    }
    float _381 = _373;
    out.gl_PointSize = _369;
    float _383 = _323 * _355;
    float _385 = _313 * _355;
    float _387 = _317 * _355;
    float _389 = -(*spvDescriptorSet0.vp_c3)._m0[7].x;
    float _391 = _389 + (*spvDescriptorSet0.vp_c3)._m0[7].y;
    float _393 = _383 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _395 = _383 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _397 = fma(_391, _367, (*spvDescriptorSet0.vp_c3)._m0[7].x);
    float _399 = fma(_385, (*spvDescriptorSet0.vp_c3)._m0[3].x, _393);
    float _401 = _383 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _403 = _381;
    float _405 = _399;
    if (_353)
    {
        float _407 = _331 * _379;
        _403 = _407;
    }
    float _409 = _403;
    if (!_353)
    {
        _375 = 1.0;
    }
    float _411 = _375;
    float _413 = fma(_387, (*spvDescriptorSet0.vp_c3)._m0[3].z, _399);
    float _415 = fma(_385, (*spvDescriptorSet0.vp_c3)._m0[0].x, _401);
    float _417 = fma(_385, (*spvDescriptorSet0.vp_c3)._m0[1].x, _395);
    float _419 = _411;
    if (!_353)
    {
        _405 = 1.0;
    }
    float _421 = _405;
    float _423 = 1.0 / _413;
    float _425 = _421;
    if (_353)
    {
        float _427 = _325 * _379;
        _425 = _427;
    }
    float _429 = _425;
    if (_353)
    {
        float _431 = _319 * _379;
        _419 = _431;
    }
    float _433 = _419;
    float _435 = _397 * _409;
    float _437 = fma(_387, (*spvDescriptorSet0.vp_c3)._m0[0].z, _415);
    float _439 = fma(_387, (*spvDescriptorSet0.vp_c3)._m0[1].z, _417);
    bool _441 = _413 > 0.0;
    float _443 = _397 * _429;
    float _445 = _397 * _433;
    int _447 = _441 ? 1065353216 : (-1073741824);
    out.m_25.x = _435;
    out.m_25.y = _443;
    out.m_25.z = _445;
    float _449 = _437 * _423;
    float _451 = _439 * _423;
    out.gl_Position.x = _449;
    out.gl_Position.y = _451;
    float _1107 = as_type<float>(_447);
    out.gl_Position.z = _1107;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_25 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _39 = as_type<float>(int(gl_VertexIndex));
    uint _42 = uint(int(uint(as_type<int>(_39)) >> uint(16)));
    int _45 = 61 ^ as_type<int>(_39);
    int _47 = int(_42) ^ _45;
    int _49 = _47 << 3;
    int _51 = _49 + _47;
    uint _53 = uint(int(uint(_51) >> uint(4)));
    int _55 = _51 ^ int(_53);
    int _57 = _55 * 668265261;
    uint _59 = uint(int(uint(_57) >> uint(15)));
    int _61 = _57 ^ int(_59);
    int _63 = _61 << 13;
    int _65 = _61 ^ _63;
    uint _67 = uint(int(uint(_65) >> uint(17)));
    int _69 = _65 ^ int(_67);
    int _71 = _69 << 5;
    int _73 = _69 ^ _71;
    int _75 = _73 << 13;
    float _77 = float(uint(_73));
    int _79 = _73 ^ _75;
    float _81 = _77 * 2.3283064365386962890625e-10;
    float _83 = precise::clamp(_81, 0.0, 1.0);
    uint _85 = uint(int(uint(_79) >> uint(17)));
    int _87 = _79 ^ int(_85);
    float _89 = log2(_83);
    int _91 = _87 << 5;
    int _93 = _87 ^ _91;
    float _95 = float(uint(_93));
    float _97 = _95 * 2.3283064365386962890625e-10;
    float _99 = precise::clamp(_97, 0.0, 1.0);
    float _101 = _89 * (-1.38629436492919921875);
    float _103 = _99 * 6.283185482025146484375;
    float _105 = sqrt(_101);
    float _107 = _103 * 0.15915493667125701904296875;
    float _109 = _107 * 6.283185482025146484375;
    float _111 = cos(_109);
    float _113 = log2(_99);
    float _115 = _105 * _111;
    float _117 = fma(_115, (*spvDescriptorSet0.vp_c3)._m0[8].y, 0.5);
    float _119 = precise::clamp(_117, 0.0, 1.0);
    int _121 = _93 << 13;
    float _123 = _113 * (-1.38629436492919921875);
    int _125 = _93 ^ _121;
    float _127 = abs(_119);
    float _129 = log2(_127);
    uint _131 = uint(int(uint(_125) >> uint(17)));
    int _133 = _125 ^ int(_131);
    float _135 = sqrt(_123);
    int _137 = _133 << 5;
    int _139 = _133 ^ _137;
    float _141 = _129 * (*spvDescriptorSet0.vp_c3)._m0[8].x;
    int _143 = _139 << 13;
    float _145 = exp2(_141);
    int _147 = _139 ^ _143;
    float _149 = float(uint(_139));
    uint _151 = uint(int(uint(_147) >> uint(17)));
    float _153 = _149 * 2.3283064365386962890625e-10;
    float _155 = precise::clamp(_153, 0.0, 1.0);
    int _157 = _147 ^ int(_151);
    float _159 = _155 * 6.283185482025146484375;
    int _161 = _157 << 5;
    float _163 = fma(_145, 14200.0, 1800.0);
    int _165 = _157 ^ _161;
    float _167 = 1.0 / _163;
    int _169 = _165 << 13;
    int _171 = _165 ^ _169;
    float _173 = float(uint(_165));
    uint _175 = uint(int(uint(_171) >> uint(17)));
    float _177 = _173 * 2.3283064365386962890625e-10;
    float _179 = precise::clamp(_177, 0.0, 1.0);
    int _181 = _171 ^ int(_175);
    float _183 = fma(_179, 2.0, -1.0);
    int _185 = _181 << 5;
    float _187 = _167 * 29653.09375;
    float _189 = _167 * 38016.78515625;
    int _191 = _181 ^ _185;
    float _193 = -_183;
    float _195 = fma(_193, _183, 1.0);
    float _197 = exp2(_187);
    float _199 = float(uint(_191));
    float _201 = _199 * 2.3283064365386962890625e-10;
    float _203 = precise::clamp(_201, 0.0, 1.0);
    float _205 = sqrt(_195);
    float _207 = _167 * 47608.17578125;
    float _209 = _203 * 6.283185482025146484375;
    float _211 = _209 * 0.15915493667125701904296875;
    float _213 = exp2(_207);
    float _215 = fma(_197, 1.680695139083943012967268610601e-31, -1.680695139083943012967268610601e-31);
    float _217 = _211 * 6.283185482025146484375;
    float _219 = sin(_217);
    float _221 = _211 * 6.283185482025146484375;
    float _223 = cos(_221);
    float _225 = exp2(_189);
    float _227 = _205 * _219;
    float _229 = fma(_213, 1.575550049364048909983859650751e-32, -1.575550049364048909983859650751e-32);
    float _231 = _227 * (*spvDescriptorSet0.vp_c3)._m0[11].z;
    float _233 = _227 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _235 = _205 * _223;
    float _237 = _183 * (*spvDescriptorSet0.vp_c3)._m0[11].x;
    float _239 = 1.0 / _229;
    float _241 = _235 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _243 = fma(_225, 4.8524700675531733900826436440669e-32, -4.8524700675531733900826436440669e-32);
    float _245 = -_237;
    float _247 = fma(_235, (*spvDescriptorSet0.vp_c3)._m0[11].z, _245);
    float _249 = -_231;
    float _251 = fma(_183, (*spvDescriptorSet0.vp_c3)._m0[11].y, _249);
    float _253 = -_235;
    float _255 = -_233;
    float _257 = fma(_253, (*spvDescriptorSet0.vp_c3)._m0[11].x, _255);
    float _259 = 1.0 / _243;
    float _261 = fma(_227, (*spvDescriptorSet0.vp_c3)._m0[11].w, _247);
    float _263 = fma(_235, (*spvDescriptorSet0.vp_c3)._m0[11].w, _251);
    float _265 = -_241;
    float _267 = fma(_227, (*spvDescriptorSet0.vp_c3)._m0[11].x, _265);
    float _269 = -_183;
    float _271 = fma(_269, (*spvDescriptorSet0.vp_c3)._m0[11].z, _257);
    float _273 = -(*spvDescriptorSet0.vp_c3)._m0[11].z;
    float _275 = _261 * _273;
    float _277 = -(*spvDescriptorSet0.vp_c3)._m0[11].x;
    float _279 = _261 * _277;
    float _281 = fma(_183, (*spvDescriptorSet0.vp_c3)._m0[11].w, _267);
    float _283 = 1.0 / _215;
    float _285 = -(*spvDescriptorSet0.vp_c3)._m0[11].z;
    float _287 = _263 * _285;
    float _289 = fma(_263, (*spvDescriptorSet0.vp_c3)._m0[11].w, _275);
    float _291 = -(*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _293 = -_279;
    float _295 = fma(_263, _291, _293);
    float _297 = -_287;
    float _299 = fma(_261, (*spvDescriptorSet0.vp_c3)._m0[11].w, _297);
    float _301 = fma(_281, (*spvDescriptorSet0.vp_c3)._m0[11].y, _289);
    float _303 = fma(_281, (*spvDescriptorSet0.vp_c3)._m0[11].w, _295);
    float _305 = _159 * 0.15915493667125701904296875;
    float _307 = -(*spvDescriptorSet0.vp_c3)._m0[11].x;
    float _309 = fma(_281, _307, _299);
    float _311 = -(*spvDescriptorSet0.vp_c3)._m0[11].x;
    float _313 = fma(_271, _311, _301);
    float _315 = -(*spvDescriptorSet0.vp_c3)._m0[11].z;
    float _317 = fma(_271, _315, _303);
    float _319 = _239 * 4.9924825491034901066866337467265e-24;
    float _321 = -(*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _323 = fma(_271, _321, _309);
    float _325 = _259 * 4.9924825491034901066866337467265e-24;
    float _327 = _305 * 6.283185482025146484375;
    float _329 = cos(_327);
    float _331 = _283 * 4.9924825491034901066866337467265e-24;
    float _333 = _323 * _323;
    float _335 = precise::max(_325, _319);
    float _337 = fma(_313, _313, _333);
    float _339 = precise::max(_331, _335);
    float _341 = fma(_317, _317, _337);
    bool _345 = _339 != 0.0;
    bool _347 = isnan(_339);
    bool _349 = _345 || _347;
    bool _351 = isnan(0.0);
    bool _353 = _349 || _351;
    float _355 = rsqrt(_341);
    float _357 = _135 * _329;
    float _359 = _105 * _329;
    float _361 = fma(_357, (*spvDescriptorSet0.vp_c3)._m0[8].z, 0.5);
    float _363 = precise::clamp(_361, 0.0, 1.0);
    float _365 = fma(_359, (*spvDescriptorSet0.vp_c3)._m0[8].w, 0.5);
    float _367 = precise::clamp(_365, 0.0, 1.0);
    float _369 = _363 * (*spvDescriptorSet0.vp_c3)._m0[7].z;
    float _371 = 0.0;
    float _373 = _357;
    float _375 = _367;
    if (_353)
    {
        float _377 = 1.0 / _339;
        _371 = _377;
    }
    float _379 = _371;
    if (!_353)
    {
        _373 = 1.0;
    }
    float _381 = _373;
    out.gl_PointSize = _369;
    float _383 = _323 * _355;
    float _385 = _313 * _355;
    float _387 = _317 * _355;
    float _389 = -(*spvDescriptorSet0.vp_c3)._m0[7].x;
    float _391 = _389 + (*spvDescriptorSet0.vp_c3)._m0[7].y;
    float _393 = _383 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _395 = _383 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _397 = fma(_391, _367, (*spvDescriptorSet0.vp_c3)._m0[7].x);
    float _399 = fma(_385, (*spvDescriptorSet0.vp_c3)._m0[3].x, _393);
    float _401 = _383 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _403 = _381;
    float _405 = _399;
    if (_353)
    {
        float _407 = _331 * _379;
        _403 = _407;
    }
    float _409 = _403;
    if (!_353)
    {
        _375 = 1.0;
    }
    float _411 = _375;
    float _413 = fma(_387, (*spvDescriptorSet0.vp_c3)._m0[3].z, _399);
    float _415 = fma(_385, (*spvDescriptorSet0.vp_c3)._m0[0].x, _401);
    float _417 = fma(_385, (*spvDescriptorSet0.vp_c3)._m0[1].x, _395);
    float _419 = _411;
    if (!_353)
    {
        _405 = 1.0;
    }
    float _421 = _405;
    float _423 = 1.0 / _413;
    float _425 = _421;
    if (_353)
    {
        float _427 = _325 * _379;
        _425 = _427;
    }
    float _429 = _425;
    if (_353)
    {
        float _431 = _319 * _379;
        _419 = _431;
    }
    float _433 = _419;
    float _435 = _397 * _409;
    float _437 = fma(_387, (*spvDescriptorSet0.vp_c3)._m0[0].z, _415);
    float _439 = fma(_387, (*spvDescriptorSet0.vp_c3)._m0[1].z, _417);
    bool _441 = _413 > 0.0;
    float _443 = _397 * _429;
    float _445 = _397 * _433;
    int _447 = _441 ? 1065353216 : (-1073741824);
    out.m_25.x = _435;
    out.m_25.y = _443;
    out.m_25.z = _445;
    float _449 = _437 * _423;
    float _451 = _439 * _423;
    out.gl_Position.x = _449;
    out.gl_Position.y = _451;
    float _1107 = as_type<float>(_447);
    out.gl_Position.z = _1107;
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
    out.m_25 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _39 = as_type<float>(int(gl_VertexIndex));
    uint _42 = uint(int(uint(as_type<int>(_39)) >> uint(16)));
    int _45 = 61 ^ as_type<int>(_39);
    int _47 = int(_42) ^ _45;
    int _49 = _47 << 3;
    int _51 = _49 + _47;
    uint _53 = uint(int(uint(_51) >> uint(4)));
    int _55 = _51 ^ int(_53);
    int _57 = _55 * 668265261;
    uint _59 = uint(int(uint(_57) >> uint(15)));
    int _61 = _57 ^ int(_59);
    int _63 = _61 << 13;
    int _65 = _61 ^ _63;
    uint _67 = uint(int(uint(_65) >> uint(17)));
    int _69 = _65 ^ int(_67);
    int _71 = _69 << 5;
    int _73 = _69 ^ _71;
    int _75 = _73 << 13;
    float _77 = float(uint(_73));
    int _79 = _73 ^ _75;
    float _81 = _77 * 2.3283064365386962890625e-10;
    float _83 = precise::clamp(_81, 0.0, 1.0);
    uint _85 = uint(int(uint(_79) >> uint(17)));
    int _87 = _79 ^ int(_85);
    float _89 = log2(_83);
    int _91 = _87 << 5;
    int _93 = _87 ^ _91;
    float _95 = float(uint(_93));
    float _97 = _95 * 2.3283064365386962890625e-10;
    float _99 = precise::clamp(_97, 0.0, 1.0);
    float _101 = _89 * (-1.38629436492919921875);
    float _103 = _99 * 6.283185482025146484375;
    float _105 = sqrt(_101);
    float _107 = _103 * 0.15915493667125701904296875;
    float _109 = _107 * 6.283185482025146484375;
    float _111 = cos(_109);
    float _113 = log2(_99);
    float _115 = _105 * _111;
    float _117 = fma(_115, (*spvDescriptorSet0.vp_c3)._m0[8].y, 0.5);
    float _119 = precise::clamp(_117, 0.0, 1.0);
    int _121 = _93 << 13;
    float _123 = _113 * (-1.38629436492919921875);
    int _125 = _93 ^ _121;
    float _127 = abs(_119);
    float _129 = log2(_127);
    uint _131 = uint(int(uint(_125) >> uint(17)));
    int _133 = _125 ^ int(_131);
    float _135 = sqrt(_123);
    int _137 = _133 << 5;
    int _139 = _133 ^ _137;
    float _141 = _129 * (*spvDescriptorSet0.vp_c3)._m0[8].x;
    int _143 = _139 << 13;
    float _145 = exp2(_141);
    int _147 = _139 ^ _143;
    float _149 = float(uint(_139));
    uint _151 = uint(int(uint(_147) >> uint(17)));
    float _153 = _149 * 2.3283064365386962890625e-10;
    float _155 = precise::clamp(_153, 0.0, 1.0);
    int _157 = _147 ^ int(_151);
    float _159 = _155 * 6.283185482025146484375;
    int _161 = _157 << 5;
    float _163 = fma(_145, 14200.0, 1800.0);
    int _165 = _157 ^ _161;
    float _167 = 1.0 / _163;
    int _169 = _165 << 13;
    int _171 = _165 ^ _169;
    float _173 = float(uint(_165));
    uint _175 = uint(int(uint(_171) >> uint(17)));
    float _177 = _173 * 2.3283064365386962890625e-10;
    float _179 = precise::clamp(_177, 0.0, 1.0);
    int _181 = _171 ^ int(_175);
    float _183 = fma(_179, 2.0, -1.0);
    int _185 = _181 << 5;
    float _187 = _167 * 29653.09375;
    float _189 = _167 * 38016.78515625;
    int _191 = _181 ^ _185;
    float _193 = -_183;
    float _195 = fma(_193, _183, 1.0);
    float _197 = exp2(_187);
    float _199 = float(uint(_191));
    float _201 = _199 * 2.3283064365386962890625e-10;
    float _203 = precise::clamp(_201, 0.0, 1.0);
    float _205 = sqrt(_195);
    float _207 = _167 * 47608.17578125;
    float _209 = _203 * 6.283185482025146484375;
    float _211 = _209 * 0.15915493667125701904296875;
    float _213 = exp2(_207);
    float _215 = fma(_197, 1.680695139083943012967268610601e-31, -1.680695139083943012967268610601e-31);
    float _217 = _211 * 6.283185482025146484375;
    float _219 = sin(_217);
    float _221 = _211 * 6.283185482025146484375;
    float _223 = cos(_221);
    float _225 = exp2(_189);
    float _227 = _205 * _219;
    float _229 = fma(_213, 1.575550049364048909983859650751e-32, -1.575550049364048909983859650751e-32);
    float _231 = _227 * (*spvDescriptorSet0.vp_c3)._m0[11].z;
    float _233 = _227 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _235 = _205 * _223;
    float _237 = _183 * (*spvDescriptorSet0.vp_c3)._m0[11].x;
    float _239 = 1.0 / _229;
    float _241 = _235 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _243 = fma(_225, 4.8524700675531733900826436440669e-32, -4.8524700675531733900826436440669e-32);
    float _245 = -_237;
    float _247 = fma(_235, (*spvDescriptorSet0.vp_c3)._m0[11].z, _245);
    float _249 = -_231;
    float _251 = fma(_183, (*spvDescriptorSet0.vp_c3)._m0[11].y, _249);
    float _253 = -_235;
    float _255 = -_233;
    float _257 = fma(_253, (*spvDescriptorSet0.vp_c3)._m0[11].x, _255);
    float _259 = 1.0 / _243;
    float _261 = fma(_227, (*spvDescriptorSet0.vp_c3)._m0[11].w, _247);
    float _263 = fma(_235, (*spvDescriptorSet0.vp_c3)._m0[11].w, _251);
    float _265 = -_241;
    float _267 = fma(_227, (*spvDescriptorSet0.vp_c3)._m0[11].x, _265);
    float _269 = -_183;
    float _271 = fma(_269, (*spvDescriptorSet0.vp_c3)._m0[11].z, _257);
    float _273 = -(*spvDescriptorSet0.vp_c3)._m0[11].z;
    float _275 = _261 * _273;
    float _277 = -(*spvDescriptorSet0.vp_c3)._m0[11].x;
    float _279 = _261 * _277;
    float _281 = fma(_183, (*spvDescriptorSet0.vp_c3)._m0[11].w, _267);
    float _283 = 1.0 / _215;
    float _285 = -(*spvDescriptorSet0.vp_c3)._m0[11].z;
    float _287 = _263 * _285;
    float _289 = fma(_263, (*spvDescriptorSet0.vp_c3)._m0[11].w, _275);
    float _291 = -(*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _293 = -_279;
    float _295 = fma(_263, _291, _293);
    float _297 = -_287;
    float _299 = fma(_261, (*spvDescriptorSet0.vp_c3)._m0[11].w, _297);
    float _301 = fma(_281, (*spvDescriptorSet0.vp_c3)._m0[11].y, _289);
    float _303 = fma(_281, (*spvDescriptorSet0.vp_c3)._m0[11].w, _295);
    float _305 = _159 * 0.15915493667125701904296875;
    float _307 = -(*spvDescriptorSet0.vp_c3)._m0[11].x;
    float _309 = fma(_281, _307, _299);
    float _311 = -(*spvDescriptorSet0.vp_c3)._m0[11].x;
    float _313 = fma(_271, _311, _301);
    float _315 = -(*spvDescriptorSet0.vp_c3)._m0[11].z;
    float _317 = fma(_271, _315, _303);
    float _319 = _239 * 4.9924825491034901066866337467265e-24;
    float _321 = -(*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _323 = fma(_271, _321, _309);
    float _325 = _259 * 4.9924825491034901066866337467265e-24;
    float _327 = _305 * 6.283185482025146484375;
    float _329 = cos(_327);
    float _331 = _283 * 4.9924825491034901066866337467265e-24;
    float _333 = _323 * _323;
    float _335 = precise::max(_325, _319);
    float _337 = fma(_313, _313, _333);
    float _339 = precise::max(_331, _335);
    float _341 = fma(_317, _317, _337);
    bool _345 = _339 != 0.0;
    bool _347 = isnan(_339);
    bool _349 = _345 || _347;
    bool _351 = isnan(0.0);
    bool _353 = _349 || _351;
    float _355 = rsqrt(_341);
    float _357 = _135 * _329;
    float _359 = _105 * _329;
    float _361 = fma(_357, (*spvDescriptorSet0.vp_c3)._m0[8].z, 0.5);
    float _363 = precise::clamp(_361, 0.0, 1.0);
    float _365 = fma(_359, (*spvDescriptorSet0.vp_c3)._m0[8].w, 0.5);
    float _367 = precise::clamp(_365, 0.0, 1.0);
    float _369 = _363 * (*spvDescriptorSet0.vp_c3)._m0[7].z;
    float _371 = 0.0;
    float _373 = _357;
    float _375 = _367;
    if (_353)
    {
        float _377 = 1.0 / _339;
        _371 = _377;
    }
    float _379 = _371;
    if (!_353)
    {
        _373 = 1.0;
    }
    float _381 = _373;
    out.gl_PointSize = _369;
    float _383 = _323 * _355;
    float _385 = _313 * _355;
    float _387 = _317 * _355;
    float _389 = -(*spvDescriptorSet0.vp_c3)._m0[7].x;
    float _391 = _389 + (*spvDescriptorSet0.vp_c3)._m0[7].y;
    float _393 = _383 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _395 = _383 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _397 = fma(_391, _367, (*spvDescriptorSet0.vp_c3)._m0[7].x);
    float _399 = fma(_385, (*spvDescriptorSet0.vp_c3)._m0[3].x, _393);
    float _401 = _383 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _403 = _381;
    float _405 = _399;
    if (_353)
    {
        float _407 = _331 * _379;
        _403 = _407;
    }
    float _409 = _403;
    if (!_353)
    {
        _375 = 1.0;
    }
    float _411 = _375;
    float _413 = fma(_387, (*spvDescriptorSet0.vp_c3)._m0[3].z, _399);
    float _415 = fma(_385, (*spvDescriptorSet0.vp_c3)._m0[0].x, _401);
    float _417 = fma(_385, (*spvDescriptorSet0.vp_c3)._m0[1].x, _395);
    float _419 = _411;
    if (!_353)
    {
        _405 = 1.0;
    }
    float _421 = _405;
    float _423 = 1.0 / _413;
    float _425 = _421;
    if (_353)
    {
        float _427 = _325 * _379;
        _425 = _427;
    }
    float _429 = _425;
    if (_353)
    {
        float _431 = _319 * _379;
        _419 = _431;
    }
    float _433 = _419;
    float _435 = _397 * _409;
    float _437 = fma(_387, (*spvDescriptorSet0.vp_c3)._m0[0].z, _415);
    float _439 = fma(_387, (*spvDescriptorSet0.vp_c3)._m0[1].z, _417);
    bool _441 = _413 > 0.0;
    float _443 = _397 * _429;
    float _445 = _397 * _433;
    int _447 = _441 ? 1065353216 : (-1073741824);
    out.m_25.x = _435;
    out.m_25.y = _443;
    out.m_25.z = _445;
    float _449 = _437 * _423;
    float _451 = _439 * _423;
    out.gl_Position.x = _449;
    out.gl_Position.y = _451;
    float _1107 = as_type<float>(_447);
    out.gl_Position.z = _1107;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_25.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_25.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_25.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_25.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

