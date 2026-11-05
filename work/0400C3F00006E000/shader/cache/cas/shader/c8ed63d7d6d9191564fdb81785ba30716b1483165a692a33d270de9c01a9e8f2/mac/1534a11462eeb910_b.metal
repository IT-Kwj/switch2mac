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
    texture2d<float> vp_t_tcb_8 [[id(2)]];
    sampler vp_t_tcb_8Smplr [[id(3)]];
};

struct main0_out
{
    float4 m_34 [[user(locn0)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

static inline __attribute__((always_inline))
int _47(thread const int& _455, thread const int& _456, constant _10& support_buffer)
{
    float _459 = as_type<float>(support_buffer._m4);
    int _461 = _456 + as_type<int>(_459);
    int _463 = 1 + _461;
    float _465 = support_buffer._m5[_463].x;
    float _467 = abs(_465);
    bool _469 = _467 == 1.0;
    if (_469)
    {
        return _455;
    }
    float _471 = float(_455);
    float _473 = _471 / _467;
    int _475 = int(_473);
    return _475;
}

vertex main0_out main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_InstanceIndex [[instance_id]], uint gl_BaseInstance [[base_instance]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_34 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    int _50 = int2(spvDescriptorSet0.vp_t_tcb_8.get_width(), spvDescriptorSet0.vp_t_tcb_8.get_height()).x;
    int _52 = _50;
    int _54 = 0;
    int _56 = _47(_52, _54, (*spvDescriptorSet0.support_buffer));
    int _58 = int2(spvDescriptorSet0.vp_t_tcb_8.get_width(), spvDescriptorSet0.vp_t_tcb_8.get_height()).y;
    int _60 = _58;
    int _62 = 0;
    int _64 = _47(_60, _62, (*spvDescriptorSet0.support_buffer));
    float _67 = as_type<float>(int(gl_InstanceIndex));
    float _69 = as_type<float>(int(gl_BaseInstance));
    int _71 = as_type<int>(_67) - as_type<int>(_69);
    int _73 = abs(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[6].z));
    float _75 = float(uint(_73));
    int _77 = -_73;
    int _79 = -_73;
    float _81 = 1.0 / _75;
    int _83 = abs(_71);
    float _85 = float(uint(_83));
    int _87 = as_type<int>(_81) + (-2);
    float _89 = as_type<float>(int(gl_VertexIndex));
    float _91 = as_type<float>(_87) * _85;
    float _93 = trunc(_91);
    float _95 = precise::max(_93, 0.0);
    uint _98 = uint(_95);
    int _100 = _77 * int(_98);
    int _102 = _100 + _83;
    float _104 = float(uint(_102));
    float _106 = as_type<float>(_87) * _104;
    float _108 = trunc(_106);
    float _110 = precise::max(_108, 0.0);
    uint _112 = uint(_110);
    int _114 = int(_98) + int(_112);
    int _116 = _79 * _114;
    int _118 = _116 + _83;
    bool _122 = uint(_118) >= uint(_73);
    int _124 = _71 ^ as_type<int>((*spvDescriptorSet0.vp_c3)._m0[6].z);
    bool _126 = !_122;
    int _128 = _126 ? 0 : (-1);
    uint _130 = uint(int(uint(_124) >> uint(31)));
    bool _132 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[6].z) == 0;
    int _134 = -_128;
    int _136 = _114 + _134;
    int _138 = ~int(_130);
    int _140 = _138 + 1;
    int _142 = as_type<int>(_89) >> 31;
    int _144 = _136 ^ _140;
    float _146 = float(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[6].w));
    int _148 = _142 & 1;
    int _150 = -_140;
    int _152 = _144 + _150;
    float _154 = float(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[6].z));
    float _156 = 1.0 / _146;
    int _158 = as_type<int>(_89) + _148;
    bool _160 = !_132;
    int _162 = _160 ? _152 : (-1);
    int _164 = as_type<int>(_89) & 1;
    int _166 = _158 >> 1;
    int _168 = -_162;
    float _170 = 1.0 / _154;
    float _172 = float(_164);
    int _174 = _168 * as_type<int>((*spvDescriptorSet0.vp_c3)._m0[6].z);
    int _176 = _174 + _71;
    float _178 = float(_166);
    float _180 = float(_162);
    float _182 = float(_176);
    float _184 = _178 + _180;
    float _186 = _156 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    float _188 = _172 + _182;
    float _190 = _170 * (*spvDescriptorSet0.vp_c3)._m0[7].x;
    float _192 = _186 * _184;
    float _194 = _190 * _188;
    float _196 = fma(_192, -2.0, 1.0);
    float _198 = fma(_194, 2.0, -1.0);
    out.gl_Position.x = _198;
    out.gl_Position.y = _196;
    out.gl_Position.z = -1.0;
    float _200 = float(_64);
    float _202 = float(_56);
    float _204 = 1.0 / _200;
    float _206 = 1.0 / _202;
    float _208 = fma(_204, -0.00999999977648258209228515625, _192);
    float _210 = fma(_206, -0.00999999977648258209228515625, _194);
    out.m_34.x = _210;
    out.m_34.y = _208;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_InstanceIndex [[instance_id]], uint gl_BaseInstance [[base_instance]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_34 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    int _50 = int2(spvDescriptorSet0.vp_t_tcb_8.get_width(), spvDescriptorSet0.vp_t_tcb_8.get_height()).x;
    int _52 = _50;
    int _54 = 0;
    int _56 = _47(_52, _54, (*spvDescriptorSet0.support_buffer));
    int _58 = int2(spvDescriptorSet0.vp_t_tcb_8.get_width(), spvDescriptorSet0.vp_t_tcb_8.get_height()).y;
    int _60 = _58;
    int _62 = 0;
    int _64 = _47(_60, _62, (*spvDescriptorSet0.support_buffer));
    float _67 = as_type<float>(int(gl_InstanceIndex));
    float _69 = as_type<float>(int(gl_BaseInstance));
    int _71 = as_type<int>(_67) - as_type<int>(_69);
    int _73 = abs(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[6].z));
    float _75 = float(uint(_73));
    int _77 = -_73;
    int _79 = -_73;
    float _81 = 1.0 / _75;
    int _83 = abs(_71);
    float _85 = float(uint(_83));
    int _87 = as_type<int>(_81) + (-2);
    float _89 = as_type<float>(int(gl_VertexIndex));
    float _91 = as_type<float>(_87) * _85;
    float _93 = trunc(_91);
    float _95 = precise::max(_93, 0.0);
    uint _98 = uint(_95);
    int _100 = _77 * int(_98);
    int _102 = _100 + _83;
    float _104 = float(uint(_102));
    float _106 = as_type<float>(_87) * _104;
    float _108 = trunc(_106);
    float _110 = precise::max(_108, 0.0);
    uint _112 = uint(_110);
    int _114 = int(_98) + int(_112);
    int _116 = _79 * _114;
    int _118 = _116 + _83;
    bool _122 = uint(_118) >= uint(_73);
    int _124 = _71 ^ as_type<int>((*spvDescriptorSet0.vp_c3)._m0[6].z);
    bool _126 = !_122;
    int _128 = _126 ? 0 : (-1);
    uint _130 = uint(int(uint(_124) >> uint(31)));
    bool _132 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[6].z) == 0;
    int _134 = -_128;
    int _136 = _114 + _134;
    int _138 = ~int(_130);
    int _140 = _138 + 1;
    int _142 = as_type<int>(_89) >> 31;
    int _144 = _136 ^ _140;
    float _146 = float(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[6].w));
    int _148 = _142 & 1;
    int _150 = -_140;
    int _152 = _144 + _150;
    float _154 = float(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[6].z));
    float _156 = 1.0 / _146;
    int _158 = as_type<int>(_89) + _148;
    bool _160 = !_132;
    int _162 = _160 ? _152 : (-1);
    int _164 = as_type<int>(_89) & 1;
    int _166 = _158 >> 1;
    int _168 = -_162;
    float _170 = 1.0 / _154;
    float _172 = float(_164);
    int _174 = _168 * as_type<int>((*spvDescriptorSet0.vp_c3)._m0[6].z);
    int _176 = _174 + _71;
    float _178 = float(_166);
    float _180 = float(_162);
    float _182 = float(_176);
    float _184 = _178 + _180;
    float _186 = _156 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    float _188 = _172 + _182;
    float _190 = _170 * (*spvDescriptorSet0.vp_c3)._m0[7].x;
    float _192 = _186 * _184;
    float _194 = _190 * _188;
    float _196 = fma(_192, -2.0, 1.0);
    float _198 = fma(_194, 2.0, -1.0);
    out.gl_Position.x = _198;
    out.gl_Position.y = _196;
    out.gl_Position.z = -1.0;
    float _200 = float(_64);
    float _202 = float(_56);
    float _204 = 1.0 / _200;
    float _206 = 1.0 / _202;
    float _208 = fma(_204, -0.00999999977648258209228515625, _192);
    float _210 = fma(_206, -0.00999999977648258209228515625, _194);
    out.m_34.x = _210;
    out.m_34.y = _208;
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
    out.m_34 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    int _50 = int2(spvDescriptorSet0.vp_t_tcb_8.get_width(), spvDescriptorSet0.vp_t_tcb_8.get_height()).x;
    int _52 = _50;
    int _54 = 0;
    int _56 = _47(_52, _54, (*spvDescriptorSet0.support_buffer));
    int _58 = int2(spvDescriptorSet0.vp_t_tcb_8.get_width(), spvDescriptorSet0.vp_t_tcb_8.get_height()).y;
    int _60 = _58;
    int _62 = 0;
    int _64 = _47(_60, _62, (*spvDescriptorSet0.support_buffer));
    float _67 = as_type<float>(int(gl_InstanceIndex));
    float _69 = as_type<float>(int(gl_BaseInstance));
    int _71 = as_type<int>(_67) - as_type<int>(_69);
    int _73 = abs(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[6].z));
    float _75 = float(uint(_73));
    int _77 = -_73;
    int _79 = -_73;
    float _81 = 1.0 / _75;
    int _83 = abs(_71);
    float _85 = float(uint(_83));
    int _87 = as_type<int>(_81) + (-2);
    float _89 = as_type<float>(int(gl_VertexIndex));
    float _91 = as_type<float>(_87) * _85;
    float _93 = trunc(_91);
    float _95 = precise::max(_93, 0.0);
    uint _98 = uint(_95);
    int _100 = _77 * int(_98);
    int _102 = _100 + _83;
    float _104 = float(uint(_102));
    float _106 = as_type<float>(_87) * _104;
    float _108 = trunc(_106);
    float _110 = precise::max(_108, 0.0);
    uint _112 = uint(_110);
    int _114 = int(_98) + int(_112);
    int _116 = _79 * _114;
    int _118 = _116 + _83;
    bool _122 = uint(_118) >= uint(_73);
    int _124 = _71 ^ as_type<int>((*spvDescriptorSet0.vp_c3)._m0[6].z);
    bool _126 = !_122;
    int _128 = _126 ? 0 : (-1);
    uint _130 = uint(int(uint(_124) >> uint(31)));
    bool _132 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[6].z) == 0;
    int _134 = -_128;
    int _136 = _114 + _134;
    int _138 = ~int(_130);
    int _140 = _138 + 1;
    int _142 = as_type<int>(_89) >> 31;
    int _144 = _136 ^ _140;
    float _146 = float(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[6].w));
    int _148 = _142 & 1;
    int _150 = -_140;
    int _152 = _144 + _150;
    float _154 = float(as_type<int>((*spvDescriptorSet0.vp_c3)._m0[6].z));
    float _156 = 1.0 / _146;
    int _158 = as_type<int>(_89) + _148;
    bool _160 = !_132;
    int _162 = _160 ? _152 : (-1);
    int _164 = as_type<int>(_89) & 1;
    int _166 = _158 >> 1;
    int _168 = -_162;
    float _170 = 1.0 / _154;
    float _172 = float(_164);
    int _174 = _168 * as_type<int>((*spvDescriptorSet0.vp_c3)._m0[6].z);
    int _176 = _174 + _71;
    float _178 = float(_166);
    float _180 = float(_162);
    float _182 = float(_176);
    float _184 = _178 + _180;
    float _186 = _156 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    float _188 = _172 + _182;
    float _190 = _170 * (*spvDescriptorSet0.vp_c3)._m0[7].x;
    float _192 = _186 * _184;
    float _194 = _190 * _188;
    float _196 = fma(_192, -2.0, 1.0);
    float _198 = fma(_194, 2.0, -1.0);
    out.gl_Position.x = _198;
    out.gl_Position.y = _196;
    out.gl_Position.z = -1.0;
    float _200 = float(_64);
    float _202 = float(_56);
    float _204 = 1.0 / _200;
    float _206 = 1.0 / _202;
    float _208 = fma(_204, -0.00999999977648258209228515625, _192);
    float _210 = fma(_206, -0.00999999977648258209228515625, _194);
    out.m_34.x = _210;
    out.m_34.y = _208;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_34.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_34.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_34.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_34.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

