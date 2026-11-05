#pragma clang diagnostic ignored "-Wmissing-prototypes"

#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

template<typename T, typename U, typename V>
[[clang::optnone]] T spvMulExtended(V l, V r)
{
    return T{U(l * r), U(mulhi(l, r))};
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

struct _451
{
    uint _m0;
    uint _m1;
};

struct spvDescriptorSetBuffer0
{
    constant _16* vp_c1 [[id(0)]];
    constant _16* vp_c3 [[id(1)]];
};

struct main0_out
{
    float4 m_28 [[user(locn0)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_38 [[attribute(0)]];
    float4 m_36 [[attribute(1)]];
    float4 m_34 [[attribute(2)]];
    uint4 m_40 [[attribute(3)]];
    float4 m_42 [[attribute(4)]];
    uint4 m_25 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_28 = float4(0.0, 0.0, 0.0, 1.0);
    bool _96 = false;
    bool _94 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _56 = as_type<float>(in.m_25.x);
    int _59 = as_type<int>(_56) & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[8].z);
    bool _63 = _59 != 0;
    int _65 = 0;
    if (!_63)
    {
        _65 = 1073741824;
    }
    int _67 = _65;
    if (!_63)
    {
        out.m_28.x = 0.0;
    }
    int _69 = 0;
    if (!_63)
    {
        _69 = 1065353216;
    }
    int _71 = _69;
    if (!_63)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _282 = as_type<float>(_67);
        out.gl_Position.z = _282;
        float _285 = as_type<float>(_71);
        out.gl_Position.w = _285;
    }
    if (!_63)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _73 = as_type<float>(int(gl_VertexIndex));
    int _75 = as_type<int>(_73) + (-1);
    uint _78 = min(uint(_75), 2u);
    int _80 = int(_78) * 4;
    uint _82 = uint(int(uint(_80) >> uint(2)));
    uint _84 = uint(int(uint(int(_82)) >> uint(2)));
    int _86 = int(_82) & 3;
    float _88 = (*spvDescriptorSet0.vp_c1)._m0[int(_84)][_86];
    bool _90 = as_type<int>(_88) == 256;
    if (!_90)
    {
        bool _92 = as_type<int>(_88) == 288;
        _94 = _92;
        if (!_94)
        {
            _96 = true;
        }
    }
    float _102;
    float _104;
    if (!_94)
    {
        if (!_96)
        {
            float _98 = in.m_34.x;
            float _100 = in.m_34.y;
            _102 = _100;
            _104 = _98;
        }
    }
    if ((false || _96) || _94)
    {
        if ((!_96) || _94)
        {
            _94 = false;
            float _106 = in.m_36.x;
            float _108 = in.m_36.y;
            _102 = _108;
            _104 = _106;
        }
        if (false || _96)
        {
            _96 = false;
            float _110 = in.m_38.x;
            float _112 = in.m_38.y;
            _102 = _112;
            _104 = _110;
        }
    }
    float _114 = _102;
    float _116 = _104;
    float _118 = as_type<float>(in.m_40.x);
    float _120 = in.m_42.z;
    float _122 = in.m_42.w;
    int _124 = abs(as_type<int>(_118));
    float _126 = float(uint(_124));
    out.m_28.z = _120;
    float _128 = _126 * 0.3333332836627960205078125;
    out.m_28.w = _122;
    float _130 = trunc(_128);
    float _132 = precise::max(_130, 0.0);
    uint _134 = uint(_132);
    int _136 = int(_134) * (-3);
    int _138 = _136 + _124;
    float _140 = float(uint(_138));
    float _142 = _140 * 0.3333332836627960205078125;
    int _144 = as_type<int>(_118) ^ 3;
    float _146 = trunc(_142);
    float _148 = precise::max(_146, 0.0);
    uint _150 = uint(_148);
    int _152 = int(_134) + int(_150);
    float _154 = in.m_42.x;
    int _156 = _152 * (-3);
    int _158 = _156 + _124;
    bool _160 = uint(_158) >= 3u;
    uint _162 = uint(int(uint(_144) >> uint(31)));
    uint _164 = (spvMulExtended<_451, uint>(as_type<uint>(_118), 2863311531u))._m1;
    bool _166 = !_160;
    int _168 = _166 ? 0 : (-1);
    int _170 = -int(_162);
    int _172 = ~_168;
    int _174 = _152 + _172;
    int _176 = _174 + 1;
    uint _178 = uint(int(uint(int(_164)) >> uint(1)));
    float _180 = in.m_42.y;
    int _182 = _176 ^ _170;
    int _184 = int(_178) * (-3);
    int _186 = _184 + as_type<int>(_118);
    int _188 = ~_170;
    int _190 = _188 + _182;
    int _192 = _190 + 1;
    out.m_28.x = _154;
    int _194 = _192 + (-1);
    int _196 = _186 + (-1);
    float _198 = float(_194);
    float _200 = float(_196);
    float _202 = -_198;
    float _204 = fma(_202, (*spvDescriptorSet0.vp_c3)._m0[8].y, _114);
    float _206 = fma(_200, (*spvDescriptorSet0.vp_c3)._m0[8].x, _116);
    float _208 = _204 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _210 = _204 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _212 = _204 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _214 = _204 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _216 = fma(_206, (*spvDescriptorSet0.vp_c3)._m0[3].x, _208);
    float _218 = fma(_206, (*spvDescriptorSet0.vp_c3)._m0[4].x, _210);
    float _220 = fma(_206, (*spvDescriptorSet0.vp_c3)._m0[5].x, _212);
    float _222 = fma(_206, (*spvDescriptorSet0.vp_c3)._m0[6].x, _214);
    float _224 = _216 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    float _226 = _218 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _228 = _220 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _230 = _222 + (*spvDescriptorSet0.vp_c3)._m0[6].w;
    out.m_28.y = _180;
    out.gl_Position.x = _224;
    out.gl_Position.y = _226;
    out.gl_Position.z = _228;
    out.gl_Position.w = _230;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_28 = float4(0.0, 0.0, 0.0, 1.0);
    bool _96 = false;
    bool _94 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _56 = as_type<float>(in.m_25.x);
    int _59 = as_type<int>(_56) & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[8].z);
    bool _63 = _59 != 0;
    int _65 = 0;
    if (!_63)
    {
        _65 = 1073741824;
    }
    int _67 = _65;
    if (!_63)
    {
        out.m_28.x = 0.0;
    }
    int _69 = 0;
    if (!_63)
    {
        _69 = 1065353216;
    }
    int _71 = _69;
    if (!_63)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _282 = as_type<float>(_67);
        out.gl_Position.z = _282;
        float _285 = as_type<float>(_71);
        out.gl_Position.w = _285;
    }
    if (!_63)
    {
        return out;
    }
    float _73 = as_type<float>(int(gl_VertexIndex));
    int _75 = as_type<int>(_73) + (-1);
    uint _78 = min(uint(_75), 2u);
    int _80 = int(_78) * 4;
    uint _82 = uint(int(uint(_80) >> uint(2)));
    uint _84 = uint(int(uint(int(_82)) >> uint(2)));
    int _86 = int(_82) & 3;
    float _88 = (*spvDescriptorSet0.vp_c1)._m0[int(_84)][_86];
    bool _90 = as_type<int>(_88) == 256;
    if (!_90)
    {
        bool _92 = as_type<int>(_88) == 288;
        _94 = _92;
        if (!_94)
        {
            _96 = true;
        }
    }
    float _102;
    float _104;
    if (!_94)
    {
        if (!_96)
        {
            float _98 = in.m_34.x;
            float _100 = in.m_34.y;
            _102 = _100;
            _104 = _98;
        }
    }
    if ((false || _96) || _94)
    {
        if ((!_96) || _94)
        {
            _94 = false;
            float _106 = in.m_36.x;
            float _108 = in.m_36.y;
            _102 = _108;
            _104 = _106;
        }
        if (false || _96)
        {
            _96 = false;
            float _110 = in.m_38.x;
            float _112 = in.m_38.y;
            _102 = _112;
            _104 = _110;
        }
    }
    float _114 = _102;
    float _116 = _104;
    float _118 = as_type<float>(in.m_40.x);
    float _120 = in.m_42.z;
    float _122 = in.m_42.w;
    int _124 = abs(as_type<int>(_118));
    float _126 = float(uint(_124));
    out.m_28.z = _120;
    float _128 = _126 * 0.3333332836627960205078125;
    out.m_28.w = _122;
    float _130 = trunc(_128);
    float _132 = precise::max(_130, 0.0);
    uint _134 = uint(_132);
    int _136 = int(_134) * (-3);
    int _138 = _136 + _124;
    float _140 = float(uint(_138));
    float _142 = _140 * 0.3333332836627960205078125;
    int _144 = as_type<int>(_118) ^ 3;
    float _146 = trunc(_142);
    float _148 = precise::max(_146, 0.0);
    uint _150 = uint(_148);
    int _152 = int(_134) + int(_150);
    float _154 = in.m_42.x;
    int _156 = _152 * (-3);
    int _158 = _156 + _124;
    bool _160 = uint(_158) >= 3u;
    uint _162 = uint(int(uint(_144) >> uint(31)));
    uint _164 = (spvMulExtended<_451, uint>(as_type<uint>(_118), 2863311531u))._m1;
    bool _166 = !_160;
    int _168 = _166 ? 0 : (-1);
    int _170 = -int(_162);
    int _172 = ~_168;
    int _174 = _152 + _172;
    int _176 = _174 + 1;
    uint _178 = uint(int(uint(int(_164)) >> uint(1)));
    float _180 = in.m_42.y;
    int _182 = _176 ^ _170;
    int _184 = int(_178) * (-3);
    int _186 = _184 + as_type<int>(_118);
    int _188 = ~_170;
    int _190 = _188 + _182;
    int _192 = _190 + 1;
    out.m_28.x = _154;
    int _194 = _192 + (-1);
    int _196 = _186 + (-1);
    float _198 = float(_194);
    float _200 = float(_196);
    float _202 = -_198;
    float _204 = fma(_202, (*spvDescriptorSet0.vp_c3)._m0[8].y, _114);
    float _206 = fma(_200, (*spvDescriptorSet0.vp_c3)._m0[8].x, _116);
    float _208 = _204 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _210 = _204 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _212 = _204 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _214 = _204 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _216 = fma(_206, (*spvDescriptorSet0.vp_c3)._m0[3].x, _208);
    float _218 = fma(_206, (*spvDescriptorSet0.vp_c3)._m0[4].x, _210);
    float _220 = fma(_206, (*spvDescriptorSet0.vp_c3)._m0[5].x, _212);
    float _222 = fma(_206, (*spvDescriptorSet0.vp_c3)._m0[6].x, _214);
    float _224 = _216 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    float _226 = _218 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _228 = _220 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _230 = _222 + (*spvDescriptorSet0.vp_c3)._m0[6].w;
    out.m_28.y = _180;
    out.gl_Position.x = _224;
    out.gl_Position.y = _226;
    out.gl_Position.z = _228;
    out.gl_Position.w = _230;
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
    out.m_28 = float4(0.0, 0.0, 0.0, 1.0);
    bool _96 = false;
    bool _94 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _56 = as_type<float>(in.m_25.x);
    int _59 = as_type<int>(_56) & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[8].z);
    bool _63 = _59 != 0;
    int _65 = 0;
    if (!_63)
    {
        _65 = 1073741824;
    }
    int _67 = _65;
    if (!_63)
    {
        out.m_28.x = 0.0;
    }
    int _69 = 0;
    if (!_63)
    {
        _69 = 1065353216;
    }
    int _71 = _69;
    if (!_63)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _282 = as_type<float>(_67);
        out.gl_Position.z = _282;
        float _285 = as_type<float>(_71);
        out.gl_Position.w = _285;
    }
    if (!_63)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_28.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_28.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_28.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_28.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _73 = as_type<float>(int(gl_VertexIndex));
    int _75 = as_type<int>(_73) + (-1);
    uint _78 = min(uint(_75), 2u);
    int _80 = int(_78) * 4;
    uint _82 = uint(int(uint(_80) >> uint(2)));
    uint _84 = uint(int(uint(int(_82)) >> uint(2)));
    int _86 = int(_82) & 3;
    float _88 = (*spvDescriptorSet0.vp_c1)._m0[int(_84)][_86];
    bool _90 = as_type<int>(_88) == 256;
    if (!_90)
    {
        bool _92 = as_type<int>(_88) == 288;
        _94 = _92;
        if (!_94)
        {
            _96 = true;
        }
    }
    float _102;
    float _104;
    if (!_94)
    {
        if (!_96)
        {
            float _98 = in.m_34.x;
            float _100 = in.m_34.y;
            _102 = _100;
            _104 = _98;
        }
    }
    if ((false || _96) || _94)
    {
        if ((!_96) || _94)
        {
            _94 = false;
            float _106 = in.m_36.x;
            float _108 = in.m_36.y;
            _102 = _108;
            _104 = _106;
        }
        if (false || _96)
        {
            _96 = false;
            float _110 = in.m_38.x;
            float _112 = in.m_38.y;
            _102 = _112;
            _104 = _110;
        }
    }
    float _114 = _102;
    float _116 = _104;
    float _118 = as_type<float>(in.m_40.x);
    float _120 = in.m_42.z;
    float _122 = in.m_42.w;
    int _124 = abs(as_type<int>(_118));
    float _126 = float(uint(_124));
    out.m_28.z = _120;
    float _128 = _126 * 0.3333332836627960205078125;
    out.m_28.w = _122;
    float _130 = trunc(_128);
    float _132 = precise::max(_130, 0.0);
    uint _134 = uint(_132);
    int _136 = int(_134) * (-3);
    int _138 = _136 + _124;
    float _140 = float(uint(_138));
    float _142 = _140 * 0.3333332836627960205078125;
    int _144 = as_type<int>(_118) ^ 3;
    float _146 = trunc(_142);
    float _148 = precise::max(_146, 0.0);
    uint _150 = uint(_148);
    int _152 = int(_134) + int(_150);
    float _154 = in.m_42.x;
    int _156 = _152 * (-3);
    int _158 = _156 + _124;
    bool _160 = uint(_158) >= 3u;
    uint _162 = uint(int(uint(_144) >> uint(31)));
    uint _164 = (spvMulExtended<_451, uint>(as_type<uint>(_118), 2863311531u))._m1;
    bool _166 = !_160;
    int _168 = _166 ? 0 : (-1);
    int _170 = -int(_162);
    int _172 = ~_168;
    int _174 = _152 + _172;
    int _176 = _174 + 1;
    uint _178 = uint(int(uint(int(_164)) >> uint(1)));
    float _180 = in.m_42.y;
    int _182 = _176 ^ _170;
    int _184 = int(_178) * (-3);
    int _186 = _184 + as_type<int>(_118);
    int _188 = ~_170;
    int _190 = _188 + _182;
    int _192 = _190 + 1;
    out.m_28.x = _154;
    int _194 = _192 + (-1);
    int _196 = _186 + (-1);
    float _198 = float(_194);
    float _200 = float(_196);
    float _202 = -_198;
    float _204 = fma(_202, (*spvDescriptorSet0.vp_c3)._m0[8].y, _114);
    float _206 = fma(_200, (*spvDescriptorSet0.vp_c3)._m0[8].x, _116);
    float _208 = _204 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _210 = _204 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _212 = _204 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _214 = _204 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _216 = fma(_206, (*spvDescriptorSet0.vp_c3)._m0[3].x, _208);
    float _218 = fma(_206, (*spvDescriptorSet0.vp_c3)._m0[4].x, _210);
    float _220 = fma(_206, (*spvDescriptorSet0.vp_c3)._m0[5].x, _212);
    float _222 = fma(_206, (*spvDescriptorSet0.vp_c3)._m0[6].x, _214);
    float _224 = _216 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    float _226 = _218 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _228 = _220 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _230 = _222 + (*spvDescriptorSet0.vp_c3)._m0[6].w;
    out.m_28.y = _180;
    out.gl_Position.x = _224;
    out.gl_Position.y = _226;
    out.gl_Position.z = _228;
    out.gl_Position.w = _230;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_28.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_28.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_28.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_28.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

