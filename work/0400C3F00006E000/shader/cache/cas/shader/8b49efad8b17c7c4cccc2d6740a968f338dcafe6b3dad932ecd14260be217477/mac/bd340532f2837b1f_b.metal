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

struct _313
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
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

vertex main0_out main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    bool _66 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    bool _37 = 0.0 != (*spvDescriptorSet0.vp_c3)._m0[4].w;
    bool _39 = isnan(0.0);
    bool _41 = _37 || _39;
    bool _43 = isnan((*spvDescriptorSet0.vp_c3)._m0[4].w);
    bool _45 = _41 || _43;
    float _62;
    float _64;
    if (!_45)
    {
        float _48 = as_type<float>(int(gl_VertexIndex));
        bool _50 = as_type<int>(_48) != 0;
        float _52 = 0.0;
        float _54 = 0.0;
        if (!_50)
        {
            _52 = 0.0;
            _54 = 0.0;
        }
        float _56 = _52;
        float _58 = _54;
        bool _60 = !_50;
        _62 = _56;
        _64 = _58;
        _66 = _60;
        if (!_66)
        {
            int _69 = as_type<int>(_48) + (-1);
            float _71 = float(_69);
            float _73 = fma(_71, (*spvDescriptorSet0.vp_c3)._m0[4].z, (*spvDescriptorSet0.vp_c3)._m0[4].x);
            float _75 = _73 * 0.15915493667125701904296875;
            float _77 = _75 * 6.283185482025146484375;
            float _79 = cos(_77);
            float _81 = _75 * 6.283185482025146484375;
            float _83 = sin(_81);
            float _85 = _79 * (-0.5);
            float _87 = _83 * 0.5;
            _62 = _87;
            _64 = _85;
            _66 = true;
        }
    }
    else
    {
        float _89 = as_type<float>(int(gl_VertexIndex));
        uint _92 = (spvMulExtended<_313, uint>(as_type<uint>(_89), 2863311531u))._m1;
        uint _94 = uint(int(uint(int(_92)) >> uint(1)));
        int _96 = int(_94) * (-3);
        int _98 = _96 + as_type<int>(_89);
        bool _100 = _98 != 0;
        float _102 = as_type<float>(_94);
        float _104 = 0.0;
        if (!_100)
        {
            _102 = 0.0;
            _104 = 0.0;
        }
        float _106 = _102;
        float _108 = _104;
        bool _110 = !_100;
        _62 = _106;
        _64 = _108;
        if (!_110)
        {
            int _112 = abs(as_type<int>(_89));
            float _114 = float(uint(_112));
            float _116 = _114 * 0.3333332836627960205078125;
            float _118 = trunc(_116);
            float _120 = precise::max(_118, 0.0);
            uint _122 = uint(_120);
            int _124 = int(_122) * (-3);
            int _126 = _124 + _112;
            float _128 = float(uint(_126));
            float _130 = _128 * 0.3333332836627960205078125;
            float _132 = trunc(_130);
            float _134 = precise::max(_132, 0.0);
            uint _136 = uint(_134);
            int _138 = int(_122) + int(_136);
            int _140 = as_type<int>(_89) ^ 3;
            int _142 = _138 * (-3);
            int _144 = _142 + _112;
            uint _146 = uint(int(uint(_140) >> uint(31)));
            bool _148 = uint(_144) >= 3u;
            int _150 = ~int(_146);
            int _152 = _150 + 1;
            bool _154 = !_148;
            int _156 = _154 ? 0 : (-1);
            bool _158 = _98 != 1;
            int _160 = ~_156;
            int _162 = _138 + _160;
            int _164 = _162 + 1;
            int _166 = _164 ^ _152;
            int _168 = ~_152;
            int _170 = _168 + _166;
            int _172 = _170 + 1;
            int _174 = _172 + 1;
            int _176 = _174;
            if (!_158)
            {
                _176 = _172;
            }
            int _178 = _176;
            float _180 = float(_178);
            float _182 = fma(_180, (*spvDescriptorSet0.vp_c3)._m0[4].z, (*spvDescriptorSet0.vp_c3)._m0[4].x);
            float _184 = _182 * 0.15915493667125701904296875;
            float _186 = _184 * 6.283185482025146484375;
            float _188 = cos(_186);
            float _190 = _184 * 6.283185482025146484375;
            float _192 = sin(_190);
            float _194 = _188 * (-0.5);
            float _196 = _192 * 0.5;
            _62 = _196;
            _64 = _194;
        }
    }
    _66 = false;
    float _198 = _62;
    float _200 = _64;
    float _202 = _198 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _204 = _198 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _206 = _198 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _208 = _198 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _210 = fma(_200, (*spvDescriptorSet0.vp_c3)._m0[0].x, _202);
    float _212 = fma(_200, (*spvDescriptorSet0.vp_c3)._m0[1].x, _204);
    float _214 = fma(_200, (*spvDescriptorSet0.vp_c3)._m0[2].x, _206);
    float _216 = fma(_200, (*spvDescriptorSet0.vp_c3)._m0[3].x, _208);
    float _218 = _210 + (*spvDescriptorSet0.vp_c3)._m0[0].w;
    float _220 = _212 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _222 = _214 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _224 = _216 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    out.gl_Position.x = _218;
    out.gl_Position.y = _220;
    out.gl_Position.z = _222;
    out.gl_Position.w = _224;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    bool _66 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    bool _37 = 0.0 != (*spvDescriptorSet0.vp_c3)._m0[4].w;
    bool _39 = isnan(0.0);
    bool _41 = _37 || _39;
    bool _43 = isnan((*spvDescriptorSet0.vp_c3)._m0[4].w);
    bool _45 = _41 || _43;
    float _62;
    float _64;
    if (!_45)
    {
        float _48 = as_type<float>(int(gl_VertexIndex));
        bool _50 = as_type<int>(_48) != 0;
        float _52 = 0.0;
        float _54 = 0.0;
        if (!_50)
        {
            _52 = 0.0;
            _54 = 0.0;
        }
        float _56 = _52;
        float _58 = _54;
        bool _60 = !_50;
        _62 = _56;
        _64 = _58;
        _66 = _60;
        if (!_66)
        {
            int _69 = as_type<int>(_48) + (-1);
            float _71 = float(_69);
            float _73 = fma(_71, (*spvDescriptorSet0.vp_c3)._m0[4].z, (*spvDescriptorSet0.vp_c3)._m0[4].x);
            float _75 = _73 * 0.15915493667125701904296875;
            float _77 = _75 * 6.283185482025146484375;
            float _79 = cos(_77);
            float _81 = _75 * 6.283185482025146484375;
            float _83 = sin(_81);
            float _85 = _79 * (-0.5);
            float _87 = _83 * 0.5;
            _62 = _87;
            _64 = _85;
            _66 = true;
        }
    }
    else
    {
        float _89 = as_type<float>(int(gl_VertexIndex));
        uint _92 = (spvMulExtended<_313, uint>(as_type<uint>(_89), 2863311531u))._m1;
        uint _94 = uint(int(uint(int(_92)) >> uint(1)));
        int _96 = int(_94) * (-3);
        int _98 = _96 + as_type<int>(_89);
        bool _100 = _98 != 0;
        float _102 = as_type<float>(_94);
        float _104 = 0.0;
        if (!_100)
        {
            _102 = 0.0;
            _104 = 0.0;
        }
        float _106 = _102;
        float _108 = _104;
        bool _110 = !_100;
        _62 = _106;
        _64 = _108;
        if (!_110)
        {
            int _112 = abs(as_type<int>(_89));
            float _114 = float(uint(_112));
            float _116 = _114 * 0.3333332836627960205078125;
            float _118 = trunc(_116);
            float _120 = precise::max(_118, 0.0);
            uint _122 = uint(_120);
            int _124 = int(_122) * (-3);
            int _126 = _124 + _112;
            float _128 = float(uint(_126));
            float _130 = _128 * 0.3333332836627960205078125;
            float _132 = trunc(_130);
            float _134 = precise::max(_132, 0.0);
            uint _136 = uint(_134);
            int _138 = int(_122) + int(_136);
            int _140 = as_type<int>(_89) ^ 3;
            int _142 = _138 * (-3);
            int _144 = _142 + _112;
            uint _146 = uint(int(uint(_140) >> uint(31)));
            bool _148 = uint(_144) >= 3u;
            int _150 = ~int(_146);
            int _152 = _150 + 1;
            bool _154 = !_148;
            int _156 = _154 ? 0 : (-1);
            bool _158 = _98 != 1;
            int _160 = ~_156;
            int _162 = _138 + _160;
            int _164 = _162 + 1;
            int _166 = _164 ^ _152;
            int _168 = ~_152;
            int _170 = _168 + _166;
            int _172 = _170 + 1;
            int _174 = _172 + 1;
            int _176 = _174;
            if (!_158)
            {
                _176 = _172;
            }
            int _178 = _176;
            float _180 = float(_178);
            float _182 = fma(_180, (*spvDescriptorSet0.vp_c3)._m0[4].z, (*spvDescriptorSet0.vp_c3)._m0[4].x);
            float _184 = _182 * 0.15915493667125701904296875;
            float _186 = _184 * 6.283185482025146484375;
            float _188 = cos(_186);
            float _190 = _184 * 6.283185482025146484375;
            float _192 = sin(_190);
            float _194 = _188 * (-0.5);
            float _196 = _192 * 0.5;
            _62 = _196;
            _64 = _194;
        }
    }
    _66 = false;
    float _198 = _62;
    float _200 = _64;
    float _202 = _198 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _204 = _198 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _206 = _198 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _208 = _198 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _210 = fma(_200, (*spvDescriptorSet0.vp_c3)._m0[0].x, _202);
    float _212 = fma(_200, (*spvDescriptorSet0.vp_c3)._m0[1].x, _204);
    float _214 = fma(_200, (*spvDescriptorSet0.vp_c3)._m0[2].x, _206);
    float _216 = fma(_200, (*spvDescriptorSet0.vp_c3)._m0[3].x, _208);
    float _218 = _210 + (*spvDescriptorSet0.vp_c3)._m0[0].w;
    float _220 = _212 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _222 = _214 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _224 = _216 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    out.gl_Position.x = _218;
    out.gl_Position.y = _220;
    out.gl_Position.z = _222;
    out.gl_Position.w = _224;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint dm_vid = gl_VertexIndex;
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    bool _66 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    bool _37 = 0.0 != (*spvDescriptorSet0.vp_c3)._m0[4].w;
    bool _39 = isnan(0.0);
    bool _41 = _37 || _39;
    bool _43 = isnan((*spvDescriptorSet0.vp_c3)._m0[4].w);
    bool _45 = _41 || _43;
    float _62;
    float _64;
    if (!_45)
    {
        float _48 = as_type<float>(int(gl_VertexIndex));
        bool _50 = as_type<int>(_48) != 0;
        float _52 = 0.0;
        float _54 = 0.0;
        if (!_50)
        {
            _52 = 0.0;
            _54 = 0.0;
        }
        float _56 = _52;
        float _58 = _54;
        bool _60 = !_50;
        _62 = _56;
        _64 = _58;
        _66 = _60;
        if (!_66)
        {
            int _69 = as_type<int>(_48) + (-1);
            float _71 = float(_69);
            float _73 = fma(_71, (*spvDescriptorSet0.vp_c3)._m0[4].z, (*spvDescriptorSet0.vp_c3)._m0[4].x);
            float _75 = _73 * 0.15915493667125701904296875;
            float _77 = _75 * 6.283185482025146484375;
            float _79 = cos(_77);
            float _81 = _75 * 6.283185482025146484375;
            float _83 = sin(_81);
            float _85 = _79 * (-0.5);
            float _87 = _83 * 0.5;
            _62 = _87;
            _64 = _85;
            _66 = true;
        }
    }
    else
    {
        float _89 = as_type<float>(int(gl_VertexIndex));
        uint _92 = (spvMulExtended<_313, uint>(as_type<uint>(_89), 2863311531u))._m1;
        uint _94 = uint(int(uint(int(_92)) >> uint(1)));
        int _96 = int(_94) * (-3);
        int _98 = _96 + as_type<int>(_89);
        bool _100 = _98 != 0;
        float _102 = as_type<float>(_94);
        float _104 = 0.0;
        if (!_100)
        {
            _102 = 0.0;
            _104 = 0.0;
        }
        float _106 = _102;
        float _108 = _104;
        bool _110 = !_100;
        _62 = _106;
        _64 = _108;
        if (!_110)
        {
            int _112 = abs(as_type<int>(_89));
            float _114 = float(uint(_112));
            float _116 = _114 * 0.3333332836627960205078125;
            float _118 = trunc(_116);
            float _120 = precise::max(_118, 0.0);
            uint _122 = uint(_120);
            int _124 = int(_122) * (-3);
            int _126 = _124 + _112;
            float _128 = float(uint(_126));
            float _130 = _128 * 0.3333332836627960205078125;
            float _132 = trunc(_130);
            float _134 = precise::max(_132, 0.0);
            uint _136 = uint(_134);
            int _138 = int(_122) + int(_136);
            int _140 = as_type<int>(_89) ^ 3;
            int _142 = _138 * (-3);
            int _144 = _142 + _112;
            uint _146 = uint(int(uint(_140) >> uint(31)));
            bool _148 = uint(_144) >= 3u;
            int _150 = ~int(_146);
            int _152 = _150 + 1;
            bool _154 = !_148;
            int _156 = _154 ? 0 : (-1);
            bool _158 = _98 != 1;
            int _160 = ~_156;
            int _162 = _138 + _160;
            int _164 = _162 + 1;
            int _166 = _164 ^ _152;
            int _168 = ~_152;
            int _170 = _168 + _166;
            int _172 = _170 + 1;
            int _174 = _172 + 1;
            int _176 = _174;
            if (!_158)
            {
                _176 = _172;
            }
            int _178 = _176;
            float _180 = float(_178);
            float _182 = fma(_180, (*spvDescriptorSet0.vp_c3)._m0[4].z, (*spvDescriptorSet0.vp_c3)._m0[4].x);
            float _184 = _182 * 0.15915493667125701904296875;
            float _186 = _184 * 6.283185482025146484375;
            float _188 = cos(_186);
            float _190 = _184 * 6.283185482025146484375;
            float _192 = sin(_190);
            float _194 = _188 * (-0.5);
            float _196 = _192 * 0.5;
            _62 = _196;
            _64 = _194;
        }
    }
    _66 = false;
    float _198 = _62;
    float _200 = _64;
    float _202 = _198 * (*spvDescriptorSet0.vp_c3)._m0[0].y;
    float _204 = _198 * (*spvDescriptorSet0.vp_c3)._m0[1].y;
    float _206 = _198 * (*spvDescriptorSet0.vp_c3)._m0[2].y;
    float _208 = _198 * (*spvDescriptorSet0.vp_c3)._m0[3].y;
    float _210 = fma(_200, (*spvDescriptorSet0.vp_c3)._m0[0].x, _202);
    float _212 = fma(_200, (*spvDescriptorSet0.vp_c3)._m0[1].x, _204);
    float _214 = fma(_200, (*spvDescriptorSet0.vp_c3)._m0[2].x, _206);
    float _216 = fma(_200, (*spvDescriptorSet0.vp_c3)._m0[3].x, _208);
    float _218 = _210 + (*spvDescriptorSet0.vp_c3)._m0[0].w;
    float _220 = _212 + (*spvDescriptorSet0.vp_c3)._m0[1].w;
    float _222 = _214 + (*spvDescriptorSet0.vp_c3)._m0[2].w;
    float _224 = _216 + (*spvDescriptorSet0.vp_c3)._m0[3].w;
    out.gl_Position.x = _218;
    out.gl_Position.y = _220;
    out.gl_Position.z = _222;
    out.gl_Position.w = _224;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, 0u); dm_cw(dm_gs, dm_p, 17, 0u); dm_cw(dm_gs, dm_p, 18, 0u); dm_cw(dm_gs, dm_p, 19, 0x3f800000u); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

