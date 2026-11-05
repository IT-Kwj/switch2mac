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

struct _25
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    constant _16* vp_c0 [[id(0)]];
    constant _16* vp_c9 [[id(1)]];
    constant _16* vp_c4 [[id(2)]];
    const device _25* vp_s0 [[id(3)]];
};

struct main0_out
{
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_36 [[attribute(0)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_InstanceIndex [[instance_id]], uint gl_BaseInstance [[base_instance]])
{
    main0_out out = {};
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _50 = as_type<float>(int(gl_InstanceIndex));
    float _52 = as_type<float>(int(gl_BaseInstance));
    int _55 = as_type<int>(_50) - as_type<int>(_52);
    float _57 = in.m_36.x;
    float _59 = in.m_36.y;
    float _61 = in.m_36.z;
    int _63 = _55 + as_type<int>(as_type<float>(gl_BaseInstance));
    int _65 = _63 * 80;
    int _67 = _65 + 32;
    uint _70 = uint(int(uint(_65) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_70)];
    float _72 = as_type<float>(_dmw0.x);
    int _74 = _65 + 4;
    uint _76 = uint(int(uint(_74) >> uint(2)));
    float _78 = as_type<float>(_dmw0.y);
    int _80 = _65 + 8;
    uint _82 = uint(int(uint(_80) >> uint(2)));
    float _84 = as_type<float>(_dmw0.z);
    int _86 = _65 + 12;
    uint _88 = uint(int(uint(_86) >> uint(2)));
    float _90 = as_type<float>(_dmw0.w);
    uint _92 = uint(int(uint(_67) >> uint(2)));
    packed_uint4 _dmw2 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_92)];
    float _94 = as_type<float>(_dmw2.x);
    int _96 = _67 + 4;
    uint _98 = uint(int(uint(_96) >> uint(2)));
    float _100 = as_type<float>(_dmw2.y);
    int _102 = _67 + 8;
    uint _104 = uint(int(uint(_102) >> uint(2)));
    float _106 = as_type<float>(_dmw2.z);
    int _108 = _67 + 12;
    uint _110 = uint(int(uint(_108) >> uint(2)));
    float _112 = as_type<float>(_dmw2.w);
    int _114 = _65 + 16;
    uint _116 = uint(int(uint(_114) >> uint(2)));
    packed_uint4 _dmw1 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_116)];
    float _118 = as_type<float>(_dmw1.x);
    int _120 = _114 + 4;
    uint _122 = uint(int(uint(_120) >> uint(2)));
    float _124 = as_type<float>(_dmw1.y);
    int _126 = _114 + 8;
    uint _128 = uint(int(uint(_126) >> uint(2)));
    float _130 = as_type<float>(_dmw1.z);
    int _132 = _114 + 12;
    uint _134 = uint(int(uint(_132) >> uint(2)));
    float _136 = as_type<float>(_dmw1.w);
    float _138 = _78 * _59;
    float _140 = _100 * _59;
    float _142 = fma(_94, _57, _140);
    float _144 = fma(_72, _57, _138);
    float _146 = fma(_106, _61, _142);
    float _148 = fma(_84, _61, _144);
    float _150 = _112 + _146;
    float _152 = _90 + _148;
    float _154 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _156 = _150 + _154;
    float _158 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _160 = _152 + _158;
    float _162 = _156 * _156;
    float _164 = fma(_160, _160, _162);
    float _166 = sqrt(_164);
    bool _170 = _166 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _172 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _174 = _166 + _172;
    float _176 = 0.0;
    float _178 = _174;
    if (_170)
    {
        float _180 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        _176 = _180;
    }
    float _182 = _176;
    float _184 = _124 * _59;
    float _186 = fma(_118, _57, _184);
    float _188 = _118;
    float _190 = _136;
    if (_170)
    {
        float _192 = _174 * _182;
        _178 = _192;
    }
    float _194 = _178;
    float _196 = _194;
    if (_170)
    {
        float _198 = _194 * 0.15915493667125701904296875;
        _196 = _198;
    }
    float _200 = _196;
    float _202 = _182;
    if (_170)
    {
        float _204 = _200 * 6.283185482025146484375;
        float _206 = cos(_204);
        _202 = _206;
    }
    float _208 = _202;
    float _210 = fma(_130, _61, _186);
    float _212 = _59;
    float _214 = _210;
    if (_170)
    {
        float _216 = _200 * 6.283185482025146484375;
        float _218 = sin(_216);
        _212 = _218;
    }
    float _220 = _212;
    float _222 = _136 + _210;
    float _224 = _164;
    float _226 = _222;
    if (_170)
    {
        float _228 = rsqrt(_164);
        _224 = _228;
    }
    float _230 = _224;
    if (_170)
    {
        float _232 = _222 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        _188 = _232;
    }
    float _234 = _188;
    float _236 = _234;
    if (_170)
    {
        float _238 = _208 + (-1.0);
        _214 = _238;
    }
    float _240 = _214;
    float _242 = _220;
    float _244 = _240;
    if (_170)
    {
        float _246 = fma(_220, _234, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        _242 = _246;
    }
    float _248 = _242;
    if (_170)
    {
        float _250 = _240 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        _236 = _250;
    }
    float _252 = _236;
    float _254 = _252;
    if (!_170)
    {
        _244 = _152;
    }
    float _256 = _244;
    float _258 = _256;
    if (_170)
    {
        float _260 = fma(_222, _208, _252);
        _226 = _260;
    }
    float _262 = _226;
    if (_170)
    {
        float _264 = _230 * _248;
        _190 = _264;
    }
    float _266 = _190;
    float _268 = _262 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    if (!_170)
    {
        _254 = _150;
    }
    float _270 = _254;
    float _272 = _270;
    if (_170)
    {
        float _274 = fma(_160, _266, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        _258 = _274;
    }
    float _276 = _258;
    if (_170)
    {
        float _278 = fma(_156, _266, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        _272 = _278;
    }
    float _280 = _272;
    float _282 = _262 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _284 = fma(_276, (*spvDescriptorSet0.vp_c4)._m0[1].x, _268);
    float _286 = _262 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _288 = fma(_276, (*spvDescriptorSet0.vp_c4)._m0[0].x, _282);
    float _290 = fma(_280, (*spvDescriptorSet0.vp_c4)._m0[1].z, _284);
    float _292 = fma(_276, (*spvDescriptorSet0.vp_c4)._m0[2].x, _286);
    float _294 = fma(_280, (*spvDescriptorSet0.vp_c4)._m0[0].z, _288);
    float _296 = _290 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _298 = fma(_280, (*spvDescriptorSet0.vp_c4)._m0[2].z, _292);
    float _300 = _294 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _302 = _296 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _304 = _296 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _306 = _296 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _308 = _296 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _310 = _298 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _312 = fma(_300, (*spvDescriptorSet0.vp_c4)._m0[8].x, _302);
    float _314 = fma(_300, (*spvDescriptorSet0.vp_c4)._m0[7].x, _304);
    float _316 = fma(_300, (*spvDescriptorSet0.vp_c4)._m0[9].x, _306);
    float _318 = fma(_300, (*spvDescriptorSet0.vp_c4)._m0[10].x, _308);
    float _320 = fma(_310, (*spvDescriptorSet0.vp_c4)._m0[8].z, _312);
    float _322 = fma(_310, (*spvDescriptorSet0.vp_c4)._m0[7].z, _314);
    float _324 = fma(_310, (*spvDescriptorSet0.vp_c4)._m0[9].z, _316);
    float _326 = fma(_310, (*spvDescriptorSet0.vp_c4)._m0[10].z, _318);
    float _328 = _320 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _330 = _322 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _332 = _324 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _334 = _326 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.gl_Position.x = _330;
    out.gl_Position.y = _328;
    out.gl_Position.z = _332;
    out.gl_Position.w = _334;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_InstanceIndex [[instance_id]], uint gl_BaseInstance [[base_instance]])
{
    main0_out out = {};
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _50 = as_type<float>(int(gl_InstanceIndex));
    float _52 = as_type<float>(int(gl_BaseInstance));
    int _55 = as_type<int>(_50) - as_type<int>(_52);
    float _57 = in.m_36.x;
    float _59 = in.m_36.y;
    float _61 = in.m_36.z;
    int _63 = _55 + as_type<int>(as_type<float>(gl_BaseInstance));
    int _65 = _63 * 80;
    int _67 = _65 + 32;
    uint _70 = uint(int(uint(_65) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_70)];
    float _72 = as_type<float>(_dmw0.x);
    int _74 = _65 + 4;
    uint _76 = uint(int(uint(_74) >> uint(2)));
    float _78 = as_type<float>(_dmw0.y);
    int _80 = _65 + 8;
    uint _82 = uint(int(uint(_80) >> uint(2)));
    float _84 = as_type<float>(_dmw0.z);
    int _86 = _65 + 12;
    uint _88 = uint(int(uint(_86) >> uint(2)));
    float _90 = as_type<float>(_dmw0.w);
    uint _92 = uint(int(uint(_67) >> uint(2)));
    packed_uint4 _dmw2 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_92)];
    float _94 = as_type<float>(_dmw2.x);
    int _96 = _67 + 4;
    uint _98 = uint(int(uint(_96) >> uint(2)));
    float _100 = as_type<float>(_dmw2.y);
    int _102 = _67 + 8;
    uint _104 = uint(int(uint(_102) >> uint(2)));
    float _106 = as_type<float>(_dmw2.z);
    int _108 = _67 + 12;
    uint _110 = uint(int(uint(_108) >> uint(2)));
    float _112 = as_type<float>(_dmw2.w);
    int _114 = _65 + 16;
    uint _116 = uint(int(uint(_114) >> uint(2)));
    packed_uint4 _dmw1 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_116)];
    float _118 = as_type<float>(_dmw1.x);
    int _120 = _114 + 4;
    uint _122 = uint(int(uint(_120) >> uint(2)));
    float _124 = as_type<float>(_dmw1.y);
    int _126 = _114 + 8;
    uint _128 = uint(int(uint(_126) >> uint(2)));
    float _130 = as_type<float>(_dmw1.z);
    int _132 = _114 + 12;
    uint _134 = uint(int(uint(_132) >> uint(2)));
    float _136 = as_type<float>(_dmw1.w);
    float _138 = _78 * _59;
    float _140 = _100 * _59;
    float _142 = fma(_94, _57, _140);
    float _144 = fma(_72, _57, _138);
    float _146 = fma(_106, _61, _142);
    float _148 = fma(_84, _61, _144);
    float _150 = _112 + _146;
    float _152 = _90 + _148;
    float _154 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _156 = _150 + _154;
    float _158 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _160 = _152 + _158;
    float _162 = _156 * _156;
    float _164 = fma(_160, _160, _162);
    float _166 = sqrt(_164);
    bool _170 = _166 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _172 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _174 = _166 + _172;
    float _176 = 0.0;
    float _178 = _174;
    if (_170)
    {
        float _180 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        _176 = _180;
    }
    float _182 = _176;
    float _184 = _124 * _59;
    float _186 = fma(_118, _57, _184);
    float _188 = _118;
    float _190 = _136;
    if (_170)
    {
        float _192 = _174 * _182;
        _178 = _192;
    }
    float _194 = _178;
    float _196 = _194;
    if (_170)
    {
        float _198 = _194 * 0.15915493667125701904296875;
        _196 = _198;
    }
    float _200 = _196;
    float _202 = _182;
    if (_170)
    {
        float _204 = _200 * 6.283185482025146484375;
        float _206 = cos(_204);
        _202 = _206;
    }
    float _208 = _202;
    float _210 = fma(_130, _61, _186);
    float _212 = _59;
    float _214 = _210;
    if (_170)
    {
        float _216 = _200 * 6.283185482025146484375;
        float _218 = sin(_216);
        _212 = _218;
    }
    float _220 = _212;
    float _222 = _136 + _210;
    float _224 = _164;
    float _226 = _222;
    if (_170)
    {
        float _228 = rsqrt(_164);
        _224 = _228;
    }
    float _230 = _224;
    if (_170)
    {
        float _232 = _222 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        _188 = _232;
    }
    float _234 = _188;
    float _236 = _234;
    if (_170)
    {
        float _238 = _208 + (-1.0);
        _214 = _238;
    }
    float _240 = _214;
    float _242 = _220;
    float _244 = _240;
    if (_170)
    {
        float _246 = fma(_220, _234, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        _242 = _246;
    }
    float _248 = _242;
    if (_170)
    {
        float _250 = _240 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        _236 = _250;
    }
    float _252 = _236;
    float _254 = _252;
    if (!_170)
    {
        _244 = _152;
    }
    float _256 = _244;
    float _258 = _256;
    if (_170)
    {
        float _260 = fma(_222, _208, _252);
        _226 = _260;
    }
    float _262 = _226;
    if (_170)
    {
        float _264 = _230 * _248;
        _190 = _264;
    }
    float _266 = _190;
    float _268 = _262 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    if (!_170)
    {
        _254 = _150;
    }
    float _270 = _254;
    float _272 = _270;
    if (_170)
    {
        float _274 = fma(_160, _266, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        _258 = _274;
    }
    float _276 = _258;
    if (_170)
    {
        float _278 = fma(_156, _266, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        _272 = _278;
    }
    float _280 = _272;
    float _282 = _262 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _284 = fma(_276, (*spvDescriptorSet0.vp_c4)._m0[1].x, _268);
    float _286 = _262 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _288 = fma(_276, (*spvDescriptorSet0.vp_c4)._m0[0].x, _282);
    float _290 = fma(_280, (*spvDescriptorSet0.vp_c4)._m0[1].z, _284);
    float _292 = fma(_276, (*spvDescriptorSet0.vp_c4)._m0[2].x, _286);
    float _294 = fma(_280, (*spvDescriptorSet0.vp_c4)._m0[0].z, _288);
    float _296 = _290 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _298 = fma(_280, (*spvDescriptorSet0.vp_c4)._m0[2].z, _292);
    float _300 = _294 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _302 = _296 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _304 = _296 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _306 = _296 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _308 = _296 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _310 = _298 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _312 = fma(_300, (*spvDescriptorSet0.vp_c4)._m0[8].x, _302);
    float _314 = fma(_300, (*spvDescriptorSet0.vp_c4)._m0[7].x, _304);
    float _316 = fma(_300, (*spvDescriptorSet0.vp_c4)._m0[9].x, _306);
    float _318 = fma(_300, (*spvDescriptorSet0.vp_c4)._m0[10].x, _308);
    float _320 = fma(_310, (*spvDescriptorSet0.vp_c4)._m0[8].z, _312);
    float _322 = fma(_310, (*spvDescriptorSet0.vp_c4)._m0[7].z, _314);
    float _324 = fma(_310, (*spvDescriptorSet0.vp_c4)._m0[9].z, _316);
    float _326 = fma(_310, (*spvDescriptorSet0.vp_c4)._m0[10].z, _318);
    float _328 = _320 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _330 = _322 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _332 = _324 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _334 = _326 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.gl_Position.x = _330;
    out.gl_Position.y = _328;
    out.gl_Position.z = _332;
    out.gl_Position.w = _334;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_InstanceIndex [[instance_id]], uint gl_BaseInstance [[base_instance]], uint dm_vid [[vertex_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint dm_iid = gl_InstanceIndex;
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _50 = as_type<float>(int(gl_InstanceIndex));
    float _52 = as_type<float>(int(gl_BaseInstance));
    int _55 = as_type<int>(_50) - as_type<int>(_52);
    float _57 = in.m_36.x;
    float _59 = in.m_36.y;
    float _61 = in.m_36.z;
    int _63 = _55 + as_type<int>(as_type<float>(gl_BaseInstance));
    int _65 = _63 * 80;
    int _67 = _65 + 32;
    uint _70 = uint(int(uint(_65) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_70)];
    float _72 = as_type<float>(_dmw0.x);
    int _74 = _65 + 4;
    uint _76 = uint(int(uint(_74) >> uint(2)));
    float _78 = as_type<float>(_dmw0.y);
    int _80 = _65 + 8;
    uint _82 = uint(int(uint(_80) >> uint(2)));
    float _84 = as_type<float>(_dmw0.z);
    int _86 = _65 + 12;
    uint _88 = uint(int(uint(_86) >> uint(2)));
    float _90 = as_type<float>(_dmw0.w);
    uint _92 = uint(int(uint(_67) >> uint(2)));
    packed_uint4 _dmw2 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_92)];
    float _94 = as_type<float>(_dmw2.x);
    int _96 = _67 + 4;
    uint _98 = uint(int(uint(_96) >> uint(2)));
    float _100 = as_type<float>(_dmw2.y);
    int _102 = _67 + 8;
    uint _104 = uint(int(uint(_102) >> uint(2)));
    float _106 = as_type<float>(_dmw2.z);
    int _108 = _67 + 12;
    uint _110 = uint(int(uint(_108) >> uint(2)));
    float _112 = as_type<float>(_dmw2.w);
    int _114 = _65 + 16;
    uint _116 = uint(int(uint(_114) >> uint(2)));
    packed_uint4 _dmw1 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_116)];
    float _118 = as_type<float>(_dmw1.x);
    int _120 = _114 + 4;
    uint _122 = uint(int(uint(_120) >> uint(2)));
    float _124 = as_type<float>(_dmw1.y);
    int _126 = _114 + 8;
    uint _128 = uint(int(uint(_126) >> uint(2)));
    float _130 = as_type<float>(_dmw1.z);
    int _132 = _114 + 12;
    uint _134 = uint(int(uint(_132) >> uint(2)));
    float _136 = as_type<float>(_dmw1.w);
    float _138 = _78 * _59;
    float _140 = _100 * _59;
    float _142 = fma(_94, _57, _140);
    float _144 = fma(_72, _57, _138);
    float _146 = fma(_106, _61, _142);
    float _148 = fma(_84, _61, _144);
    float _150 = _112 + _146;
    float _152 = _90 + _148;
    float _154 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _156 = _150 + _154;
    float _158 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _160 = _152 + _158;
    float _162 = _156 * _156;
    float _164 = fma(_160, _160, _162);
    float _166 = sqrt(_164);
    bool _170 = _166 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _172 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _174 = _166 + _172;
    float _176 = 0.0;
    float _178 = _174;
    if (_170)
    {
        float _180 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        _176 = _180;
    }
    float _182 = _176;
    float _184 = _124 * _59;
    float _186 = fma(_118, _57, _184);
    float _188 = _118;
    float _190 = _136;
    if (_170)
    {
        float _192 = _174 * _182;
        _178 = _192;
    }
    float _194 = _178;
    float _196 = _194;
    if (_170)
    {
        float _198 = _194 * 0.15915493667125701904296875;
        _196 = _198;
    }
    float _200 = _196;
    float _202 = _182;
    if (_170)
    {
        float _204 = _200 * 6.283185482025146484375;
        float _206 = cos(_204);
        _202 = _206;
    }
    float _208 = _202;
    float _210 = fma(_130, _61, _186);
    float _212 = _59;
    float _214 = _210;
    if (_170)
    {
        float _216 = _200 * 6.283185482025146484375;
        float _218 = sin(_216);
        _212 = _218;
    }
    float _220 = _212;
    float _222 = _136 + _210;
    float _224 = _164;
    float _226 = _222;
    if (_170)
    {
        float _228 = rsqrt(_164);
        _224 = _228;
    }
    float _230 = _224;
    if (_170)
    {
        float _232 = _222 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        _188 = _232;
    }
    float _234 = _188;
    float _236 = _234;
    if (_170)
    {
        float _238 = _208 + (-1.0);
        _214 = _238;
    }
    float _240 = _214;
    float _242 = _220;
    float _244 = _240;
    if (_170)
    {
        float _246 = fma(_220, _234, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        _242 = _246;
    }
    float _248 = _242;
    if (_170)
    {
        float _250 = _240 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        _236 = _250;
    }
    float _252 = _236;
    float _254 = _252;
    if (!_170)
    {
        _244 = _152;
    }
    float _256 = _244;
    float _258 = _256;
    if (_170)
    {
        float _260 = fma(_222, _208, _252);
        _226 = _260;
    }
    float _262 = _226;
    if (_170)
    {
        float _264 = _230 * _248;
        _190 = _264;
    }
    float _266 = _190;
    float _268 = _262 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    if (!_170)
    {
        _254 = _150;
    }
    float _270 = _254;
    float _272 = _270;
    if (_170)
    {
        float _274 = fma(_160, _266, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        _258 = _274;
    }
    float _276 = _258;
    if (_170)
    {
        float _278 = fma(_156, _266, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        _272 = _278;
    }
    float _280 = _272;
    float _282 = _262 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _284 = fma(_276, (*spvDescriptorSet0.vp_c4)._m0[1].x, _268);
    float _286 = _262 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _288 = fma(_276, (*spvDescriptorSet0.vp_c4)._m0[0].x, _282);
    float _290 = fma(_280, (*spvDescriptorSet0.vp_c4)._m0[1].z, _284);
    float _292 = fma(_276, (*spvDescriptorSet0.vp_c4)._m0[2].x, _286);
    float _294 = fma(_280, (*spvDescriptorSet0.vp_c4)._m0[0].z, _288);
    float _296 = _290 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _298 = fma(_280, (*spvDescriptorSet0.vp_c4)._m0[2].z, _292);
    float _300 = _294 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _302 = _296 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _304 = _296 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _306 = _296 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _308 = _296 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _310 = _298 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _312 = fma(_300, (*spvDescriptorSet0.vp_c4)._m0[8].x, _302);
    float _314 = fma(_300, (*spvDescriptorSet0.vp_c4)._m0[7].x, _304);
    float _316 = fma(_300, (*spvDescriptorSet0.vp_c4)._m0[9].x, _306);
    float _318 = fma(_300, (*spvDescriptorSet0.vp_c4)._m0[10].x, _308);
    float _320 = fma(_310, (*spvDescriptorSet0.vp_c4)._m0[8].z, _312);
    float _322 = fma(_310, (*spvDescriptorSet0.vp_c4)._m0[7].z, _314);
    float _324 = fma(_310, (*spvDescriptorSet0.vp_c4)._m0[9].z, _316);
    float _326 = fma(_310, (*spvDescriptorSet0.vp_c4)._m0[10].z, _318);
    float _328 = _320 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _330 = _322 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _332 = _324 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _334 = _326 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.gl_Position.x = _330;
    out.gl_Position.y = _328;
    out.gl_Position.z = _332;
    out.gl_Position.w = _334;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, 0u); dm_cw(dm_gs, dm_p, 17, 0u); dm_cw(dm_gs, dm_p, 18, 0u); dm_cw(dm_gs, dm_p, 19, 0x3f800000u); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

