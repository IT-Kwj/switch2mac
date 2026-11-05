#pragma clang diagnostic ignored "-Wmissing-prototypes"

#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

struct _10
{
    uint _m0;
    uint4 _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float4 _m5[73];
    int4 _m6;
    int _m7;
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    texture2d<float> vp_t_tcb_8 [[id(1)]];
    sampler vp_t_tcb_8Smplr [[id(2)]];
};

struct main0_out
{
    float4 m_24 [[user(locn0)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_21 [[attribute(0)]];
};

static inline __attribute__((always_inline))
int _37(thread const int& _268, thread const int& _269, constant _10& support_buffer)
{
    float _272 = as_type<float>(support_buffer._m4);
    int _274 = _269 + as_type<int>(_272);
    int _276 = 1 + _274;
    float _278 = support_buffer._m5[_276].x;
    float _280 = abs(_278);
    bool _282 = _280 == 1.0;
    if (_282)
    {
        return _268;
    }
    float _284 = float(_268);
    float _286 = _284 / _280;
    int _288 = int(_286);
    return _288;
}

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_24 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    int _40 = int2(spvDescriptorSet0.vp_t_tcb_8.get_width(), spvDescriptorSet0.vp_t_tcb_8.get_height()).x;
    int _42 = _40;
    int _44 = 0;
    int _46 = _37(_42, _44, (*spvDescriptorSet0.support_buffer));
    int _48 = int2(spvDescriptorSet0.vp_t_tcb_8.get_width(), spvDescriptorSet0.vp_t_tcb_8.get_height()).y;
    int _50 = _48;
    int _52 = 0;
    int _54 = _37(_50, _52, (*spvDescriptorSet0.support_buffer));
    float _57 = in.m_21.x;
    float _59 = in.m_21.y;
    bool _63 = _57 > 0.0;
    float _65 = _57 * 2.0;
    bool _67 = _57 >= 0.0;
    bool _69 = isnan(_57);
    bool _71 = _67 || _69;
    bool _73 = isnan(0.0);
    bool _75 = _71 || _73;
    float _77 = _59 * 2.0;
    bool _79 = _59 >= 0.0;
    bool _81 = isnan(_59);
    bool _83 = _79 || _81;
    bool _85 = isnan(0.0);
    bool _87 = _83 || _85;
    int _89 = _75 ? 0 : 1;
    bool _91 = _59 > 0.0;
    out.gl_Position.x = _65;
    out.gl_Position.y = _77;
    int _93 = ~_89;
    int _95 = _93 + 1;
    int _97 = _95 + 1;
    int _99 = _97;
    if (!_63)
    {
        int _101 = -_89;
        _99 = _101;
    }
    int _103 = _99;
    bool _105 = !_91;
    int _107 = _105 ? 0 : 1;
    int _109 = ~_107;
    int _111 = _109 + 1;
    int _113 = _111 + 1;
    int _115 = _113;
    if (_87)
    {
        int _117 = -_107;
        _115 = _117;
    }
    int _119 = _115;
    float _121 = float(_103);
    float _123 = float(_119);
    float _125 = _121 + 1.0;
    float _127 = _123 + 1.0;
    float _129 = float(_46);
    float _131 = float(_54);
    float _133 = 1.0 / _129;
    float _135 = 1.0 / _131;
    float _137 = fma(_133, -0.00999999977648258209228515625, _125);
    float _139 = fma(_135, -0.00999999977648258209228515625, _127);
    out.m_24.x = _137;
    out.m_24.y = _139;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_24 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    int _40 = int2(spvDescriptorSet0.vp_t_tcb_8.get_width(), spvDescriptorSet0.vp_t_tcb_8.get_height()).x;
    int _42 = _40;
    int _44 = 0;
    int _46 = _37(_42, _44, (*spvDescriptorSet0.support_buffer));
    int _48 = int2(spvDescriptorSet0.vp_t_tcb_8.get_width(), spvDescriptorSet0.vp_t_tcb_8.get_height()).y;
    int _50 = _48;
    int _52 = 0;
    int _54 = _37(_50, _52, (*spvDescriptorSet0.support_buffer));
    float _57 = in.m_21.x;
    float _59 = in.m_21.y;
    bool _63 = _57 > 0.0;
    float _65 = _57 * 2.0;
    bool _67 = _57 >= 0.0;
    bool _69 = isnan(_57);
    bool _71 = _67 || _69;
    bool _73 = isnan(0.0);
    bool _75 = _71 || _73;
    float _77 = _59 * 2.0;
    bool _79 = _59 >= 0.0;
    bool _81 = isnan(_59);
    bool _83 = _79 || _81;
    bool _85 = isnan(0.0);
    bool _87 = _83 || _85;
    int _89 = _75 ? 0 : 1;
    bool _91 = _59 > 0.0;
    out.gl_Position.x = _65;
    out.gl_Position.y = _77;
    int _93 = ~_89;
    int _95 = _93 + 1;
    int _97 = _95 + 1;
    int _99 = _97;
    if (!_63)
    {
        int _101 = -_89;
        _99 = _101;
    }
    int _103 = _99;
    bool _105 = !_91;
    int _107 = _105 ? 0 : 1;
    int _109 = ~_107;
    int _111 = _109 + 1;
    int _113 = _111 + 1;
    int _115 = _113;
    if (_87)
    {
        int _117 = -_107;
        _115 = _117;
    }
    int _119 = _115;
    float _121 = float(_103);
    float _123 = float(_119);
    float _125 = _121 + 1.0;
    float _127 = _123 + 1.0;
    float _129 = float(_46);
    float _131 = float(_54);
    float _133 = 1.0 / _129;
    float _135 = 1.0 / _131;
    float _137 = fma(_133, -0.00999999977648258209228515625, _125);
    float _139 = fma(_135, -0.00999999977648258209228515625, _127);
    out.m_24.x = _137;
    out.m_24.y = _139;
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
    out.m_24 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    int _40 = int2(spvDescriptorSet0.vp_t_tcb_8.get_width(), spvDescriptorSet0.vp_t_tcb_8.get_height()).x;
    int _42 = _40;
    int _44 = 0;
    int _46 = _37(_42, _44, (*spvDescriptorSet0.support_buffer));
    int _48 = int2(spvDescriptorSet0.vp_t_tcb_8.get_width(), spvDescriptorSet0.vp_t_tcb_8.get_height()).y;
    int _50 = _48;
    int _52 = 0;
    int _54 = _37(_50, _52, (*spvDescriptorSet0.support_buffer));
    float _57 = in.m_21.x;
    float _59 = in.m_21.y;
    bool _63 = _57 > 0.0;
    float _65 = _57 * 2.0;
    bool _67 = _57 >= 0.0;
    bool _69 = isnan(_57);
    bool _71 = _67 || _69;
    bool _73 = isnan(0.0);
    bool _75 = _71 || _73;
    float _77 = _59 * 2.0;
    bool _79 = _59 >= 0.0;
    bool _81 = isnan(_59);
    bool _83 = _79 || _81;
    bool _85 = isnan(0.0);
    bool _87 = _83 || _85;
    int _89 = _75 ? 0 : 1;
    bool _91 = _59 > 0.0;
    out.gl_Position.x = _65;
    out.gl_Position.y = _77;
    int _93 = ~_89;
    int _95 = _93 + 1;
    int _97 = _95 + 1;
    int _99 = _97;
    if (!_63)
    {
        int _101 = -_89;
        _99 = _101;
    }
    int _103 = _99;
    bool _105 = !_91;
    int _107 = _105 ? 0 : 1;
    int _109 = ~_107;
    int _111 = _109 + 1;
    int _113 = _111 + 1;
    int _115 = _113;
    if (_87)
    {
        int _117 = -_107;
        _115 = _117;
    }
    int _119 = _115;
    float _121 = float(_103);
    float _123 = float(_119);
    float _125 = _121 + 1.0;
    float _127 = _123 + 1.0;
    float _129 = float(_46);
    float _131 = float(_54);
    float _133 = 1.0 / _129;
    float _135 = 1.0 / _131;
    float _137 = fma(_133, -0.00999999977648258209228515625, _125);
    float _139 = fma(_135, -0.00999999977648258209228515625, _127);
    out.m_24.x = _137;
    out.m_24.y = _139;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_24.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_24.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_24.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_24.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

