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

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* vp_c3 [[id(1)]];
    texture2d<float> vp_t_tcb_A [[id(2)]];
    sampler vp_t_tcb_ASmplr [[id(3)]];
    texture2d<float> vp_t_tcb_8 [[id(4)]];
    sampler vp_t_tcb_8Smplr [[id(5)]];
};

struct main0_out
{
    float4 m_34 [[user(locn0)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_29 [[attribute(0)]];
    float4 m_31 [[attribute(1)]];
};

static inline __attribute__((always_inline))
int _47(thread const int& _318, thread const int& _319, constant _10& support_buffer)
{
    float _322 = as_type<float>(support_buffer._m4);
    int _324 = _319 + as_type<int>(_322);
    int _326 = 1 + _324;
    float _328 = support_buffer._m5[_326].x;
    float _330 = abs(_328);
    bool _332 = _330 == 1.0;
    if (_332)
    {
        return _318;
    }
    float _334 = float(_318);
    float _336 = _334 / _330;
    int _338 = int(_336);
    return _338;
}

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_34 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    int _50 = int2(spvDescriptorSet0.vp_t_tcb_A.get_width(), spvDescriptorSet0.vp_t_tcb_A.get_height()).x;
    int _52 = _50;
    int _54 = 0;
    int _56 = _47(_52, _54, (*spvDescriptorSet0.support_buffer));
    int _58 = int2(spvDescriptorSet0.vp_t_tcb_A.get_width(), spvDescriptorSet0.vp_t_tcb_A.get_height()).y;
    int _60 = _58;
    int _62 = 0;
    int _64 = _47(_60, _62, (*spvDescriptorSet0.support_buffer));
    int _66 = int2(spvDescriptorSet0.vp_t_tcb_8.get_width(), spvDescriptorSet0.vp_t_tcb_8.get_height()).x;
    int _68 = _66;
    int _70 = 1;
    int _72 = _47(_68, _70, (*spvDescriptorSet0.support_buffer));
    int _74 = int2(spvDescriptorSet0.vp_t_tcb_8.get_width(), spvDescriptorSet0.vp_t_tcb_8.get_height()).y;
    int _76 = _74;
    int _78 = 1;
    int _80 = _47(_76, _78, (*spvDescriptorSet0.support_buffer));
    float _83 = in.m_29.x;
    float _85 = in.m_29.y;
    float _87 = in.m_31.x;
    float _89 = in.m_31.y;
    float _91 = _83 * 2.0;
    float _93 = _85 * 2.0;
    out.m_34.x = _87;
    out.gl_Position.x = _91;
    out.gl_Position.y = _93;
    out.gl_Position.z = 1.0;
    out.m_34.y = _89;
    float _95 = float(_56);
    float _97 = float(_72);
    float _99 = float(_80);
    bool _103 = _97 >= _95;
    bool _105 = isnan(_97);
    bool _107 = _103 || _105;
    bool _109 = isnan(_95);
    bool _111 = _107 || _109;
    float _113 = float(_64);
    bool _115 = _99 < _113;
    bool _117 = !_111;
    bool _119 = _115 || _117;
    float _121 = _95;
    float _123 = _99;
    float _125 = as_type<float>(_64);
    if (_119)
    {
        float _127 = 1.0 / _95;
        _121 = _127;
    }
    float _129 = _121;
    if (!_119)
    {
        _123 = _87;
    }
    float _131 = _123;
    float _133 = _131;
    if (!_119)
    {
        _125 = _89;
    }
    float _135 = _125;
    float _137 = _113;
    float _139 = _135;
    if (_119)
    {
        float _141 = 1.0 / _113;
        _137 = _141;
    }
    float _143 = _137;
    if (_119)
    {
        float _145 = fma(_129, -0.00999999977648258209228515625, _87);
        _133 = _145;
    }
    float _147 = _133;
    float _149 = fma(_147, (*spvDescriptorSet0.vp_c3)._m0[39].x, 0.5);
    if (_119)
    {
        float _151 = fma(_143, -0.00999999977648258209228515625, _89);
        _139 = _151;
    }
    float _153 = _139;
    float _155 = fma(_153, (*spvDescriptorSet0.vp_c3)._m0[39].y, 0.5);
    if (_119)
    {
        out.m_34.x = _147;
        out.m_34.y = _153;
    }
    out.m_34.z = _149;
    out.m_34.w = _155;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_34 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    int _50 = int2(spvDescriptorSet0.vp_t_tcb_A.get_width(), spvDescriptorSet0.vp_t_tcb_A.get_height()).x;
    int _52 = _50;
    int _54 = 0;
    int _56 = _47(_52, _54, (*spvDescriptorSet0.support_buffer));
    int _58 = int2(spvDescriptorSet0.vp_t_tcb_A.get_width(), spvDescriptorSet0.vp_t_tcb_A.get_height()).y;
    int _60 = _58;
    int _62 = 0;
    int _64 = _47(_60, _62, (*spvDescriptorSet0.support_buffer));
    int _66 = int2(spvDescriptorSet0.vp_t_tcb_8.get_width(), spvDescriptorSet0.vp_t_tcb_8.get_height()).x;
    int _68 = _66;
    int _70 = 1;
    int _72 = _47(_68, _70, (*spvDescriptorSet0.support_buffer));
    int _74 = int2(spvDescriptorSet0.vp_t_tcb_8.get_width(), spvDescriptorSet0.vp_t_tcb_8.get_height()).y;
    int _76 = _74;
    int _78 = 1;
    int _80 = _47(_76, _78, (*spvDescriptorSet0.support_buffer));
    float _83 = in.m_29.x;
    float _85 = in.m_29.y;
    float _87 = in.m_31.x;
    float _89 = in.m_31.y;
    float _91 = _83 * 2.0;
    float _93 = _85 * 2.0;
    out.m_34.x = _87;
    out.gl_Position.x = _91;
    out.gl_Position.y = _93;
    out.gl_Position.z = 1.0;
    out.m_34.y = _89;
    float _95 = float(_56);
    float _97 = float(_72);
    float _99 = float(_80);
    bool _103 = _97 >= _95;
    bool _105 = isnan(_97);
    bool _107 = _103 || _105;
    bool _109 = isnan(_95);
    bool _111 = _107 || _109;
    float _113 = float(_64);
    bool _115 = _99 < _113;
    bool _117 = !_111;
    bool _119 = _115 || _117;
    float _121 = _95;
    float _123 = _99;
    float _125 = as_type<float>(_64);
    if (_119)
    {
        float _127 = 1.0 / _95;
        _121 = _127;
    }
    float _129 = _121;
    if (!_119)
    {
        _123 = _87;
    }
    float _131 = _123;
    float _133 = _131;
    if (!_119)
    {
        _125 = _89;
    }
    float _135 = _125;
    float _137 = _113;
    float _139 = _135;
    if (_119)
    {
        float _141 = 1.0 / _113;
        _137 = _141;
    }
    float _143 = _137;
    if (_119)
    {
        float _145 = fma(_129, -0.00999999977648258209228515625, _87);
        _133 = _145;
    }
    float _147 = _133;
    float _149 = fma(_147, (*spvDescriptorSet0.vp_c3)._m0[39].x, 0.5);
    if (_119)
    {
        float _151 = fma(_143, -0.00999999977648258209228515625, _89);
        _139 = _151;
    }
    float _153 = _139;
    float _155 = fma(_153, (*spvDescriptorSet0.vp_c3)._m0[39].y, 0.5);
    if (_119)
    {
        out.m_34.x = _147;
        out.m_34.y = _153;
    }
    out.m_34.z = _149;
    out.m_34.w = _155;
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
    out.m_34 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    int _50 = int2(spvDescriptorSet0.vp_t_tcb_A.get_width(), spvDescriptorSet0.vp_t_tcb_A.get_height()).x;
    int _52 = _50;
    int _54 = 0;
    int _56 = _47(_52, _54, (*spvDescriptorSet0.support_buffer));
    int _58 = int2(spvDescriptorSet0.vp_t_tcb_A.get_width(), spvDescriptorSet0.vp_t_tcb_A.get_height()).y;
    int _60 = _58;
    int _62 = 0;
    int _64 = _47(_60, _62, (*spvDescriptorSet0.support_buffer));
    int _66 = int2(spvDescriptorSet0.vp_t_tcb_8.get_width(), spvDescriptorSet0.vp_t_tcb_8.get_height()).x;
    int _68 = _66;
    int _70 = 1;
    int _72 = _47(_68, _70, (*spvDescriptorSet0.support_buffer));
    int _74 = int2(spvDescriptorSet0.vp_t_tcb_8.get_width(), spvDescriptorSet0.vp_t_tcb_8.get_height()).y;
    int _76 = _74;
    int _78 = 1;
    int _80 = _47(_76, _78, (*spvDescriptorSet0.support_buffer));
    float _83 = in.m_29.x;
    float _85 = in.m_29.y;
    float _87 = in.m_31.x;
    float _89 = in.m_31.y;
    float _91 = _83 * 2.0;
    float _93 = _85 * 2.0;
    out.m_34.x = _87;
    out.gl_Position.x = _91;
    out.gl_Position.y = _93;
    out.gl_Position.z = 1.0;
    out.m_34.y = _89;
    float _95 = float(_56);
    float _97 = float(_72);
    float _99 = float(_80);
    bool _103 = _97 >= _95;
    bool _105 = isnan(_97);
    bool _107 = _103 || _105;
    bool _109 = isnan(_95);
    bool _111 = _107 || _109;
    float _113 = float(_64);
    bool _115 = _99 < _113;
    bool _117 = !_111;
    bool _119 = _115 || _117;
    float _121 = _95;
    float _123 = _99;
    float _125 = as_type<float>(_64);
    if (_119)
    {
        float _127 = 1.0 / _95;
        _121 = _127;
    }
    float _129 = _121;
    if (!_119)
    {
        _123 = _87;
    }
    float _131 = _123;
    float _133 = _131;
    if (!_119)
    {
        _125 = _89;
    }
    float _135 = _125;
    float _137 = _113;
    float _139 = _135;
    if (_119)
    {
        float _141 = 1.0 / _113;
        _137 = _141;
    }
    float _143 = _137;
    if (_119)
    {
        float _145 = fma(_129, -0.00999999977648258209228515625, _87);
        _133 = _145;
    }
    float _147 = _133;
    float _149 = fma(_147, (*spvDescriptorSet0.vp_c3)._m0[39].x, 0.5);
    if (_119)
    {
        float _151 = fma(_143, -0.00999999977648258209228515625, _89);
        _139 = _151;
    }
    float _153 = _139;
    float _155 = fma(_153, (*spvDescriptorSet0.vp_c3)._m0[39].y, 0.5);
    if (_119)
    {
        out.m_34.x = _147;
        out.m_34.y = _153;
    }
    out.m_34.z = _149;
    out.m_34.w = _155;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_34.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_34.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_34.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_34.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

