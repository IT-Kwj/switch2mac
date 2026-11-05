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

struct _327
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
    float4 m_31 [[attribute(0)]];
    float4 m_35 [[attribute(1)]];
    uint4 m_28 [[attribute(3)]];
    float4 m_33 [[attribute(4)]];
    uint4 m_23 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_26 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _49 = as_type<float>(in.m_23.x);
    int _52 = as_type<int>(_49) & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[8].z);
    bool _56 = _52 != 0;
    int _58 = 0;
    if (!_56)
    {
        _58 = 1073741824;
    }
    int _60 = _58;
    if (!_56)
    {
        out.m_26.x = 0.0;
    }
    int _62 = 0;
    if (!_56)
    {
        _62 = 1065353216;
    }
    int _64 = _62;
    if (!_56)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _238 = as_type<float>(_60);
        out.gl_Position.z = _238;
        float _241 = as_type<float>(_64);
        out.gl_Position.w = _241;
    }
    if (!_56)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _66 = as_type<float>(in.m_28.x);
    float _68 = in.m_31.x;
    float _70 = in.m_31.y;
    float _72 = in.m_33.x;
    float _74 = in.m_33.y;
    float _76 = in.m_33.w;
    int _78 = abs(as_type<int>(_66));
    float _80 = float(uint(_78));
    out.m_26.x = _72;
    float _82 = _80 * 0.3333332836627960205078125;
    out.m_26.y = _74;
    float _84 = trunc(_82);
    float _86 = precise::max(_84, 0.0);
    uint _89 = uint(_86);
    out.m_26.w = _76;
    int _91 = int(_89) * (-3);
    int _93 = _91 + _78;
    float _95 = float(uint(_93));
    float _97 = _95 * 0.3333332836627960205078125;
    float _99 = trunc(_97);
    float _101 = precise::max(_99, 0.0);
    uint _103 = uint(_101);
    int _105 = int(_89) + int(_103);
    int _107 = _105 * (-3);
    int _109 = _107 + _78;
    bool _111 = uint(_109) >= 3u;
    int _113 = as_type<int>(_66) ^ 3;
    bool _115 = !_111;
    int _117 = _115 ? 0 : (-1);
    uint _119 = uint(int(uint(_113) >> uint(31)));
    uint _121 = (spvMulExtended<_327, uint>(as_type<uint>(_66), 2863311531u))._m1;
    int _123 = ~_117;
    int _125 = _105 + _123;
    int _127 = _125 + 1;
    int _129 = ~int(_119);
    int _131 = _129 + 1;
    float _133 = in.m_35.x;
    uint _135 = uint(int(uint(int(_121)) >> uint(1)));
    int _137 = _127 ^ _131;
    int _139 = int(_135) * (-3);
    int _141 = _139 + as_type<int>(_66);
    int _143 = ~_131;
    int _145 = _143 + _137;
    int _147 = _145 + 1;
    int _149 = _147 + (-1);
    float _151 = in.m_33.z;
    int _153 = _141 + (-1);
    float _155 = float(_149);
    float _157 = float(_153);
    float _159 = -_155;
    float _161 = fma(_159, (*spvDescriptorSet0.vp_c3)._m0[8].y, _70);
    float _163 = fma(_157, (*spvDescriptorSet0.vp_c3)._m0[8].x, _68);
    out.gl_PointSize = _133;
    float _165 = _161 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _167 = _161 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _169 = _161 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _171 = _161 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _173 = fma(_163, (*spvDescriptorSet0.vp_c3)._m0[3].x, _165);
    float _175 = fma(_163, (*spvDescriptorSet0.vp_c3)._m0[4].x, _167);
    float _177 = fma(_163, (*spvDescriptorSet0.vp_c3)._m0[5].x, _169);
    float _179 = fma(_163, (*spvDescriptorSet0.vp_c3)._m0[6].x, _171);
    float _181 = _173 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    float _183 = _175 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _185 = _177 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _187 = _179 + (*spvDescriptorSet0.vp_c3)._m0[6].w;
    out.m_26.z = _151;
    out.gl_Position.x = _181;
    out.gl_Position.y = _183;
    out.gl_Position.z = _185;
    out.gl_Position.w = _187;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_26 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _49 = as_type<float>(in.m_23.x);
    int _52 = as_type<int>(_49) & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[8].z);
    bool _56 = _52 != 0;
    int _58 = 0;
    if (!_56)
    {
        _58 = 1073741824;
    }
    int _60 = _58;
    if (!_56)
    {
        out.m_26.x = 0.0;
    }
    int _62 = 0;
    if (!_56)
    {
        _62 = 1065353216;
    }
    int _64 = _62;
    if (!_56)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _238 = as_type<float>(_60);
        out.gl_Position.z = _238;
        float _241 = as_type<float>(_64);
        out.gl_Position.w = _241;
    }
    if (!_56)
    {
        return out;
    }
    float _66 = as_type<float>(in.m_28.x);
    float _68 = in.m_31.x;
    float _70 = in.m_31.y;
    float _72 = in.m_33.x;
    float _74 = in.m_33.y;
    float _76 = in.m_33.w;
    int _78 = abs(as_type<int>(_66));
    float _80 = float(uint(_78));
    out.m_26.x = _72;
    float _82 = _80 * 0.3333332836627960205078125;
    out.m_26.y = _74;
    float _84 = trunc(_82);
    float _86 = precise::max(_84, 0.0);
    uint _89 = uint(_86);
    out.m_26.w = _76;
    int _91 = int(_89) * (-3);
    int _93 = _91 + _78;
    float _95 = float(uint(_93));
    float _97 = _95 * 0.3333332836627960205078125;
    float _99 = trunc(_97);
    float _101 = precise::max(_99, 0.0);
    uint _103 = uint(_101);
    int _105 = int(_89) + int(_103);
    int _107 = _105 * (-3);
    int _109 = _107 + _78;
    bool _111 = uint(_109) >= 3u;
    int _113 = as_type<int>(_66) ^ 3;
    bool _115 = !_111;
    int _117 = _115 ? 0 : (-1);
    uint _119 = uint(int(uint(_113) >> uint(31)));
    uint _121 = (spvMulExtended<_327, uint>(as_type<uint>(_66), 2863311531u))._m1;
    int _123 = ~_117;
    int _125 = _105 + _123;
    int _127 = _125 + 1;
    int _129 = ~int(_119);
    int _131 = _129 + 1;
    float _133 = in.m_35.x;
    uint _135 = uint(int(uint(int(_121)) >> uint(1)));
    int _137 = _127 ^ _131;
    int _139 = int(_135) * (-3);
    int _141 = _139 + as_type<int>(_66);
    int _143 = ~_131;
    int _145 = _143 + _137;
    int _147 = _145 + 1;
    int _149 = _147 + (-1);
    float _151 = in.m_33.z;
    int _153 = _141 + (-1);
    float _155 = float(_149);
    float _157 = float(_153);
    float _159 = -_155;
    float _161 = fma(_159, (*spvDescriptorSet0.vp_c3)._m0[8].y, _70);
    float _163 = fma(_157, (*spvDescriptorSet0.vp_c3)._m0[8].x, _68);
    out.gl_PointSize = _133;
    float _165 = _161 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _167 = _161 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _169 = _161 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _171 = _161 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _173 = fma(_163, (*spvDescriptorSet0.vp_c3)._m0[3].x, _165);
    float _175 = fma(_163, (*spvDescriptorSet0.vp_c3)._m0[4].x, _167);
    float _177 = fma(_163, (*spvDescriptorSet0.vp_c3)._m0[5].x, _169);
    float _179 = fma(_163, (*spvDescriptorSet0.vp_c3)._m0[6].x, _171);
    float _181 = _173 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    float _183 = _175 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _185 = _177 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _187 = _179 + (*spvDescriptorSet0.vp_c3)._m0[6].w;
    out.m_26.z = _151;
    out.gl_Position.x = _181;
    out.gl_Position.y = _183;
    out.gl_Position.z = _185;
    out.gl_Position.w = _187;
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
    out.m_26 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _49 = as_type<float>(in.m_23.x);
    int _52 = as_type<int>(_49) & as_type<int>((*spvDescriptorSet0.vp_c3)._m0[8].z);
    bool _56 = _52 != 0;
    int _58 = 0;
    if (!_56)
    {
        _58 = 1073741824;
    }
    int _60 = _58;
    if (!_56)
    {
        out.m_26.x = 0.0;
    }
    int _62 = 0;
    if (!_56)
    {
        _62 = 1065353216;
    }
    int _64 = _62;
    if (!_56)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _238 = as_type<float>(_60);
        out.gl_Position.z = _238;
        float _241 = as_type<float>(_64);
        out.gl_Position.w = _241;
    }
    if (!_56)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_26.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_26.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_26.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_26.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _66 = as_type<float>(in.m_28.x);
    float _68 = in.m_31.x;
    float _70 = in.m_31.y;
    float _72 = in.m_33.x;
    float _74 = in.m_33.y;
    float _76 = in.m_33.w;
    int _78 = abs(as_type<int>(_66));
    float _80 = float(uint(_78));
    out.m_26.x = _72;
    float _82 = _80 * 0.3333332836627960205078125;
    out.m_26.y = _74;
    float _84 = trunc(_82);
    float _86 = precise::max(_84, 0.0);
    uint _89 = uint(_86);
    out.m_26.w = _76;
    int _91 = int(_89) * (-3);
    int _93 = _91 + _78;
    float _95 = float(uint(_93));
    float _97 = _95 * 0.3333332836627960205078125;
    float _99 = trunc(_97);
    float _101 = precise::max(_99, 0.0);
    uint _103 = uint(_101);
    int _105 = int(_89) + int(_103);
    int _107 = _105 * (-3);
    int _109 = _107 + _78;
    bool _111 = uint(_109) >= 3u;
    int _113 = as_type<int>(_66) ^ 3;
    bool _115 = !_111;
    int _117 = _115 ? 0 : (-1);
    uint _119 = uint(int(uint(_113) >> uint(31)));
    uint _121 = (spvMulExtended<_327, uint>(as_type<uint>(_66), 2863311531u))._m1;
    int _123 = ~_117;
    int _125 = _105 + _123;
    int _127 = _125 + 1;
    int _129 = ~int(_119);
    int _131 = _129 + 1;
    float _133 = in.m_35.x;
    uint _135 = uint(int(uint(int(_121)) >> uint(1)));
    int _137 = _127 ^ _131;
    int _139 = int(_135) * (-3);
    int _141 = _139 + as_type<int>(_66);
    int _143 = ~_131;
    int _145 = _143 + _137;
    int _147 = _145 + 1;
    int _149 = _147 + (-1);
    float _151 = in.m_33.z;
    int _153 = _141 + (-1);
    float _155 = float(_149);
    float _157 = float(_153);
    float _159 = -_155;
    float _161 = fma(_159, (*spvDescriptorSet0.vp_c3)._m0[8].y, _70);
    float _163 = fma(_157, (*spvDescriptorSet0.vp_c3)._m0[8].x, _68);
    out.gl_PointSize = _133;
    float _165 = _161 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _167 = _161 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _169 = _161 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _171 = _161 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _173 = fma(_163, (*spvDescriptorSet0.vp_c3)._m0[3].x, _165);
    float _175 = fma(_163, (*spvDescriptorSet0.vp_c3)._m0[4].x, _167);
    float _177 = fma(_163, (*spvDescriptorSet0.vp_c3)._m0[5].x, _169);
    float _179 = fma(_163, (*spvDescriptorSet0.vp_c3)._m0[6].x, _171);
    float _181 = _173 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    float _183 = _175 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _185 = _177 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _187 = _179 + (*spvDescriptorSet0.vp_c3)._m0[6].w;
    out.m_26.z = _151;
    out.gl_Position.x = _181;
    out.gl_Position.y = _183;
    out.gl_Position.z = _185;
    out.gl_Position.w = _187;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_26.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_26.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_26.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_26.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

