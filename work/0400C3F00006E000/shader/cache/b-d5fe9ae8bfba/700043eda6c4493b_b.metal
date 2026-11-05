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

struct _375
{
    uint _m0;
    uint _m1;
};

struct spvDescriptorSetBuffer0
{
    constant _16* vp_c3 [[id(0)]];
};

struct main0_out
{
    float4 m_26 [[user(locn0)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_38 [[attribute(0)]];
    float4 m_36 [[attribute(1)]];
    uint4 m_28 [[attribute(3)]];
    float4 m_31 [[attribute(4)]];
    uint4 m_23 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_26 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _52 = as_type<float>(in.m_23.x);
    int _55 = as_type<int>(_52) & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[8].z);
    bool _59 = _55 != 0;
    int _61 = 0;
    if (!_59)
    {
        _61 = 1073741824;
    }
    int _63 = _61;
    if (!_59)
    {
        out.m_26.x = 0.0;
    }
    int _65 = 0;
    if (!_59)
    {
        _65 = 1065353216;
    }
    int _67 = _65;
    if (!_59)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _263 = as_type<float>(_63);
        out.gl_Position.z = _263;
        float _266 = as_type<float>(_67);
        out.gl_Position.w = _266;
    }
    if (!_59)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _69 = as_type<float>(in.m_28.x);
    float _71 = in.m_31.y;
    float _73 = in.m_31.z;
    float _75 = in.m_31.w;
    int _77 = abs(as_type<int>(_69));
    float _79 = float(uint(_77));
    out.m_26.y = _71;
    float _81 = _79 * 0.3333332836627960205078125;
    out.m_26.z = _73;
    float _83 = as_type<float>(int(gl_VertexIndex));
    float _85 = trunc(_81);
    float _87 = precise::max(_85, 0.0);
    uint _90 = uint(_87);
    out.m_26.w = _75;
    int _92 = int(_90) * (-3);
    int _94 = _92 + _77;
    float _96 = float(uint(_94));
    bool _98 = as_type<int>(_83) != 1;
    float _100 = _96 * 0.3333332836627960205078125;
    float _102 = trunc(_100);
    float _104 = precise::max(_102, 0.0);
    uint _106 = uint(_104);
    float _108 = _83;
    float _110 = _96;
    if (!_98)
    {
        float _112 = in.m_36.x;
        float _114 = in.m_36.y;
        _108 = _112;
        _110 = _114;
    }
    float _116 = _108;
    float _118 = _110;
    float _120 = _116;
    float _122 = _118;
    if (_98)
    {
        float _124 = in.m_38.x;
        float _126 = in.m_38.y;
        _120 = _124;
        _122 = _126;
    }
    float _128 = _120;
    float _130 = _122;
    int _132 = int(_90) + int(_106);
    int _134 = as_type<int>(_69) ^ 3;
    int _136 = _132 * (-3);
    int _138 = _136 + _77;
    bool _140 = uint(_138) >= 3u;
    uint _142 = uint(int(uint(_134) >> uint(31)));
    uint _144 = (spvMulExtended<_375, uint>(as_type<uint>(_69), 2863311531u))._m1;
    bool _146 = !_140;
    int _148 = _146 ? 0 : (-1);
    int _150 = ~int(_142);
    int _152 = _150 + 1;
    int _154 = ~_148;
    int _156 = _132 + _154;
    int _158 = _156 + 1;
    uint _160 = uint(int(uint(int(_144)) >> uint(1)));
    float _162 = in.m_31.x;
    int _164 = _158 ^ _152;
    int _166 = int(_160) * (-3);
    int _168 = _166 + as_type<int>(_69);
    int _170 = ~_152;
    int _172 = _170 + _164;
    int _174 = _172 + 1;
    int _176 = _174 + (-1);
    int _178 = _168 + (-1);
    float _180 = float(_176);
    float _182 = float(_178);
    float _184 = -_180;
    float _186 = fma(_184, (*spvDescriptorSet0.vp_c3)._m0[8].y, _130);
    float _188 = fma(_182, (*spvDescriptorSet0.vp_c3)._m0[8].x, _128);
    float _190 = _186 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _192 = _186 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _194 = _186 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _196 = _186 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _198 = fma(_188, (*spvDescriptorSet0.vp_c3)._m0[3].x, _190);
    float _200 = fma(_188, (*spvDescriptorSet0.vp_c3)._m0[4].x, _192);
    float _202 = fma(_188, (*spvDescriptorSet0.vp_c3)._m0[5].x, _194);
    float _204 = fma(_188, (*spvDescriptorSet0.vp_c3)._m0[6].x, _196);
    float _206 = _198 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    float _208 = _200 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _210 = _202 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _212 = _204 + (*spvDescriptorSet0.vp_c3)._m0[6].w;
    out.m_26.x = _162;
    out.gl_Position.x = _206;
    out.gl_Position.y = _208;
    out.gl_Position.z = _210;
    out.gl_Position.w = _212;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_26 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _52 = as_type<float>(in.m_23.x);
    int _55 = as_type<int>(_52) & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[8].z);
    bool _59 = _55 != 0;
    int _61 = 0;
    if (!_59)
    {
        _61 = 1073741824;
    }
    int _63 = _61;
    if (!_59)
    {
        out.m_26.x = 0.0;
    }
    int _65 = 0;
    if (!_59)
    {
        _65 = 1065353216;
    }
    int _67 = _65;
    if (!_59)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _263 = as_type<float>(_63);
        out.gl_Position.z = _263;
        float _266 = as_type<float>(_67);
        out.gl_Position.w = _266;
    }
    if (!_59)
    {
        return out;
    }
    float _69 = as_type<float>(in.m_28.x);
    float _71 = in.m_31.y;
    float _73 = in.m_31.z;
    float _75 = in.m_31.w;
    int _77 = abs(as_type<int>(_69));
    float _79 = float(uint(_77));
    out.m_26.y = _71;
    float _81 = _79 * 0.3333332836627960205078125;
    out.m_26.z = _73;
    float _83 = as_type<float>(int(gl_VertexIndex));
    float _85 = trunc(_81);
    float _87 = precise::max(_85, 0.0);
    uint _90 = uint(_87);
    out.m_26.w = _75;
    int _92 = int(_90) * (-3);
    int _94 = _92 + _77;
    float _96 = float(uint(_94));
    bool _98 = as_type<int>(_83) != 1;
    float _100 = _96 * 0.3333332836627960205078125;
    float _102 = trunc(_100);
    float _104 = precise::max(_102, 0.0);
    uint _106 = uint(_104);
    float _108 = _83;
    float _110 = _96;
    if (!_98)
    {
        float _112 = in.m_36.x;
        float _114 = in.m_36.y;
        _108 = _112;
        _110 = _114;
    }
    float _116 = _108;
    float _118 = _110;
    float _120 = _116;
    float _122 = _118;
    if (_98)
    {
        float _124 = in.m_38.x;
        float _126 = in.m_38.y;
        _120 = _124;
        _122 = _126;
    }
    float _128 = _120;
    float _130 = _122;
    int _132 = int(_90) + int(_106);
    int _134 = as_type<int>(_69) ^ 3;
    int _136 = _132 * (-3);
    int _138 = _136 + _77;
    bool _140 = uint(_138) >= 3u;
    uint _142 = uint(int(uint(_134) >> uint(31)));
    uint _144 = (spvMulExtended<_375, uint>(as_type<uint>(_69), 2863311531u))._m1;
    bool _146 = !_140;
    int _148 = _146 ? 0 : (-1);
    int _150 = ~int(_142);
    int _152 = _150 + 1;
    int _154 = ~_148;
    int _156 = _132 + _154;
    int _158 = _156 + 1;
    uint _160 = uint(int(uint(int(_144)) >> uint(1)));
    float _162 = in.m_31.x;
    int _164 = _158 ^ _152;
    int _166 = int(_160) * (-3);
    int _168 = _166 + as_type<int>(_69);
    int _170 = ~_152;
    int _172 = _170 + _164;
    int _174 = _172 + 1;
    int _176 = _174 + (-1);
    int _178 = _168 + (-1);
    float _180 = float(_176);
    float _182 = float(_178);
    float _184 = -_180;
    float _186 = fma(_184, (*spvDescriptorSet0.vp_c3)._m0[8].y, _130);
    float _188 = fma(_182, (*spvDescriptorSet0.vp_c3)._m0[8].x, _128);
    float _190 = _186 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _192 = _186 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _194 = _186 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _196 = _186 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _198 = fma(_188, (*spvDescriptorSet0.vp_c3)._m0[3].x, _190);
    float _200 = fma(_188, (*spvDescriptorSet0.vp_c3)._m0[4].x, _192);
    float _202 = fma(_188, (*spvDescriptorSet0.vp_c3)._m0[5].x, _194);
    float _204 = fma(_188, (*spvDescriptorSet0.vp_c3)._m0[6].x, _196);
    float _206 = _198 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    float _208 = _200 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _210 = _202 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _212 = _204 + (*spvDescriptorSet0.vp_c3)._m0[6].w;
    out.m_26.x = _162;
    out.gl_Position.x = _206;
    out.gl_Position.y = _208;
    out.gl_Position.z = _210;
    out.gl_Position.w = _212;
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
    out.m_26 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _52 = as_type<float>(in.m_23.x);
    int _55 = as_type<int>(_52) & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[8].z);
    bool _59 = _55 != 0;
    int _61 = 0;
    if (!_59)
    {
        _61 = 1073741824;
    }
    int _63 = _61;
    if (!_59)
    {
        out.m_26.x = 0.0;
    }
    int _65 = 0;
    if (!_59)
    {
        _65 = 1065353216;
    }
    int _67 = _65;
    if (!_59)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _263 = as_type<float>(_63);
        out.gl_Position.z = _263;
        float _266 = as_type<float>(_67);
        out.gl_Position.w = _266;
    }
    if (!_59)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_26.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_26.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_26.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_26.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _69 = as_type<float>(in.m_28.x);
    float _71 = in.m_31.y;
    float _73 = in.m_31.z;
    float _75 = in.m_31.w;
    int _77 = abs(as_type<int>(_69));
    float _79 = float(uint(_77));
    out.m_26.y = _71;
    float _81 = _79 * 0.3333332836627960205078125;
    out.m_26.z = _73;
    float _83 = as_type<float>(int(gl_VertexIndex));
    float _85 = trunc(_81);
    float _87 = precise::max(_85, 0.0);
    uint _90 = uint(_87);
    out.m_26.w = _75;
    int _92 = int(_90) * (-3);
    int _94 = _92 + _77;
    float _96 = float(uint(_94));
    bool _98 = as_type<int>(_83) != 1;
    float _100 = _96 * 0.3333332836627960205078125;
    float _102 = trunc(_100);
    float _104 = precise::max(_102, 0.0);
    uint _106 = uint(_104);
    float _108 = _83;
    float _110 = _96;
    if (!_98)
    {
        float _112 = in.m_36.x;
        float _114 = in.m_36.y;
        _108 = _112;
        _110 = _114;
    }
    float _116 = _108;
    float _118 = _110;
    float _120 = _116;
    float _122 = _118;
    if (_98)
    {
        float _124 = in.m_38.x;
        float _126 = in.m_38.y;
        _120 = _124;
        _122 = _126;
    }
    float _128 = _120;
    float _130 = _122;
    int _132 = int(_90) + int(_106);
    int _134 = as_type<int>(_69) ^ 3;
    int _136 = _132 * (-3);
    int _138 = _136 + _77;
    bool _140 = uint(_138) >= 3u;
    uint _142 = uint(int(uint(_134) >> uint(31)));
    uint _144 = (spvMulExtended<_375, uint>(as_type<uint>(_69), 2863311531u))._m1;
    bool _146 = !_140;
    int _148 = _146 ? 0 : (-1);
    int _150 = ~int(_142);
    int _152 = _150 + 1;
    int _154 = ~_148;
    int _156 = _132 + _154;
    int _158 = _156 + 1;
    uint _160 = uint(int(uint(int(_144)) >> uint(1)));
    float _162 = in.m_31.x;
    int _164 = _158 ^ _152;
    int _166 = int(_160) * (-3);
    int _168 = _166 + as_type<int>(_69);
    int _170 = ~_152;
    int _172 = _170 + _164;
    int _174 = _172 + 1;
    int _176 = _174 + (-1);
    int _178 = _168 + (-1);
    float _180 = float(_176);
    float _182 = float(_178);
    float _184 = -_180;
    float _186 = fma(_184, (*spvDescriptorSet0.vp_c3)._m0[8].y, _130);
    float _188 = fma(_182, (*spvDescriptorSet0.vp_c3)._m0[8].x, _128);
    float _190 = _186 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _192 = _186 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _194 = _186 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _196 = _186 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _198 = fma(_188, (*spvDescriptorSet0.vp_c3)._m0[3].x, _190);
    float _200 = fma(_188, (*spvDescriptorSet0.vp_c3)._m0[4].x, _192);
    float _202 = fma(_188, (*spvDescriptorSet0.vp_c3)._m0[5].x, _194);
    float _204 = fma(_188, (*spvDescriptorSet0.vp_c3)._m0[6].x, _196);
    float _206 = _198 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    float _208 = _200 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _210 = _202 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _212 = _204 + (*spvDescriptorSet0.vp_c3)._m0[6].w;
    out.m_26.x = _162;
    out.gl_Position.x = _206;
    out.gl_Position.y = _208;
    out.gl_Position.z = _210;
    out.gl_Position.w = _212;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_26.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_26.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_26.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_26.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

