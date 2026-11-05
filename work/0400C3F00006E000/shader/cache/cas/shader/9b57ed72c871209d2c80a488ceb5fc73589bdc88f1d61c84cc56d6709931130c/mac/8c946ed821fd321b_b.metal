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

struct _27
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    constant _16* vp_c7 [[id(0)]];
    constant _16* vp_c9 [[id(1)]];
    constant _16* vp_c4 [[id(2)]];
    const device _27* vp_s0 [[id(3)]];
};

struct main0_out
{
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_37 [[attribute(0)]];
    float4 m_39 [[attribute(5)]];
    uint4 m_34 [[attribute(7)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _53 = as_type<float>(in.m_34.x);
    float _55 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[0]);
    float _57 = in.m_37.x;
    float _59 = in.m_37.y;
    float _61 = in.m_37.z;
    float _63 = in.m_39.x;
    int _66 = as_type<int>(_55) * as_type<int>((*spvDescriptorSet0.vp_c7)._m0[9].y);
    int _68 = _66 + as_type<int>(_53);
    int _70 = _68 * 48;
    int _72 = _70 + 32;
    int _74 = _70 + 16;
    int _76 = _70 + 48;
    uint _79 = uint(int(uint(_72) >> uint(2)));
    packed_uint4 _dmw1 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_79)];
    float _81 = as_type<float>(_dmw1.x);
    int _83 = _72 + 4;
    uint _85 = uint(int(uint(_83) >> uint(2)));
    float _87 = as_type<float>(_dmw1.y);
    int _89 = _72 + 8;
    uint _91 = uint(int(uint(_89) >> uint(2)));
    float _93 = as_type<float>(_dmw1.z);
    int _95 = _72 + 12;
    uint _97 = uint(int(uint(_95) >> uint(2)));
    float _99 = as_type<float>(_dmw1.w);
    uint _101 = uint(int(uint(_74) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_101)];
    float _103 = as_type<float>(_dmw0.x);
    int _105 = _74 + 4;
    uint _107 = uint(int(uint(_105) >> uint(2)));
    float _109 = as_type<float>(_dmw0.y);
    int _111 = _74 + 8;
    uint _113 = uint(int(uint(_111) >> uint(2)));
    float _115 = as_type<float>(_dmw0.z);
    int _117 = _74 + 12;
    uint _119 = uint(int(uint(_117) >> uint(2)));
    float _121 = as_type<float>(_dmw0.w);
    uint _123 = uint(int(uint(_76) >> uint(2)));
    packed_uint4 _dmw2 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_123)];
    float _125 = as_type<float>(_dmw2.x);
    int _127 = _76 + 4;
    uint _129 = uint(int(uint(_127) >> uint(2)));
    float _131 = as_type<float>(_dmw2.y);
    int _133 = _76 + 8;
    uint _135 = uint(int(uint(_133) >> uint(2)));
    float _137 = as_type<float>(_dmw2.z);
    int _139 = _76 + 12;
    uint _141 = uint(int(uint(_139) >> uint(2)));
    float _143 = as_type<float>(_dmw2.w);
    float _145 = _87 * _59;
    float _147 = _109 * _59;
    float _149 = fma(_81, _57, _145);
    float _151 = _131 * _59;
    float _153 = fma(_103, _57, _147);
    float _155 = fma(_93, _61, _149);
    float _157 = fma(_125, _57, _151);
    float _159 = fma(_115, _61, _153);
    float _161 = _99 + _155;
    float _163 = fma(_137, _61, _157);
    float _165 = _121 + _159;
    float _167 = _161 * _63;
    float _169 = _143 + _163;
    float _171 = _165 * _63;
    float _173 = _167 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _175 = _167 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _177 = _169 * _63;
    float _179 = fma(_171, (*spvDescriptorSet0.vp_c7)._m0[2].x, _173);
    float _181 = fma(_171, (*spvDescriptorSet0.vp_c7)._m0[0].x, _175);
    float _183 = fma(_177, (*spvDescriptorSet0.vp_c7)._m0[2].z, _179);
    float _185 = fma(_177, (*spvDescriptorSet0.vp_c7)._m0[0].z, _181);
    float _187 = _183 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _189 = _185 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _191 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _193 = _187 + _191;
    float _195 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _197 = _189 + _195;
    float _199 = _193 * _193;
    float _201 = fma(_197, _197, _199);
    float _203 = _167 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _205 = sqrt(_201);
    float _207 = fma(_171, (*spvDescriptorSet0.vp_c7)._m0[1].x, _203);
    float _209 = fma(_177, (*spvDescriptorSet0.vp_c7)._m0[1].z, _207);
    float _211 = _209 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    bool _215 = _205 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _217 = _177;
    float _219 = _189;
    float _221 = _187;
    if (!_215)
    {
        _217 = _189;
    }
    float _223 = _217;
    float _225 = _223;
    if (!_215)
    {
        _219 = _211;
    }
    float _227 = _219;
    bool _229 = !_215;
    float _231 = _227;
    if (!_229)
    {
        float _233 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _235 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _237 = _205 + _235;
        float _239 = _211 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _241 = rsqrt(_201);
        float _243 = _237 * _233;
        float _245 = _243 * 0.15915493667125701904296875;
        float _247 = _245 * 6.283185482025146484375;
        float _249 = cos(_247);
        float _251 = _245 * 6.283185482025146484375;
        float _253 = sin(_251);
        float _255 = _249 + (-1.0);
        float _257 = _255 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _259 = fma(_253, _239, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _261 = fma(_211, _249, _257);
        float _263 = _241 * _259;
        float _265 = fma(_197, _263, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _267 = fma(_193, _263, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        _231 = _261;
        _225 = _265;
        _221 = _267;
    }
    float _269 = _231;
    float _271 = _225;
    float _273 = _221;
    float _275 = _269 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _277 = _269 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _279 = _269 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _281 = fma(_271, (*spvDescriptorSet0.vp_c4)._m0[1].x, _275);
    float _283 = fma(_271, (*spvDescriptorSet0.vp_c4)._m0[0].x, _277);
    float _285 = fma(_271, (*spvDescriptorSet0.vp_c4)._m0[2].x, _279);
    float _287 = fma(_273, (*spvDescriptorSet0.vp_c4)._m0[1].z, _281);
    float _289 = fma(_273, (*spvDescriptorSet0.vp_c4)._m0[0].z, _283);
    float _291 = fma(_273, (*spvDescriptorSet0.vp_c4)._m0[2].z, _285);
    float _293 = _287 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _295 = _289 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _297 = _291 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _299 = _293 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _301 = _293 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _303 = _293 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _305 = _293 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _307 = fma(_295, (*spvDescriptorSet0.vp_c4)._m0[8].x, _299);
    float _309 = fma(_295, (*spvDescriptorSet0.vp_c4)._m0[7].x, _301);
    float _311 = fma(_295, (*spvDescriptorSet0.vp_c4)._m0[9].x, _303);
    float _313 = fma(_295, (*spvDescriptorSet0.vp_c4)._m0[10].x, _305);
    float _315 = fma(_297, (*spvDescriptorSet0.vp_c4)._m0[8].z, _307);
    float _317 = fma(_297, (*spvDescriptorSet0.vp_c4)._m0[7].z, _309);
    float _319 = fma(_297, (*spvDescriptorSet0.vp_c4)._m0[9].z, _311);
    float _321 = fma(_297, (*spvDescriptorSet0.vp_c4)._m0[10].z, _313);
    float _323 = _315 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _325 = _317 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _327 = _319 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _329 = _321 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.gl_Position.x = _325;
    out.gl_Position.y = _323;
    out.gl_Position.z = _327;
    out.gl_Position.w = _329;
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
    float _53 = as_type<float>(in.m_34.x);
    float _55 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[0]);
    float _57 = in.m_37.x;
    float _59 = in.m_37.y;
    float _61 = in.m_37.z;
    float _63 = in.m_39.x;
    int _66 = as_type<int>(_55) * as_type<int>((*spvDescriptorSet0.vp_c7)._m0[9].y);
    int _68 = _66 + as_type<int>(_53);
    int _70 = _68 * 48;
    int _72 = _70 + 32;
    int _74 = _70 + 16;
    int _76 = _70 + 48;
    uint _79 = uint(int(uint(_72) >> uint(2)));
    packed_uint4 _dmw1 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_79)];
    float _81 = as_type<float>(_dmw1.x);
    int _83 = _72 + 4;
    uint _85 = uint(int(uint(_83) >> uint(2)));
    float _87 = as_type<float>(_dmw1.y);
    int _89 = _72 + 8;
    uint _91 = uint(int(uint(_89) >> uint(2)));
    float _93 = as_type<float>(_dmw1.z);
    int _95 = _72 + 12;
    uint _97 = uint(int(uint(_95) >> uint(2)));
    float _99 = as_type<float>(_dmw1.w);
    uint _101 = uint(int(uint(_74) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_101)];
    float _103 = as_type<float>(_dmw0.x);
    int _105 = _74 + 4;
    uint _107 = uint(int(uint(_105) >> uint(2)));
    float _109 = as_type<float>(_dmw0.y);
    int _111 = _74 + 8;
    uint _113 = uint(int(uint(_111) >> uint(2)));
    float _115 = as_type<float>(_dmw0.z);
    int _117 = _74 + 12;
    uint _119 = uint(int(uint(_117) >> uint(2)));
    float _121 = as_type<float>(_dmw0.w);
    uint _123 = uint(int(uint(_76) >> uint(2)));
    packed_uint4 _dmw2 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_123)];
    float _125 = as_type<float>(_dmw2.x);
    int _127 = _76 + 4;
    uint _129 = uint(int(uint(_127) >> uint(2)));
    float _131 = as_type<float>(_dmw2.y);
    int _133 = _76 + 8;
    uint _135 = uint(int(uint(_133) >> uint(2)));
    float _137 = as_type<float>(_dmw2.z);
    int _139 = _76 + 12;
    uint _141 = uint(int(uint(_139) >> uint(2)));
    float _143 = as_type<float>(_dmw2.w);
    float _145 = _87 * _59;
    float _147 = _109 * _59;
    float _149 = fma(_81, _57, _145);
    float _151 = _131 * _59;
    float _153 = fma(_103, _57, _147);
    float _155 = fma(_93, _61, _149);
    float _157 = fma(_125, _57, _151);
    float _159 = fma(_115, _61, _153);
    float _161 = _99 + _155;
    float _163 = fma(_137, _61, _157);
    float _165 = _121 + _159;
    float _167 = _161 * _63;
    float _169 = _143 + _163;
    float _171 = _165 * _63;
    float _173 = _167 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _175 = _167 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _177 = _169 * _63;
    float _179 = fma(_171, (*spvDescriptorSet0.vp_c7)._m0[2].x, _173);
    float _181 = fma(_171, (*spvDescriptorSet0.vp_c7)._m0[0].x, _175);
    float _183 = fma(_177, (*spvDescriptorSet0.vp_c7)._m0[2].z, _179);
    float _185 = fma(_177, (*spvDescriptorSet0.vp_c7)._m0[0].z, _181);
    float _187 = _183 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _189 = _185 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _191 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _193 = _187 + _191;
    float _195 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _197 = _189 + _195;
    float _199 = _193 * _193;
    float _201 = fma(_197, _197, _199);
    float _203 = _167 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _205 = sqrt(_201);
    float _207 = fma(_171, (*spvDescriptorSet0.vp_c7)._m0[1].x, _203);
    float _209 = fma(_177, (*spvDescriptorSet0.vp_c7)._m0[1].z, _207);
    float _211 = _209 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    bool _215 = _205 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _217 = _177;
    float _219 = _189;
    float _221 = _187;
    if (!_215)
    {
        _217 = _189;
    }
    float _223 = _217;
    float _225 = _223;
    if (!_215)
    {
        _219 = _211;
    }
    float _227 = _219;
    bool _229 = !_215;
    float _231 = _227;
    if (!_229)
    {
        float _233 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _235 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _237 = _205 + _235;
        float _239 = _211 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _241 = rsqrt(_201);
        float _243 = _237 * _233;
        float _245 = _243 * 0.15915493667125701904296875;
        float _247 = _245 * 6.283185482025146484375;
        float _249 = cos(_247);
        float _251 = _245 * 6.283185482025146484375;
        float _253 = sin(_251);
        float _255 = _249 + (-1.0);
        float _257 = _255 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _259 = fma(_253, _239, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _261 = fma(_211, _249, _257);
        float _263 = _241 * _259;
        float _265 = fma(_197, _263, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _267 = fma(_193, _263, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        _231 = _261;
        _225 = _265;
        _221 = _267;
    }
    float _269 = _231;
    float _271 = _225;
    float _273 = _221;
    float _275 = _269 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _277 = _269 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _279 = _269 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _281 = fma(_271, (*spvDescriptorSet0.vp_c4)._m0[1].x, _275);
    float _283 = fma(_271, (*spvDescriptorSet0.vp_c4)._m0[0].x, _277);
    float _285 = fma(_271, (*spvDescriptorSet0.vp_c4)._m0[2].x, _279);
    float _287 = fma(_273, (*spvDescriptorSet0.vp_c4)._m0[1].z, _281);
    float _289 = fma(_273, (*spvDescriptorSet0.vp_c4)._m0[0].z, _283);
    float _291 = fma(_273, (*spvDescriptorSet0.vp_c4)._m0[2].z, _285);
    float _293 = _287 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _295 = _289 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _297 = _291 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _299 = _293 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _301 = _293 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _303 = _293 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _305 = _293 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _307 = fma(_295, (*spvDescriptorSet0.vp_c4)._m0[8].x, _299);
    float _309 = fma(_295, (*spvDescriptorSet0.vp_c4)._m0[7].x, _301);
    float _311 = fma(_295, (*spvDescriptorSet0.vp_c4)._m0[9].x, _303);
    float _313 = fma(_295, (*spvDescriptorSet0.vp_c4)._m0[10].x, _305);
    float _315 = fma(_297, (*spvDescriptorSet0.vp_c4)._m0[8].z, _307);
    float _317 = fma(_297, (*spvDescriptorSet0.vp_c4)._m0[7].z, _309);
    float _319 = fma(_297, (*spvDescriptorSet0.vp_c4)._m0[9].z, _311);
    float _321 = fma(_297, (*spvDescriptorSet0.vp_c4)._m0[10].z, _313);
    float _323 = _315 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _325 = _317 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _327 = _319 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _329 = _321 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.gl_Position.x = _325;
    out.gl_Position.y = _323;
    out.gl_Position.z = _327;
    out.gl_Position.w = _329;
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
    float _53 = as_type<float>(in.m_34.x);
    float _55 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[0]);
    float _57 = in.m_37.x;
    float _59 = in.m_37.y;
    float _61 = in.m_37.z;
    float _63 = in.m_39.x;
    int _66 = as_type<int>(_55) * as_type<int>((*spvDescriptorSet0.vp_c7)._m0[9].y);
    int _68 = _66 + as_type<int>(_53);
    int _70 = _68 * 48;
    int _72 = _70 + 32;
    int _74 = _70 + 16;
    int _76 = _70 + 48;
    uint _79 = uint(int(uint(_72) >> uint(2)));
    packed_uint4 _dmw1 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_79)];
    float _81 = as_type<float>(_dmw1.x);
    int _83 = _72 + 4;
    uint _85 = uint(int(uint(_83) >> uint(2)));
    float _87 = as_type<float>(_dmw1.y);
    int _89 = _72 + 8;
    uint _91 = uint(int(uint(_89) >> uint(2)));
    float _93 = as_type<float>(_dmw1.z);
    int _95 = _72 + 12;
    uint _97 = uint(int(uint(_95) >> uint(2)));
    float _99 = as_type<float>(_dmw1.w);
    uint _101 = uint(int(uint(_74) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_101)];
    float _103 = as_type<float>(_dmw0.x);
    int _105 = _74 + 4;
    uint _107 = uint(int(uint(_105) >> uint(2)));
    float _109 = as_type<float>(_dmw0.y);
    int _111 = _74 + 8;
    uint _113 = uint(int(uint(_111) >> uint(2)));
    float _115 = as_type<float>(_dmw0.z);
    int _117 = _74 + 12;
    uint _119 = uint(int(uint(_117) >> uint(2)));
    float _121 = as_type<float>(_dmw0.w);
    uint _123 = uint(int(uint(_76) >> uint(2)));
    packed_uint4 _dmw2 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_123)];
    float _125 = as_type<float>(_dmw2.x);
    int _127 = _76 + 4;
    uint _129 = uint(int(uint(_127) >> uint(2)));
    float _131 = as_type<float>(_dmw2.y);
    int _133 = _76 + 8;
    uint _135 = uint(int(uint(_133) >> uint(2)));
    float _137 = as_type<float>(_dmw2.z);
    int _139 = _76 + 12;
    uint _141 = uint(int(uint(_139) >> uint(2)));
    float _143 = as_type<float>(_dmw2.w);
    float _145 = _87 * _59;
    float _147 = _109 * _59;
    float _149 = fma(_81, _57, _145);
    float _151 = _131 * _59;
    float _153 = fma(_103, _57, _147);
    float _155 = fma(_93, _61, _149);
    float _157 = fma(_125, _57, _151);
    float _159 = fma(_115, _61, _153);
    float _161 = _99 + _155;
    float _163 = fma(_137, _61, _157);
    float _165 = _121 + _159;
    float _167 = _161 * _63;
    float _169 = _143 + _163;
    float _171 = _165 * _63;
    float _173 = _167 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _175 = _167 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _177 = _169 * _63;
    float _179 = fma(_171, (*spvDescriptorSet0.vp_c7)._m0[2].x, _173);
    float _181 = fma(_171, (*spvDescriptorSet0.vp_c7)._m0[0].x, _175);
    float _183 = fma(_177, (*spvDescriptorSet0.vp_c7)._m0[2].z, _179);
    float _185 = fma(_177, (*spvDescriptorSet0.vp_c7)._m0[0].z, _181);
    float _187 = _183 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _189 = _185 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _191 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _193 = _187 + _191;
    float _195 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _197 = _189 + _195;
    float _199 = _193 * _193;
    float _201 = fma(_197, _197, _199);
    float _203 = _167 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _205 = sqrt(_201);
    float _207 = fma(_171, (*spvDescriptorSet0.vp_c7)._m0[1].x, _203);
    float _209 = fma(_177, (*spvDescriptorSet0.vp_c7)._m0[1].z, _207);
    float _211 = _209 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    bool _215 = _205 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _217 = _177;
    float _219 = _189;
    float _221 = _187;
    if (!_215)
    {
        _217 = _189;
    }
    float _223 = _217;
    float _225 = _223;
    if (!_215)
    {
        _219 = _211;
    }
    float _227 = _219;
    bool _229 = !_215;
    float _231 = _227;
    if (!_229)
    {
        float _233 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _235 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _237 = _205 + _235;
        float _239 = _211 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _241 = rsqrt(_201);
        float _243 = _237 * _233;
        float _245 = _243 * 0.15915493667125701904296875;
        float _247 = _245 * 6.283185482025146484375;
        float _249 = cos(_247);
        float _251 = _245 * 6.283185482025146484375;
        float _253 = sin(_251);
        float _255 = _249 + (-1.0);
        float _257 = _255 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _259 = fma(_253, _239, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _261 = fma(_211, _249, _257);
        float _263 = _241 * _259;
        float _265 = fma(_197, _263, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _267 = fma(_193, _263, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        _231 = _261;
        _225 = _265;
        _221 = _267;
    }
    float _269 = _231;
    float _271 = _225;
    float _273 = _221;
    float _275 = _269 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _277 = _269 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _279 = _269 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _281 = fma(_271, (*spvDescriptorSet0.vp_c4)._m0[1].x, _275);
    float _283 = fma(_271, (*spvDescriptorSet0.vp_c4)._m0[0].x, _277);
    float _285 = fma(_271, (*spvDescriptorSet0.vp_c4)._m0[2].x, _279);
    float _287 = fma(_273, (*spvDescriptorSet0.vp_c4)._m0[1].z, _281);
    float _289 = fma(_273, (*spvDescriptorSet0.vp_c4)._m0[0].z, _283);
    float _291 = fma(_273, (*spvDescriptorSet0.vp_c4)._m0[2].z, _285);
    float _293 = _287 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _295 = _289 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _297 = _291 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _299 = _293 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _301 = _293 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _303 = _293 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _305 = _293 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _307 = fma(_295, (*spvDescriptorSet0.vp_c4)._m0[8].x, _299);
    float _309 = fma(_295, (*spvDescriptorSet0.vp_c4)._m0[7].x, _301);
    float _311 = fma(_295, (*spvDescriptorSet0.vp_c4)._m0[9].x, _303);
    float _313 = fma(_295, (*spvDescriptorSet0.vp_c4)._m0[10].x, _305);
    float _315 = fma(_297, (*spvDescriptorSet0.vp_c4)._m0[8].z, _307);
    float _317 = fma(_297, (*spvDescriptorSet0.vp_c4)._m0[7].z, _309);
    float _319 = fma(_297, (*spvDescriptorSet0.vp_c4)._m0[9].z, _311);
    float _321 = fma(_297, (*spvDescriptorSet0.vp_c4)._m0[10].z, _313);
    float _323 = _315 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _325 = _317 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _327 = _319 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _329 = _321 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.gl_Position.x = _325;
    out.gl_Position.y = _323;
    out.gl_Position.z = _327;
    out.gl_Position.w = _329;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, 0u); dm_cw(dm_gs, dm_p, 17, 0u); dm_cw(dm_gs, dm_p, 18, 0u); dm_cw(dm_gs, dm_p, 19, 0x3f800000u); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

