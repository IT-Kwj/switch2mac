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

struct _21
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    constant _16* vp_c3 [[id(0)]];
    const device _21* vp_s0 [[id(1)]];
};

struct main0_out
{
    float4 m_32 [[user(locn0)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

vertex main0_out main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_InstanceIndex [[instance_id]], uint gl_BaseInstance [[base_instance]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_32 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _48 = as_type<float>(int(gl_InstanceIndex));
    float _50 = as_type<float>(int(gl_BaseInstance));
    int _53 = as_type<int>(_48) - as_type<int>(_50);
    int _55 = _53 << 4;
    uint _58 = uint(int(uint(_55) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_58)];
    float _60 = as_type<float>(_dmw0.x);
    int _62 = _55 + 4;
    uint _64 = uint(int(uint(_62) >> uint(2)));
    float _66 = as_type<float>(_dmw0.y);
    int _68 = _55 + 8;
    uint _70 = uint(int(uint(_68) >> uint(2)));
    float _72 = as_type<float>(_dmw0.z);
    int _74 = _55 + 12;
    uint _76 = uint(int(uint(_74) >> uint(2)));
    float _78 = as_type<float>(_dmw0.w);
    float _80 = float(as_type<int>(_66));
    float _82 = float(as_type<int>(_60));
    bool _86 = _80 > (*spvDescriptorSet0.vp_c3)._m0[2].y;
    bool _88 = _80 > (*spvDescriptorSet0.vp_c3)._m0[3].y;
    bool _90 = _80 > (*spvDescriptorSet0.vp_c3)._m0[4].y;
    bool _92 = _80 > (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _94 = float(as_type<int>(_72));
    bool _96 = _82 > (*spvDescriptorSet0.vp_c3)._m0[2].x;
    bool _98 = _96 || _86;
    bool _100 = _82 > (*spvDescriptorSet0.vp_c3)._m0[3].x;
    bool _102 = _100 || _88;
    bool _104 = _82 > (*spvDescriptorSet0.vp_c3)._m0[4].x;
    bool _106 = _104 || _90;
    bool _108 = _82 > (*spvDescriptorSet0.vp_c3)._m0[5].x;
    bool _110 = _108 || _92;
    float _112 = float(as_type<int>(_78));
    bool _114 = _94 > (*spvDescriptorSet0.vp_c3)._m0[2].z;
    bool _116 = _114 || _98;
    bool _118 = _94 > (*spvDescriptorSet0.vp_c3)._m0[3].z;
    bool _120 = _118 || _102;
    bool _122 = _94 > (*spvDescriptorSet0.vp_c3)._m0[4].z;
    bool _124 = _122 || _106;
    bool _126 = _94 > (*spvDescriptorSet0.vp_c3)._m0[5].z;
    bool _128 = _126 || _110;
    bool _130 = _112 > (*spvDescriptorSet0.vp_c3)._m0[2].w;
    bool _132 = _130 || _116;
    bool _134 = _112 > (*spvDescriptorSet0.vp_c3)._m0[3].w;
    bool _136 = _134 || _120;
    bool _138 = _112 > (*spvDescriptorSet0.vp_c3)._m0[4].w;
    bool _140 = _138 || _124;
    bool _142 = _112 > (*spvDescriptorSet0.vp_c3)._m0[5].w;
    bool _144 = _142 || _128;
    bool _146 = !_132;
    int _148 = _146 ? 0 : 1065353216;
    bool _150 = !_136;
    int _152 = _150 ? 0 : 1065353216;
    bool _154 = !_140;
    int _156 = _154 ? 0 : 1065353216;
    int _158 = as_type<int>(_60);
    int _160 = as_type<int>(_66);
    if (!_132)
    {
        _158 = -971227136;
    }
    int _162 = _158;
    bool _164 = !_144;
    int _166 = _164 ? 0 : 1065353216;
    int _168 = _162;
    if (!_132)
    {
        _160 = -971227136;
    }
    int _170 = _160;
    out.m_32.x = as_type<float>(_148);
    out.m_32.y = as_type<float>(_152);
    out.m_32.z = as_type<float>(_156);
    out.m_32.w = as_type<float>(_166);
    bool _172 = !_132;
    int _174 = _170;
    if (!_172)
    {
        int _176 = abs(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[6].z));
        int _178 = abs(_53);
        float _180 = float(uint(_176));
        float _182 = float(uint(_178));
        float _184 = 1.0 / _180;
        int _186 = as_type<int>(_184) + (-2);
        float _188 = as_type<float>(int(gl_VertexIndex));
        float _190 = as_type<float>(_186) * _182;
        float _192 = trunc(_190);
        float _194 = precise::max(_192, 0.0);
        uint _196 = uint(_194);
        int _198 = -int(_196);
        int _200 = _198 * _176;
        int _202 = _200 + _178;
        float _204 = float(uint(_202));
        float _206 = as_type<float>(_186) * _204;
        float _208 = trunc(_206);
        float _210 = precise::max(_208, 0.0);
        uint _212 = uint(_210);
        float _214 = float(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[6].w));
        int _216 = int(_196) + int(_212);
        int _218 = _53 ^ as_type<int>((*spvDescriptorSet0.vp_c3)._m0[6].z);
        int _220 = -_216;
        uint _222 = uint(int(uint(_218) >> uint(31)));
        int _224 = _220 * _176;
        int _226 = _224 + _178;
        float _228 = 1.0 / _214;
        bool _230 = uint(_226) >= uint(_176);
        int _232 = -int(_222);
        int _234 = as_type<int>(_188) >> 31;
        bool _236 = !_230;
        int _238 = _236 ? 0 : (-1);
        bool _240 = 0 == as_type<int>((*spvDescriptorSet0.vp_c3)._m0[6].z);
        int _242 = _234 & 1;
        int _244 = -_238;
        int _246 = _216 + _244;
        float _248 = float(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[6].z));
        int _250 = as_type<int>(_188) + _242;
        int _252 = _246 ^ _232;
        float _254 = 1.0 / _248;
        int _256 = as_type<int>(_188) & 1;
        int _258 = -_232;
        int _260 = _252 + _258;
        int _262 = _250 >> 1;
        float _264 = float(_256);
        bool _266 = !_240;
        int _268 = _266 ? _260 : (-1);
        float _270 = float(_262);
        float _272 = float(_268);
        int _274 = -_268;
        int _276 = _274 * as_type<int>((*spvDescriptorSet0.vp_c3)._m0[6].z);
        int _278 = _276 + _53;
        float _280 = _270 + _272;
        float _282 = _228 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
        float _284 = float(_278);
        float _286 = _282 * _280;
        float _288 = _264 + _284;
        float _290 = _254 * (*spvDescriptorSet0.vp_c3)._m0[7].x;
        float _292 = fma(_286, -2.0, 1.0);
        float _294 = _290 * _288;
        float _296 = fma(_294, 2.0, -1.0);
        _168 = as_type<int>(_296);
        _174 = as_type<int>(_292);
    }
    int _298 = _168;
    int _300 = _174;
    float _723 = as_type<float>(_298);
    out.gl_Position.x = _723;
    float _726 = as_type<float>(_300);
    out.gl_Position.y = _726;
    out.gl_Position.z = -1.0;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_InstanceIndex [[instance_id]], uint gl_BaseInstance [[base_instance]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_32 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _48 = as_type<float>(int(gl_InstanceIndex));
    float _50 = as_type<float>(int(gl_BaseInstance));
    int _53 = as_type<int>(_48) - as_type<int>(_50);
    int _55 = _53 << 4;
    uint _58 = uint(int(uint(_55) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_58)];
    float _60 = as_type<float>(_dmw0.x);
    int _62 = _55 + 4;
    uint _64 = uint(int(uint(_62) >> uint(2)));
    float _66 = as_type<float>(_dmw0.y);
    int _68 = _55 + 8;
    uint _70 = uint(int(uint(_68) >> uint(2)));
    float _72 = as_type<float>(_dmw0.z);
    int _74 = _55 + 12;
    uint _76 = uint(int(uint(_74) >> uint(2)));
    float _78 = as_type<float>(_dmw0.w);
    float _80 = float(as_type<int>(_66));
    float _82 = float(as_type<int>(_60));
    bool _86 = _80 > (*spvDescriptorSet0.vp_c3)._m0[2].y;
    bool _88 = _80 > (*spvDescriptorSet0.vp_c3)._m0[3].y;
    bool _90 = _80 > (*spvDescriptorSet0.vp_c3)._m0[4].y;
    bool _92 = _80 > (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _94 = float(as_type<int>(_72));
    bool _96 = _82 > (*spvDescriptorSet0.vp_c3)._m0[2].x;
    bool _98 = _96 || _86;
    bool _100 = _82 > (*spvDescriptorSet0.vp_c3)._m0[3].x;
    bool _102 = _100 || _88;
    bool _104 = _82 > (*spvDescriptorSet0.vp_c3)._m0[4].x;
    bool _106 = _104 || _90;
    bool _108 = _82 > (*spvDescriptorSet0.vp_c3)._m0[5].x;
    bool _110 = _108 || _92;
    float _112 = float(as_type<int>(_78));
    bool _114 = _94 > (*spvDescriptorSet0.vp_c3)._m0[2].z;
    bool _116 = _114 || _98;
    bool _118 = _94 > (*spvDescriptorSet0.vp_c3)._m0[3].z;
    bool _120 = _118 || _102;
    bool _122 = _94 > (*spvDescriptorSet0.vp_c3)._m0[4].z;
    bool _124 = _122 || _106;
    bool _126 = _94 > (*spvDescriptorSet0.vp_c3)._m0[5].z;
    bool _128 = _126 || _110;
    bool _130 = _112 > (*spvDescriptorSet0.vp_c3)._m0[2].w;
    bool _132 = _130 || _116;
    bool _134 = _112 > (*spvDescriptorSet0.vp_c3)._m0[3].w;
    bool _136 = _134 || _120;
    bool _138 = _112 > (*spvDescriptorSet0.vp_c3)._m0[4].w;
    bool _140 = _138 || _124;
    bool _142 = _112 > (*spvDescriptorSet0.vp_c3)._m0[5].w;
    bool _144 = _142 || _128;
    bool _146 = !_132;
    int _148 = _146 ? 0 : 1065353216;
    bool _150 = !_136;
    int _152 = _150 ? 0 : 1065353216;
    bool _154 = !_140;
    int _156 = _154 ? 0 : 1065353216;
    int _158 = as_type<int>(_60);
    int _160 = as_type<int>(_66);
    if (!_132)
    {
        _158 = -971227136;
    }
    int _162 = _158;
    bool _164 = !_144;
    int _166 = _164 ? 0 : 1065353216;
    int _168 = _162;
    if (!_132)
    {
        _160 = -971227136;
    }
    int _170 = _160;
    out.m_32.x = as_type<float>(_148);
    out.m_32.y = as_type<float>(_152);
    out.m_32.z = as_type<float>(_156);
    out.m_32.w = as_type<float>(_166);
    bool _172 = !_132;
    int _174 = _170;
    if (!_172)
    {
        int _176 = abs(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[6].z));
        int _178 = abs(_53);
        float _180 = float(uint(_176));
        float _182 = float(uint(_178));
        float _184 = 1.0 / _180;
        int _186 = as_type<int>(_184) + (-2);
        float _188 = as_type<float>(int(gl_VertexIndex));
        float _190 = as_type<float>(_186) * _182;
        float _192 = trunc(_190);
        float _194 = precise::max(_192, 0.0);
        uint _196 = uint(_194);
        int _198 = -int(_196);
        int _200 = _198 * _176;
        int _202 = _200 + _178;
        float _204 = float(uint(_202));
        float _206 = as_type<float>(_186) * _204;
        float _208 = trunc(_206);
        float _210 = precise::max(_208, 0.0);
        uint _212 = uint(_210);
        float _214 = float(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[6].w));
        int _216 = int(_196) + int(_212);
        int _218 = _53 ^ as_type<int>((*spvDescriptorSet0.vp_c3)._m0[6].z);
        int _220 = -_216;
        uint _222 = uint(int(uint(_218) >> uint(31)));
        int _224 = _220 * _176;
        int _226 = _224 + _178;
        float _228 = 1.0 / _214;
        bool _230 = uint(_226) >= uint(_176);
        int _232 = -int(_222);
        int _234 = as_type<int>(_188) >> 31;
        bool _236 = !_230;
        int _238 = _236 ? 0 : (-1);
        bool _240 = 0 == as_type<int>((*spvDescriptorSet0.vp_c3)._m0[6].z);
        int _242 = _234 & 1;
        int _244 = -_238;
        int _246 = _216 + _244;
        float _248 = float(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[6].z));
        int _250 = as_type<int>(_188) + _242;
        int _252 = _246 ^ _232;
        float _254 = 1.0 / _248;
        int _256 = as_type<int>(_188) & 1;
        int _258 = -_232;
        int _260 = _252 + _258;
        int _262 = _250 >> 1;
        float _264 = float(_256);
        bool _266 = !_240;
        int _268 = _266 ? _260 : (-1);
        float _270 = float(_262);
        float _272 = float(_268);
        int _274 = -_268;
        int _276 = _274 * as_type<int>((*spvDescriptorSet0.vp_c3)._m0[6].z);
        int _278 = _276 + _53;
        float _280 = _270 + _272;
        float _282 = _228 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
        float _284 = float(_278);
        float _286 = _282 * _280;
        float _288 = _264 + _284;
        float _290 = _254 * (*spvDescriptorSet0.vp_c3)._m0[7].x;
        float _292 = fma(_286, -2.0, 1.0);
        float _294 = _290 * _288;
        float _296 = fma(_294, 2.0, -1.0);
        _168 = as_type<int>(_296);
        _174 = as_type<int>(_292);
    }
    int _298 = _168;
    int _300 = _174;
    float _723 = as_type<float>(_298);
    out.gl_Position.x = _723;
    float _726 = as_type<float>(_300);
    out.gl_Position.y = _726;
    out.gl_Position.z = -1.0;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_InstanceIndex [[instance_id]], uint gl_BaseInstance [[base_instance]], uint gl_VertexIndex [[vertex_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint dm_vid = gl_VertexIndex;
    uint dm_iid = gl_InstanceIndex;
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_32 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _48 = as_type<float>(int(gl_InstanceIndex));
    float _50 = as_type<float>(int(gl_BaseInstance));
    int _53 = as_type<int>(_48) - as_type<int>(_50);
    int _55 = _53 << 4;
    uint _58 = uint(int(uint(_55) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_58)];
    float _60 = as_type<float>(_dmw0.x);
    int _62 = _55 + 4;
    uint _64 = uint(int(uint(_62) >> uint(2)));
    float _66 = as_type<float>(_dmw0.y);
    int _68 = _55 + 8;
    uint _70 = uint(int(uint(_68) >> uint(2)));
    float _72 = as_type<float>(_dmw0.z);
    int _74 = _55 + 12;
    uint _76 = uint(int(uint(_74) >> uint(2)));
    float _78 = as_type<float>(_dmw0.w);
    float _80 = float(as_type<int>(_66));
    float _82 = float(as_type<int>(_60));
    bool _86 = _80 > (*spvDescriptorSet0.vp_c3)._m0[2].y;
    bool _88 = _80 > (*spvDescriptorSet0.vp_c3)._m0[3].y;
    bool _90 = _80 > (*spvDescriptorSet0.vp_c3)._m0[4].y;
    bool _92 = _80 > (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _94 = float(as_type<int>(_72));
    bool _96 = _82 > (*spvDescriptorSet0.vp_c3)._m0[2].x;
    bool _98 = _96 || _86;
    bool _100 = _82 > (*spvDescriptorSet0.vp_c3)._m0[3].x;
    bool _102 = _100 || _88;
    bool _104 = _82 > (*spvDescriptorSet0.vp_c3)._m0[4].x;
    bool _106 = _104 || _90;
    bool _108 = _82 > (*spvDescriptorSet0.vp_c3)._m0[5].x;
    bool _110 = _108 || _92;
    float _112 = float(as_type<int>(_78));
    bool _114 = _94 > (*spvDescriptorSet0.vp_c3)._m0[2].z;
    bool _116 = _114 || _98;
    bool _118 = _94 > (*spvDescriptorSet0.vp_c3)._m0[3].z;
    bool _120 = _118 || _102;
    bool _122 = _94 > (*spvDescriptorSet0.vp_c3)._m0[4].z;
    bool _124 = _122 || _106;
    bool _126 = _94 > (*spvDescriptorSet0.vp_c3)._m0[5].z;
    bool _128 = _126 || _110;
    bool _130 = _112 > (*spvDescriptorSet0.vp_c3)._m0[2].w;
    bool _132 = _130 || _116;
    bool _134 = _112 > (*spvDescriptorSet0.vp_c3)._m0[3].w;
    bool _136 = _134 || _120;
    bool _138 = _112 > (*spvDescriptorSet0.vp_c3)._m0[4].w;
    bool _140 = _138 || _124;
    bool _142 = _112 > (*spvDescriptorSet0.vp_c3)._m0[5].w;
    bool _144 = _142 || _128;
    bool _146 = !_132;
    int _148 = _146 ? 0 : 1065353216;
    bool _150 = !_136;
    int _152 = _150 ? 0 : 1065353216;
    bool _154 = !_140;
    int _156 = _154 ? 0 : 1065353216;
    int _158 = as_type<int>(_60);
    int _160 = as_type<int>(_66);
    if (!_132)
    {
        _158 = -971227136;
    }
    int _162 = _158;
    bool _164 = !_144;
    int _166 = _164 ? 0 : 1065353216;
    int _168 = _162;
    if (!_132)
    {
        _160 = -971227136;
    }
    int _170 = _160;
    out.m_32.x = as_type<float>(_148);
    out.m_32.y = as_type<float>(_152);
    out.m_32.z = as_type<float>(_156);
    out.m_32.w = as_type<float>(_166);
    bool _172 = !_132;
    int _174 = _170;
    if (!_172)
    {
        int _176 = abs(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[6].z));
        int _178 = abs(_53);
        float _180 = float(uint(_176));
        float _182 = float(uint(_178));
        float _184 = 1.0 / _180;
        int _186 = as_type<int>(_184) + (-2);
        float _188 = as_type<float>(int(gl_VertexIndex));
        float _190 = as_type<float>(_186) * _182;
        float _192 = trunc(_190);
        float _194 = precise::max(_192, 0.0);
        uint _196 = uint(_194);
        int _198 = -int(_196);
        int _200 = _198 * _176;
        int _202 = _200 + _178;
        float _204 = float(uint(_202));
        float _206 = as_type<float>(_186) * _204;
        float _208 = trunc(_206);
        float _210 = precise::max(_208, 0.0);
        uint _212 = uint(_210);
        float _214 = float(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[6].w));
        int _216 = int(_196) + int(_212);
        int _218 = _53 ^ as_type<int>((*spvDescriptorSet0.vp_c3)._m0[6].z);
        int _220 = -_216;
        uint _222 = uint(int(uint(_218) >> uint(31)));
        int _224 = _220 * _176;
        int _226 = _224 + _178;
        float _228 = 1.0 / _214;
        bool _230 = uint(_226) >= uint(_176);
        int _232 = -int(_222);
        int _234 = as_type<int>(_188) >> 31;
        bool _236 = !_230;
        int _238 = _236 ? 0 : (-1);
        bool _240 = 0 == as_type<int>((*spvDescriptorSet0.vp_c3)._m0[6].z);
        int _242 = _234 & 1;
        int _244 = -_238;
        int _246 = _216 + _244;
        float _248 = float(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[6].z));
        int _250 = as_type<int>(_188) + _242;
        int _252 = _246 ^ _232;
        float _254 = 1.0 / _248;
        int _256 = as_type<int>(_188) & 1;
        int _258 = -_232;
        int _260 = _252 + _258;
        int _262 = _250 >> 1;
        float _264 = float(_256);
        bool _266 = !_240;
        int _268 = _266 ? _260 : (-1);
        float _270 = float(_262);
        float _272 = float(_268);
        int _274 = -_268;
        int _276 = _274 * as_type<int>((*spvDescriptorSet0.vp_c3)._m0[6].z);
        int _278 = _276 + _53;
        float _280 = _270 + _272;
        float _282 = _228 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
        float _284 = float(_278);
        float _286 = _282 * _280;
        float _288 = _264 + _284;
        float _290 = _254 * (*spvDescriptorSet0.vp_c3)._m0[7].x;
        float _292 = fma(_286, -2.0, 1.0);
        float _294 = _290 * _288;
        float _296 = fma(_294, 2.0, -1.0);
        _168 = as_type<int>(_296);
        _174 = as_type<int>(_292);
    }
    int _298 = _168;
    int _300 = _174;
    float _723 = as_type<float>(_298);
    out.gl_Position.x = _723;
    float _726 = as_type<float>(_300);
    out.gl_Position.y = _726;
    out.gl_Position.z = -1.0;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_32.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_32.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_32.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_32.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}


struct main0l_out
{
    float4 m_32 [[user(locn0)]];
    float4 gl_Position [[position, invariant]];
    uint gl_Layer [[render_target_array_index]];
};

vertex main0l_out main0_l(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_InstanceIndex [[instance_id]], uint gl_BaseInstance [[base_instance]], uint gl_VertexIndex [[vertex_id]])
{
    main0l_out out = {};
    out.m_32 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _48 = as_type<float>(int(gl_InstanceIndex));
    float _50 = as_type<float>(int(gl_BaseInstance));
    int _53 = as_type<int>(_48) - as_type<int>(_50);
    int _55 = _53 << 4;
    uint _58 = uint(int(uint(_55) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_58)];
    float _60 = as_type<float>(_dmw0.x);
    int _62 = _55 + 4;
    uint _64 = uint(int(uint(_62) >> uint(2)));
    float _66 = as_type<float>(_dmw0.y);
    int _68 = _55 + 8;
    uint _70 = uint(int(uint(_68) >> uint(2)));
    float _72 = as_type<float>(_dmw0.z);
    int _74 = _55 + 12;
    uint _76 = uint(int(uint(_74) >> uint(2)));
    float _78 = as_type<float>(_dmw0.w);
    float _80 = float(as_type<int>(_66));
    float _82 = float(as_type<int>(_60));
    bool _86 = _80 > (*spvDescriptorSet0.vp_c3)._m0[2].y;
    bool _88 = _80 > (*spvDescriptorSet0.vp_c3)._m0[3].y;
    bool _90 = _80 > (*spvDescriptorSet0.vp_c3)._m0[4].y;
    bool _92 = _80 > (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _94 = float(as_type<int>(_72));
    bool _96 = _82 > (*spvDescriptorSet0.vp_c3)._m0[2].x;
    bool _98 = _96 || _86;
    bool _100 = _82 > (*spvDescriptorSet0.vp_c3)._m0[3].x;
    bool _102 = _100 || _88;
    bool _104 = _82 > (*spvDescriptorSet0.vp_c3)._m0[4].x;
    bool _106 = _104 || _90;
    bool _108 = _82 > (*spvDescriptorSet0.vp_c3)._m0[5].x;
    bool _110 = _108 || _92;
    float _112 = float(as_type<int>(_78));
    bool _114 = _94 > (*spvDescriptorSet0.vp_c3)._m0[2].z;
    bool _116 = _114 || _98;
    bool _118 = _94 > (*spvDescriptorSet0.vp_c3)._m0[3].z;
    bool _120 = _118 || _102;
    bool _122 = _94 > (*spvDescriptorSet0.vp_c3)._m0[4].z;
    bool _124 = _122 || _106;
    bool _126 = _94 > (*spvDescriptorSet0.vp_c3)._m0[5].z;
    bool _128 = _126 || _110;
    bool _130 = _112 > (*spvDescriptorSet0.vp_c3)._m0[2].w;
    bool _132 = _130 || _116;
    bool _134 = _112 > (*spvDescriptorSet0.vp_c3)._m0[3].w;
    bool _136 = _134 || _120;
    bool _138 = _112 > (*spvDescriptorSet0.vp_c3)._m0[4].w;
    bool _140 = _138 || _124;
    bool _142 = _112 > (*spvDescriptorSet0.vp_c3)._m0[5].w;
    bool _144 = _142 || _128;
    bool _146 = !_132;
    int _148 = _146 ? 0 : 1065353216;
    bool _150 = !_136;
    int _152 = _150 ? 0 : 1065353216;
    bool _154 = !_140;
    int _156 = _154 ? 0 : 1065353216;
    int _158 = as_type<int>(_60);
    int _160 = as_type<int>(_66);
    if (!_132)
    {
        _158 = -971227136;
    }
    int _162 = _158;
    bool _164 = !_144;
    int _166 = _164 ? 0 : 1065353216;
    int _168 = _162;
    if (!_132)
    {
        _160 = -971227136;
    }
    int _170 = _160;
    out.m_32.x = as_type<float>(_148);
    out.m_32.y = as_type<float>(_152);
    out.m_32.z = as_type<float>(_156);
    out.m_32.w = as_type<float>(_166);
    bool _172 = !_132;
    int _174 = _170;
    if (!_172)
    {
        int _176 = abs(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[6].z));
        int _178 = abs(_53);
        float _180 = float(uint(_176));
        float _182 = float(uint(_178));
        float _184 = 1.0 / _180;
        int _186 = as_type<int>(_184) + (-2);
        float _188 = as_type<float>(int(gl_VertexIndex));
        float _190 = as_type<float>(_186) * _182;
        float _192 = trunc(_190);
        float _194 = precise::max(_192, 0.0);
        uint _196 = uint(_194);
        int _198 = -int(_196);
        int _200 = _198 * _176;
        int _202 = _200 + _178;
        float _204 = float(uint(_202));
        float _206 = as_type<float>(_186) * _204;
        float _208 = trunc(_206);
        float _210 = precise::max(_208, 0.0);
        uint _212 = uint(_210);
        float _214 = float(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[6].w));
        int _216 = int(_196) + int(_212);
        int _218 = _53 ^ as_type<int>((*spvDescriptorSet0.vp_c3)._m0[6].z);
        int _220 = -_216;
        uint _222 = uint(int(uint(_218) >> uint(31)));
        int _224 = _220 * _176;
        int _226 = _224 + _178;
        float _228 = 1.0 / _214;
        bool _230 = uint(_226) >= uint(_176);
        int _232 = -int(_222);
        int _234 = as_type<int>(_188) >> 31;
        bool _236 = !_230;
        int _238 = _236 ? 0 : (-1);
        bool _240 = 0 == as_type<int>((*spvDescriptorSet0.vp_c3)._m0[6].z);
        int _242 = _234 & 1;
        int _244 = -_238;
        int _246 = _216 + _244;
        float _248 = float(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[6].z));
        int _250 = as_type<int>(_188) + _242;
        int _252 = _246 ^ _232;
        float _254 = 1.0 / _248;
        int _256 = as_type<int>(_188) & 1;
        int _258 = -_232;
        int _260 = _252 + _258;
        int _262 = _250 >> 1;
        float _264 = float(_256);
        bool _266 = !_240;
        int _268 = _266 ? _260 : (-1);
        float _270 = float(_262);
        float _272 = float(_268);
        int _274 = -_268;
        int _276 = _274 * as_type<int>((*spvDescriptorSet0.vp_c3)._m0[6].z);
        int _278 = _276 + _53;
        float _280 = _270 + _272;
        float _282 = _228 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
        float _284 = float(_278);
        float _286 = _282 * _280;
        float _288 = _264 + _284;
        float _290 = _254 * (*spvDescriptorSet0.vp_c3)._m0[7].x;
        float _292 = fma(_286, -2.0, 1.0);
        float _294 = _290 * _288;
        float _296 = fma(_294, 2.0, -1.0);
        _168 = as_type<int>(_296);
        _174 = as_type<int>(_292);
    }
    int _298 = _168;
    int _300 = _174;
    float _723 = as_type<float>(_298);
    out.gl_Position.x = _723;
    float _726 = as_type<float>(_300);
    out.gl_Position.y = _726;
    out.gl_Position.z = -1.0;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    out.gl_Layer = as_type<uint>(out.m_32.x);
    return out;
}

vertex main0l_out main0_lz(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_InstanceIndex [[instance_id]], uint gl_BaseInstance [[base_instance]], uint gl_VertexIndex [[vertex_id]])
{
    main0l_out out = {};
    out.m_32 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _48 = as_type<float>(int(gl_InstanceIndex));
    float _50 = as_type<float>(int(gl_BaseInstance));
    int _53 = as_type<int>(_48) - as_type<int>(_50);
    int _55 = _53 << 4;
    uint _58 = uint(int(uint(_55) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_58)];
    float _60 = as_type<float>(_dmw0.x);
    int _62 = _55 + 4;
    uint _64 = uint(int(uint(_62) >> uint(2)));
    float _66 = as_type<float>(_dmw0.y);
    int _68 = _55 + 8;
    uint _70 = uint(int(uint(_68) >> uint(2)));
    float _72 = as_type<float>(_dmw0.z);
    int _74 = _55 + 12;
    uint _76 = uint(int(uint(_74) >> uint(2)));
    float _78 = as_type<float>(_dmw0.w);
    float _80 = float(as_type<int>(_66));
    float _82 = float(as_type<int>(_60));
    bool _86 = _80 > (*spvDescriptorSet0.vp_c3)._m0[2].y;
    bool _88 = _80 > (*spvDescriptorSet0.vp_c3)._m0[3].y;
    bool _90 = _80 > (*spvDescriptorSet0.vp_c3)._m0[4].y;
    bool _92 = _80 > (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _94 = float(as_type<int>(_72));
    bool _96 = _82 > (*spvDescriptorSet0.vp_c3)._m0[2].x;
    bool _98 = _96 || _86;
    bool _100 = _82 > (*spvDescriptorSet0.vp_c3)._m0[3].x;
    bool _102 = _100 || _88;
    bool _104 = _82 > (*spvDescriptorSet0.vp_c3)._m0[4].x;
    bool _106 = _104 || _90;
    bool _108 = _82 > (*spvDescriptorSet0.vp_c3)._m0[5].x;
    bool _110 = _108 || _92;
    float _112 = float(as_type<int>(_78));
    bool _114 = _94 > (*spvDescriptorSet0.vp_c3)._m0[2].z;
    bool _116 = _114 || _98;
    bool _118 = _94 > (*spvDescriptorSet0.vp_c3)._m0[3].z;
    bool _120 = _118 || _102;
    bool _122 = _94 > (*spvDescriptorSet0.vp_c3)._m0[4].z;
    bool _124 = _122 || _106;
    bool _126 = _94 > (*spvDescriptorSet0.vp_c3)._m0[5].z;
    bool _128 = _126 || _110;
    bool _130 = _112 > (*spvDescriptorSet0.vp_c3)._m0[2].w;
    bool _132 = _130 || _116;
    bool _134 = _112 > (*spvDescriptorSet0.vp_c3)._m0[3].w;
    bool _136 = _134 || _120;
    bool _138 = _112 > (*spvDescriptorSet0.vp_c3)._m0[4].w;
    bool _140 = _138 || _124;
    bool _142 = _112 > (*spvDescriptorSet0.vp_c3)._m0[5].w;
    bool _144 = _142 || _128;
    bool _146 = !_132;
    int _148 = _146 ? 0 : 1065353216;
    bool _150 = !_136;
    int _152 = _150 ? 0 : 1065353216;
    bool _154 = !_140;
    int _156 = _154 ? 0 : 1065353216;
    int _158 = as_type<int>(_60);
    int _160 = as_type<int>(_66);
    if (!_132)
    {
        _158 = -971227136;
    }
    int _162 = _158;
    bool _164 = !_144;
    int _166 = _164 ? 0 : 1065353216;
    int _168 = _162;
    if (!_132)
    {
        _160 = -971227136;
    }
    int _170 = _160;
    out.m_32.x = as_type<float>(_148);
    out.m_32.y = as_type<float>(_152);
    out.m_32.z = as_type<float>(_156);
    out.m_32.w = as_type<float>(_166);
    bool _172 = !_132;
    int _174 = _170;
    if (!_172)
    {
        int _176 = abs(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[6].z));
        int _178 = abs(_53);
        float _180 = float(uint(_176));
        float _182 = float(uint(_178));
        float _184 = 1.0 / _180;
        int _186 = as_type<int>(_184) + (-2);
        float _188 = as_type<float>(int(gl_VertexIndex));
        float _190 = as_type<float>(_186) * _182;
        float _192 = trunc(_190);
        float _194 = precise::max(_192, 0.0);
        uint _196 = uint(_194);
        int _198 = -int(_196);
        int _200 = _198 * _176;
        int _202 = _200 + _178;
        float _204 = float(uint(_202));
        float _206 = as_type<float>(_186) * _204;
        float _208 = trunc(_206);
        float _210 = precise::max(_208, 0.0);
        uint _212 = uint(_210);
        float _214 = float(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[6].w));
        int _216 = int(_196) + int(_212);
        int _218 = _53 ^ as_type<int>((*spvDescriptorSet0.vp_c3)._m0[6].z);
        int _220 = -_216;
        uint _222 = uint(int(uint(_218) >> uint(31)));
        int _224 = _220 * _176;
        int _226 = _224 + _178;
        float _228 = 1.0 / _214;
        bool _230 = uint(_226) >= uint(_176);
        int _232 = -int(_222);
        int _234 = as_type<int>(_188) >> 31;
        bool _236 = !_230;
        int _238 = _236 ? 0 : (-1);
        bool _240 = 0 == as_type<int>((*spvDescriptorSet0.vp_c3)._m0[6].z);
        int _242 = _234 & 1;
        int _244 = -_238;
        int _246 = _216 + _244;
        float _248 = float(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[6].z));
        int _250 = as_type<int>(_188) + _242;
        int _252 = _246 ^ _232;
        float _254 = 1.0 / _248;
        int _256 = as_type<int>(_188) & 1;
        int _258 = -_232;
        int _260 = _252 + _258;
        int _262 = _250 >> 1;
        float _264 = float(_256);
        bool _266 = !_240;
        int _268 = _266 ? _260 : (-1);
        float _270 = float(_262);
        float _272 = float(_268);
        int _274 = -_268;
        int _276 = _274 * as_type<int>((*spvDescriptorSet0.vp_c3)._m0[6].z);
        int _278 = _276 + _53;
        float _280 = _270 + _272;
        float _282 = _228 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
        float _284 = float(_278);
        float _286 = _282 * _280;
        float _288 = _264 + _284;
        float _290 = _254 * (*spvDescriptorSet0.vp_c3)._m0[7].x;
        float _292 = fma(_286, -2.0, 1.0);
        float _294 = _290 * _288;
        float _296 = fma(_294, 2.0, -1.0);
        _168 = as_type<int>(_296);
        _174 = as_type<int>(_292);
    }
    int _298 = _168;
    int _300 = _174;
    float _723 = as_type<float>(_298);
    out.gl_Position.x = _723;
    float _726 = as_type<float>(_300);
    out.gl_Position.y = _726;
    out.gl_Position.z = -1.0;
    out.gl_Layer = as_type<uint>(out.m_32.x);
    return out;
}
