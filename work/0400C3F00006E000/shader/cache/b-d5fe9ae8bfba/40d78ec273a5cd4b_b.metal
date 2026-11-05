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

struct _29
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    constant _16* vp_c11 [[id(0)]];
    constant _16* vp_c7 [[id(1)]];
    constant _16* vp_c9 [[id(2)]];
    constant _16* vp_c4 [[id(3)]];
    const device _29* vp_s0 [[id(4)]];
};

struct main0_out
{
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_39 [[attribute(0)]];
    float4 m_41 [[attribute(5)]];
    uint4 m_36 [[attribute(7)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _55 = as_type<float>(in.m_36.x);
    float _57 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[0]);
    float _59 = in.m_39.x;
    float _61 = in.m_39.y;
    float _63 = in.m_39.z;
    float _65 = in.m_41.x;
    int _68 = as_type<int>(_57) * as_type<int>((*spvDescriptorSet0.vp_c7)._m0[9].y);
    int _70 = _68 + as_type<int>(_55);
    int _72 = _70 * 48;
    int _74 = _72 + 32;
    int _76 = _72 + 16;
    int _78 = _72 + 48;
    uint _81 = uint(int(uint(_74) >> uint(2)));
    packed_uint4 _dmw1 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_81)];
    float _83 = as_type<float>(_dmw1.x);
    int _85 = _74 + 4;
    uint _87 = uint(int(uint(_85) >> uint(2)));
    float _89 = as_type<float>(_dmw1.y);
    int _91 = _74 + 8;
    uint _93 = uint(int(uint(_91) >> uint(2)));
    float _95 = as_type<float>(_dmw1.z);
    int _97 = _74 + 12;
    uint _99 = uint(int(uint(_97) >> uint(2)));
    float _101 = as_type<float>(_dmw1.w);
    uint _103 = uint(int(uint(_76) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_103)];
    float _105 = as_type<float>(_dmw0.x);
    int _107 = _76 + 4;
    uint _109 = uint(int(uint(_107) >> uint(2)));
    float _111 = as_type<float>(_dmw0.y);
    int _113 = _76 + 8;
    uint _115 = uint(int(uint(_113) >> uint(2)));
    float _117 = as_type<float>(_dmw0.z);
    int _119 = _76 + 12;
    uint _121 = uint(int(uint(_119) >> uint(2)));
    float _123 = as_type<float>(_dmw0.w);
    uint _125 = uint(int(uint(_78) >> uint(2)));
    packed_uint4 _dmw2 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_125)];
    float _127 = as_type<float>(_dmw2.x);
    int _129 = _78 + 4;
    uint _131 = uint(int(uint(_129) >> uint(2)));
    float _133 = as_type<float>(_dmw2.y);
    int _135 = _78 + 8;
    uint _137 = uint(int(uint(_135) >> uint(2)));
    float _139 = as_type<float>(_dmw2.z);
    int _141 = _78 + 12;
    uint _143 = uint(int(uint(_141) >> uint(2)));
    float _145 = as_type<float>(_dmw2.w);
    float _147 = _89 * _61;
    float _149 = _111 * _61;
    float _151 = fma(_83, _59, _147);
    float _153 = _133 * _61;
    float _155 = fma(_105, _59, _149);
    float _157 = fma(_95, _63, _151);
    float _159 = fma(_127, _59, _153);
    float _161 = fma(_117, _63, _155);
    float _163 = _101 + _157;
    float _165 = fma(_139, _63, _159);
    float _167 = _123 + _161;
    float _169 = _163 * _65;
    float _171 = _145 + _165;
    float _173 = _167 * _65;
    float _175 = _169 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _177 = _169 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _179 = _171 * _65;
    float _181 = fma(_173, (*spvDescriptorSet0.vp_c7)._m0[2].x, _175);
    float _183 = fma(_173, (*spvDescriptorSet0.vp_c7)._m0[0].x, _177);
    float _185 = fma(_179, (*spvDescriptorSet0.vp_c7)._m0[2].z, _181);
    float _187 = fma(_179, (*spvDescriptorSet0.vp_c7)._m0[0].z, _183);
    float _189 = _185 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _191 = _187 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _193 = _169 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _195 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _197 = _189 + _195;
    float _199 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _201 = _191 + _199;
    float _203 = fma(_173, (*spvDescriptorSet0.vp_c7)._m0[1].x, _193);
    float _205 = _197 * _197;
    float _207 = fma(_179, (*spvDescriptorSet0.vp_c7)._m0[1].z, _203);
    float _209 = fma(_201, _201, _205);
    float _211 = _207 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _213 = sqrt(_209);
    float _215 = _211 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _217 = fma(_191, (*spvDescriptorSet0.vp_c4)._m0[2].x, _215);
    float _219 = fma(_189, (*spvDescriptorSet0.vp_c4)._m0[2].z, _217);
    float _221 = _219 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    bool _225 = _213 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _227 = _215;
    float _229 = _191;
    float _231 = _189;
    float _233 = _221;
    if (!_225)
    {
        _227 = _191;
    }
    float _235 = _227;
    float _237 = _235;
    if (!_225)
    {
        _229 = _211;
    }
    float _239 = _229;
    bool _241 = !_225;
    float _243 = _239;
    if (!_241)
    {
        float _245 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _247 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _249 = _213 + _247;
        float _251 = _211 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _253 = rsqrt(_209);
        float _255 = _249 * _245;
        float _257 = _255 * 0.15915493667125701904296875;
        float _259 = _257 * 6.283185482025146484375;
        float _261 = cos(_259);
        float _263 = _257 * 6.283185482025146484375;
        float _265 = sin(_263);
        float _267 = _261 + (-1.0);
        float _269 = _267 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _271 = fma(_265, _251, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _273 = fma(_211, _261, _269);
        float _275 = _253 * _271;
        float _277 = _273 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _279 = fma(_201, _275, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _281 = fma(_197, _275, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _283 = fma(_279, (*spvDescriptorSet0.vp_c4)._m0[2].x, _277);
        float _285 = fma(_281, (*spvDescriptorSet0.vp_c4)._m0[2].z, _283);
        float _287 = _285 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _243 = _273;
        _237 = _279;
        _231 = _281;
        _233 = _287;
    }
    float _289 = _243;
    float _291 = _237;
    float _293 = _231;
    float _295 = _233;
    float _297 = _289 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _299 = _289 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _301 = fma(_291, (*spvDescriptorSet0.vp_c4)._m0[1].x, _297);
    float _303 = fma(_291, (*spvDescriptorSet0.vp_c4)._m0[0].x, _299);
    float _305 = fma(_293, (*spvDescriptorSet0.vp_c4)._m0[1].z, _301);
    float _307 = fma(_293, (*spvDescriptorSet0.vp_c4)._m0[0].z, _303);
    float _309 = _305 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _311 = _307 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _313 = _309 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _315 = fma(_311, (*spvDescriptorSet0.vp_c4)._m0[9].x, _313);
    float _317 = _309 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _319 = fma(_295, (*spvDescriptorSet0.vp_c4)._m0[9].z, _315);
    float _321 = fma(_311, (*spvDescriptorSet0.vp_c4)._m0[10].x, _317);
    float _323 = _319 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _325 = fma(_295, (*spvDescriptorSet0.vp_c4)._m0[10].z, _321);
    float _327 = _323 * 10000.0;
    float _329 = precise::clamp(_327, 0.0, 1.0);
    float _331 = _325 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    float _333 = _329 * (*spvDescriptorSet0.vp_c11)._m0[42].x;
    float _335 = _309 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _337 = _309 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _339 = fma(_333, (*spvDescriptorSet0.vp_c4)._m0[10].z, _331);
    float _341 = fma(_311, (*spvDescriptorSet0.vp_c4)._m0[7].x, _335);
    float _343 = fma(_311, (*spvDescriptorSet0.vp_c4)._m0[8].x, _337);
    float _345 = fma(_333, (*spvDescriptorSet0.vp_c4)._m0[9].z, _323);
    float _347 = 1.0 / _339;
    float _349 = fma(_295, (*spvDescriptorSet0.vp_c4)._m0[7].z, _341);
    float _351 = fma(_295, (*spvDescriptorSet0.vp_c4)._m0[8].z, _343);
    float _353 = _349 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _355 = _351 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _357 = _331 * _347;
    float _359 = _345 * _357;
    out.gl_Position.x = _353;
    out.gl_Position.y = _355;
    out.gl_Position.z = _359;
    out.gl_Position.w = _331;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _55 = as_type<float>(in.m_36.x);
    float _57 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[0]);
    float _59 = in.m_39.x;
    float _61 = in.m_39.y;
    float _63 = in.m_39.z;
    float _65 = in.m_41.x;
    int _68 = as_type<int>(_57) * as_type<int>((*spvDescriptorSet0.vp_c7)._m0[9].y);
    int _70 = _68 + as_type<int>(_55);
    int _72 = _70 * 48;
    int _74 = _72 + 32;
    int _76 = _72 + 16;
    int _78 = _72 + 48;
    uint _81 = uint(int(uint(_74) >> uint(2)));
    packed_uint4 _dmw1 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_81)];
    float _83 = as_type<float>(_dmw1.x);
    int _85 = _74 + 4;
    uint _87 = uint(int(uint(_85) >> uint(2)));
    float _89 = as_type<float>(_dmw1.y);
    int _91 = _74 + 8;
    uint _93 = uint(int(uint(_91) >> uint(2)));
    float _95 = as_type<float>(_dmw1.z);
    int _97 = _74 + 12;
    uint _99 = uint(int(uint(_97) >> uint(2)));
    float _101 = as_type<float>(_dmw1.w);
    uint _103 = uint(int(uint(_76) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_103)];
    float _105 = as_type<float>(_dmw0.x);
    int _107 = _76 + 4;
    uint _109 = uint(int(uint(_107) >> uint(2)));
    float _111 = as_type<float>(_dmw0.y);
    int _113 = _76 + 8;
    uint _115 = uint(int(uint(_113) >> uint(2)));
    float _117 = as_type<float>(_dmw0.z);
    int _119 = _76 + 12;
    uint _121 = uint(int(uint(_119) >> uint(2)));
    float _123 = as_type<float>(_dmw0.w);
    uint _125 = uint(int(uint(_78) >> uint(2)));
    packed_uint4 _dmw2 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_125)];
    float _127 = as_type<float>(_dmw2.x);
    int _129 = _78 + 4;
    uint _131 = uint(int(uint(_129) >> uint(2)));
    float _133 = as_type<float>(_dmw2.y);
    int _135 = _78 + 8;
    uint _137 = uint(int(uint(_135) >> uint(2)));
    float _139 = as_type<float>(_dmw2.z);
    int _141 = _78 + 12;
    uint _143 = uint(int(uint(_141) >> uint(2)));
    float _145 = as_type<float>(_dmw2.w);
    float _147 = _89 * _61;
    float _149 = _111 * _61;
    float _151 = fma(_83, _59, _147);
    float _153 = _133 * _61;
    float _155 = fma(_105, _59, _149);
    float _157 = fma(_95, _63, _151);
    float _159 = fma(_127, _59, _153);
    float _161 = fma(_117, _63, _155);
    float _163 = _101 + _157;
    float _165 = fma(_139, _63, _159);
    float _167 = _123 + _161;
    float _169 = _163 * _65;
    float _171 = _145 + _165;
    float _173 = _167 * _65;
    float _175 = _169 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _177 = _169 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _179 = _171 * _65;
    float _181 = fma(_173, (*spvDescriptorSet0.vp_c7)._m0[2].x, _175);
    float _183 = fma(_173, (*spvDescriptorSet0.vp_c7)._m0[0].x, _177);
    float _185 = fma(_179, (*spvDescriptorSet0.vp_c7)._m0[2].z, _181);
    float _187 = fma(_179, (*spvDescriptorSet0.vp_c7)._m0[0].z, _183);
    float _189 = _185 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _191 = _187 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _193 = _169 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _195 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _197 = _189 + _195;
    float _199 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _201 = _191 + _199;
    float _203 = fma(_173, (*spvDescriptorSet0.vp_c7)._m0[1].x, _193);
    float _205 = _197 * _197;
    float _207 = fma(_179, (*spvDescriptorSet0.vp_c7)._m0[1].z, _203);
    float _209 = fma(_201, _201, _205);
    float _211 = _207 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _213 = sqrt(_209);
    float _215 = _211 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _217 = fma(_191, (*spvDescriptorSet0.vp_c4)._m0[2].x, _215);
    float _219 = fma(_189, (*spvDescriptorSet0.vp_c4)._m0[2].z, _217);
    float _221 = _219 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    bool _225 = _213 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _227 = _215;
    float _229 = _191;
    float _231 = _189;
    float _233 = _221;
    if (!_225)
    {
        _227 = _191;
    }
    float _235 = _227;
    float _237 = _235;
    if (!_225)
    {
        _229 = _211;
    }
    float _239 = _229;
    bool _241 = !_225;
    float _243 = _239;
    if (!_241)
    {
        float _245 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _247 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _249 = _213 + _247;
        float _251 = _211 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _253 = rsqrt(_209);
        float _255 = _249 * _245;
        float _257 = _255 * 0.15915493667125701904296875;
        float _259 = _257 * 6.283185482025146484375;
        float _261 = cos(_259);
        float _263 = _257 * 6.283185482025146484375;
        float _265 = sin(_263);
        float _267 = _261 + (-1.0);
        float _269 = _267 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _271 = fma(_265, _251, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _273 = fma(_211, _261, _269);
        float _275 = _253 * _271;
        float _277 = _273 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _279 = fma(_201, _275, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _281 = fma(_197, _275, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _283 = fma(_279, (*spvDescriptorSet0.vp_c4)._m0[2].x, _277);
        float _285 = fma(_281, (*spvDescriptorSet0.vp_c4)._m0[2].z, _283);
        float _287 = _285 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _243 = _273;
        _237 = _279;
        _231 = _281;
        _233 = _287;
    }
    float _289 = _243;
    float _291 = _237;
    float _293 = _231;
    float _295 = _233;
    float _297 = _289 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _299 = _289 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _301 = fma(_291, (*spvDescriptorSet0.vp_c4)._m0[1].x, _297);
    float _303 = fma(_291, (*spvDescriptorSet0.vp_c4)._m0[0].x, _299);
    float _305 = fma(_293, (*spvDescriptorSet0.vp_c4)._m0[1].z, _301);
    float _307 = fma(_293, (*spvDescriptorSet0.vp_c4)._m0[0].z, _303);
    float _309 = _305 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _311 = _307 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _313 = _309 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _315 = fma(_311, (*spvDescriptorSet0.vp_c4)._m0[9].x, _313);
    float _317 = _309 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _319 = fma(_295, (*spvDescriptorSet0.vp_c4)._m0[9].z, _315);
    float _321 = fma(_311, (*spvDescriptorSet0.vp_c4)._m0[10].x, _317);
    float _323 = _319 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _325 = fma(_295, (*spvDescriptorSet0.vp_c4)._m0[10].z, _321);
    float _327 = _323 * 10000.0;
    float _329 = precise::clamp(_327, 0.0, 1.0);
    float _331 = _325 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    float _333 = _329 * (*spvDescriptorSet0.vp_c11)._m0[42].x;
    float _335 = _309 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _337 = _309 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _339 = fma(_333, (*spvDescriptorSet0.vp_c4)._m0[10].z, _331);
    float _341 = fma(_311, (*spvDescriptorSet0.vp_c4)._m0[7].x, _335);
    float _343 = fma(_311, (*spvDescriptorSet0.vp_c4)._m0[8].x, _337);
    float _345 = fma(_333, (*spvDescriptorSet0.vp_c4)._m0[9].z, _323);
    float _347 = 1.0 / _339;
    float _349 = fma(_295, (*spvDescriptorSet0.vp_c4)._m0[7].z, _341);
    float _351 = fma(_295, (*spvDescriptorSet0.vp_c4)._m0[8].z, _343);
    float _353 = _349 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _355 = _351 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _357 = _331 * _347;
    float _359 = _345 * _357;
    out.gl_Position.x = _353;
    out.gl_Position.y = _355;
    out.gl_Position.z = _359;
    out.gl_Position.w = _331;
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
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _55 = as_type<float>(in.m_36.x);
    float _57 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[0]);
    float _59 = in.m_39.x;
    float _61 = in.m_39.y;
    float _63 = in.m_39.z;
    float _65 = in.m_41.x;
    int _68 = as_type<int>(_57) * as_type<int>((*spvDescriptorSet0.vp_c7)._m0[9].y);
    int _70 = _68 + as_type<int>(_55);
    int _72 = _70 * 48;
    int _74 = _72 + 32;
    int _76 = _72 + 16;
    int _78 = _72 + 48;
    uint _81 = uint(int(uint(_74) >> uint(2)));
    packed_uint4 _dmw1 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_81)];
    float _83 = as_type<float>(_dmw1.x);
    int _85 = _74 + 4;
    uint _87 = uint(int(uint(_85) >> uint(2)));
    float _89 = as_type<float>(_dmw1.y);
    int _91 = _74 + 8;
    uint _93 = uint(int(uint(_91) >> uint(2)));
    float _95 = as_type<float>(_dmw1.z);
    int _97 = _74 + 12;
    uint _99 = uint(int(uint(_97) >> uint(2)));
    float _101 = as_type<float>(_dmw1.w);
    uint _103 = uint(int(uint(_76) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_103)];
    float _105 = as_type<float>(_dmw0.x);
    int _107 = _76 + 4;
    uint _109 = uint(int(uint(_107) >> uint(2)));
    float _111 = as_type<float>(_dmw0.y);
    int _113 = _76 + 8;
    uint _115 = uint(int(uint(_113) >> uint(2)));
    float _117 = as_type<float>(_dmw0.z);
    int _119 = _76 + 12;
    uint _121 = uint(int(uint(_119) >> uint(2)));
    float _123 = as_type<float>(_dmw0.w);
    uint _125 = uint(int(uint(_78) >> uint(2)));
    packed_uint4 _dmw2 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_125)];
    float _127 = as_type<float>(_dmw2.x);
    int _129 = _78 + 4;
    uint _131 = uint(int(uint(_129) >> uint(2)));
    float _133 = as_type<float>(_dmw2.y);
    int _135 = _78 + 8;
    uint _137 = uint(int(uint(_135) >> uint(2)));
    float _139 = as_type<float>(_dmw2.z);
    int _141 = _78 + 12;
    uint _143 = uint(int(uint(_141) >> uint(2)));
    float _145 = as_type<float>(_dmw2.w);
    float _147 = _89 * _61;
    float _149 = _111 * _61;
    float _151 = fma(_83, _59, _147);
    float _153 = _133 * _61;
    float _155 = fma(_105, _59, _149);
    float _157 = fma(_95, _63, _151);
    float _159 = fma(_127, _59, _153);
    float _161 = fma(_117, _63, _155);
    float _163 = _101 + _157;
    float _165 = fma(_139, _63, _159);
    float _167 = _123 + _161;
    float _169 = _163 * _65;
    float _171 = _145 + _165;
    float _173 = _167 * _65;
    float _175 = _169 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _177 = _169 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _179 = _171 * _65;
    float _181 = fma(_173, (*spvDescriptorSet0.vp_c7)._m0[2].x, _175);
    float _183 = fma(_173, (*spvDescriptorSet0.vp_c7)._m0[0].x, _177);
    float _185 = fma(_179, (*spvDescriptorSet0.vp_c7)._m0[2].z, _181);
    float _187 = fma(_179, (*spvDescriptorSet0.vp_c7)._m0[0].z, _183);
    float _189 = _185 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _191 = _187 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _193 = _169 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _195 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _197 = _189 + _195;
    float _199 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _201 = _191 + _199;
    float _203 = fma(_173, (*spvDescriptorSet0.vp_c7)._m0[1].x, _193);
    float _205 = _197 * _197;
    float _207 = fma(_179, (*spvDescriptorSet0.vp_c7)._m0[1].z, _203);
    float _209 = fma(_201, _201, _205);
    float _211 = _207 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _213 = sqrt(_209);
    float _215 = _211 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _217 = fma(_191, (*spvDescriptorSet0.vp_c4)._m0[2].x, _215);
    float _219 = fma(_189, (*spvDescriptorSet0.vp_c4)._m0[2].z, _217);
    float _221 = _219 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    bool _225 = _213 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _227 = _215;
    float _229 = _191;
    float _231 = _189;
    float _233 = _221;
    if (!_225)
    {
        _227 = _191;
    }
    float _235 = _227;
    float _237 = _235;
    if (!_225)
    {
        _229 = _211;
    }
    float _239 = _229;
    bool _241 = !_225;
    float _243 = _239;
    if (!_241)
    {
        float _245 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _247 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _249 = _213 + _247;
        float _251 = _211 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _253 = rsqrt(_209);
        float _255 = _249 * _245;
        float _257 = _255 * 0.15915493667125701904296875;
        float _259 = _257 * 6.283185482025146484375;
        float _261 = cos(_259);
        float _263 = _257 * 6.283185482025146484375;
        float _265 = sin(_263);
        float _267 = _261 + (-1.0);
        float _269 = _267 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _271 = fma(_265, _251, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _273 = fma(_211, _261, _269);
        float _275 = _253 * _271;
        float _277 = _273 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _279 = fma(_201, _275, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _281 = fma(_197, _275, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _283 = fma(_279, (*spvDescriptorSet0.vp_c4)._m0[2].x, _277);
        float _285 = fma(_281, (*spvDescriptorSet0.vp_c4)._m0[2].z, _283);
        float _287 = _285 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _243 = _273;
        _237 = _279;
        _231 = _281;
        _233 = _287;
    }
    float _289 = _243;
    float _291 = _237;
    float _293 = _231;
    float _295 = _233;
    float _297 = _289 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _299 = _289 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _301 = fma(_291, (*spvDescriptorSet0.vp_c4)._m0[1].x, _297);
    float _303 = fma(_291, (*spvDescriptorSet0.vp_c4)._m0[0].x, _299);
    float _305 = fma(_293, (*spvDescriptorSet0.vp_c4)._m0[1].z, _301);
    float _307 = fma(_293, (*spvDescriptorSet0.vp_c4)._m0[0].z, _303);
    float _309 = _305 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _311 = _307 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _313 = _309 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _315 = fma(_311, (*spvDescriptorSet0.vp_c4)._m0[9].x, _313);
    float _317 = _309 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _319 = fma(_295, (*spvDescriptorSet0.vp_c4)._m0[9].z, _315);
    float _321 = fma(_311, (*spvDescriptorSet0.vp_c4)._m0[10].x, _317);
    float _323 = _319 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _325 = fma(_295, (*spvDescriptorSet0.vp_c4)._m0[10].z, _321);
    float _327 = _323 * 10000.0;
    float _329 = precise::clamp(_327, 0.0, 1.0);
    float _331 = _325 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    float _333 = _329 * (*spvDescriptorSet0.vp_c11)._m0[42].x;
    float _335 = _309 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _337 = _309 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _339 = fma(_333, (*spvDescriptorSet0.vp_c4)._m0[10].z, _331);
    float _341 = fma(_311, (*spvDescriptorSet0.vp_c4)._m0[7].x, _335);
    float _343 = fma(_311, (*spvDescriptorSet0.vp_c4)._m0[8].x, _337);
    float _345 = fma(_333, (*spvDescriptorSet0.vp_c4)._m0[9].z, _323);
    float _347 = 1.0 / _339;
    float _349 = fma(_295, (*spvDescriptorSet0.vp_c4)._m0[7].z, _341);
    float _351 = fma(_295, (*spvDescriptorSet0.vp_c4)._m0[8].z, _343);
    float _353 = _349 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _355 = _351 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _357 = _331 * _347;
    float _359 = _345 * _357;
    out.gl_Position.x = _353;
    out.gl_Position.y = _355;
    out.gl_Position.z = _359;
    out.gl_Position.w = _331;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, 0u); dm_cw(dm_gs, dm_p, 17, 0u); dm_cw(dm_gs, dm_p, 18, 0u); dm_cw(dm_gs, dm_p, 19, 0x3f800000u); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

